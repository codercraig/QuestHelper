# Floor Detection Logic Flow

## Arrow Drawing Decision Tree

```
For each image in current step:
│
├─ Does image have zone_name? → NO → Skip (no arrow)
│                              ↓ YES
│
├─ Is player in same zone as image? → NO → Skip (zone mismatch)
│   (player_module.zoneId == zone_data[img_data.zone_name])
│                              ↓ YES
│
├─ Is this a multi-floor zone?
│   Detected via 3 methods:
│   1. map_db[zone_name][1] exists (manual config)
│   2. floor_mappings[zone_id] exists (manual config)
│   3. zone_image_counts[zone_name] > 1 (auto-detect from images)
│
│   ├─ NO (Single floor) → DRAW ARROW ✓
│   │
│   └─ YES (Multi-floor)
│       │
│       ├─ Can we detect player floor? → NO → Skip (safety, avoid duplicates)
│       │                                ↓ YES
│       │
│       └─ Does player floor match image floor?
│           (player_floor == this_img_floor)
│           │
│           ├─ NO → Skip (wrong floor)
│           └─ YES → DRAW ARROW ✓
```

## Zone Transition Behavior

### Key Check: Line 161 in ui_images.lua
```lua
if zone_data[img_data.zone_name] and player_module.zoneId == zone_data[img_data.zone_name] then
```

This single check ensures **all zone transitions work correctly**:

| Scenario | Player Zone | Image Zone | Zone Match? | Result |
|----------|-------------|------------|-------------|--------|
| In same zone | Zone A (234) | Zone A (234) | ✓ YES | Continue to floor check |
| Different zone | Zone A (234) | Zone B (184) | ✗ NO | **Skip - no arrow** |
| Zone transition | Zone B (184) | Zone A (234) | ✗ NO | **Skip - no arrow** |

### Example Transitions

**1. Bastok Mines (single) → Beadeaux (multi-floor)**
```
In Bastok:
  - Bastok image: zoneId match (234 == 234) → Draw arrow ✓
  - Beadeaux images: zoneId mismatch (234 != 147) → No arrows ✗

After zoning to Beadeaux:
  - Bastok image: zoneId mismatch (147 != 234) → No arrow ✗
  - Beadeaux floor 1 image: zoneId match (147 == 147) + floor match → Draw arrow ✓
  - Beadeaux floor 2 image: zoneId match (147 == 147) + floor mismatch → No arrow ✗
```

**2. Aydeewa Floor 1 → Aydeewa Floor 2 (within same zone)**
```
On Floor 1:
  - Aydeewa_1 image: zone match + floor match (1 == 1) → Draw arrow ✓
  - Aydeewa_2 image: zone match + floor mismatch (2 != 1) → No arrow ✗
  - Aydeewa_3-6 images: zone match + floor mismatch → No arrows ✗

Move to Floor 2 (5 second update):
  - Aydeewa_1 image: zone match + floor mismatch (1 != 2) → No arrow ✗
  - Aydeewa_2 image: zone match + floor match (2 == 2) → Draw arrow ✓
  - Aydeewa_3-6 images: zone match + floor mismatch → No arrows ✗
```

## Multi-Floor Detection Methods (Prioritized)

### Method 1: Manual map_db Configuration
```lua
map_db["Beadeaux"] = {
    [1] = { origin_x = ..., scale_x = ... },
    [2] = { origin_x = ..., scale_x = ... }
}
```
**Detection**: Checks if `map_db[zone_name][1]` exists (numeric index)

### Method 2: Manual floor_mappings
```lua
floor_mappings = {
    [147] = {  -- Beadeaux zone ID
        [1] = 1,   -- Raw floor ID → map number
        [15] = 2
    }
}
```
**Detection**: Checks if `floor_mappings[zone_id]` exists

### Method 3: Auto-Detection from Images (NEW FIX)
```lua
-- Count images with same zone_name in current step
zone_image_counts["Aydeewa Subterrane"] = 6
```
**Detection**: Checks if `zone_image_counts[zone_name] > 1`

**Priority**: All three methods are OR'd together - if ANY method detects multi-floor, the zone is treated as multi-floor.

## Floor Number Extraction

Images extract floor numbers from filenames:

```lua
-- Pattern: _(\d+)\.png$
"aydeewa_subterrane_1.png" → floor 1
"aydeewa_subterrane_2.png" → floor 2
"beadeaux_1.png" → floor 1
"dangruf_wadi.png" → floor 1 (fallback: occurrence count)
```

## Player Floor Detection

```lua
-- Get raw floor ID from game
local raw_floor = CheckFloorNumber(player_pos)

-- Map to logical floor number (if mapping exists)
if floor_mappings[zone_id] then
    player_floor = floor_mappings[zone_id][raw_floor]
else
    -- Auto-increment: raw ID = floor number
    player_floor = raw_floor
end
```

## Auto-Scroll Feature

When the player changes zones or floors, the image drawer **automatically scrolls** to the relevant map:

**Triggers:**
- Zone ID changes (e.g., Bastok → Beadeaux)
- Floor ID changes (e.g., Aydeewa floor 1 → floor 2)

**Behavior:**
- Finds the matching image (zone + floor)
- Calculates accumulated scroll position
- Calls `imgui.SetScrollY()` to scroll to that image
- Prints notification: "Auto-scrolled to [zone] (floor N)"
- Player can still manually scroll at any time

**Implementation:** [ui_images.lua:91-143](modules/ui_images.lua#L91-L143)

## Test Commands

- `/qh_test_floors` - Full state report (which images, which zones, arrow decisions)
- `/qh_checkfloor` - Raw floor ID detection for current position
- `/qh_debug` - Toggle trigger zone debugging
- `/qh_resetmap` - Force reset to map 1

## Common Scenarios - Expected Behavior

✓ **Single floor zone**: Arrow always visible when in zone
✓ **Multi-floor zone**: Arrow only on current floor
✓ **Zone A → Zone B**: Arrow disappears in A, appears in B
✓ **Floor 1 → Floor 2**: Arrow moves to new floor map (5 sec update)
✓ **No floor mapping + sequential IDs**: Auto-increment works
✓ **No floor mapping + non-sequential IDs**: Need manual mapping

✗ **Multi-arrow bug**: FIXED - won't draw on multiple floors simultaneously
✗ **Sticky arrows**: FIXED - zone check prevents cross-zone drawing
✗ **Missing detection**: FIXED - image count auto-detects multi-floor zones
