# Floor Detection Test Scenarios

## Test Criteria

### Single-Floor Zones
- **Zone has 1 image, no _1 suffix**
  - Expected: Arrow always draws when in this zone
  - Example: Dangruf Wadi (single map)

### Multi-Floor Zones
- **Zone has multiple images with _1, _2, _3 suffixes**
  - Expected: Arrow only draws on map matching current floor
  - Example: Aydeewa Subterrane (6 floors), Beadeaux (2 floors)

### Zone-to-Zone Transitions
1. **Single Zone A → Single Zone B**
   - Expected: Arrow stops drawing in Zone A, starts drawing in Zone B

2. **Multi-Floor Zone A → Single Zone B**
   - Expected: Arrow stops drawing on Zone A floors, starts drawing in Zone B

3. **Single Zone A → Multi-Floor Zone B**
   - Expected: Arrow stops in Zone A, starts on Zone B's current floor only

4. **Multi-Floor Zone A → Multi-Floor Zone B**
   - Expected: Arrow stops on Zone A floors, starts on Zone B's current floor only

### Within-Zone Floor Changes
- **Moving between floors in same multi-floor zone**
  - Expected: Arrow follows to new floor (updates every 5 seconds)
  - Example: Walk from Aydeewa floor 1 → floor 2 → floor 3

## Test Checklist

Use `/qh_test_floors` command to validate:

### Arrow Drawing Tests
- [ ] Bastok Mines (single floor) → Arrow draws
- [ ] Bastok Mines → Beadeaux (multi) → Arrow draws on current floor only
- [ ] Beadeaux floor 1 → floor 2 → Arrow follows
- [ ] Beadeaux → Dangruf Wadi (single) → Arrow draws
- [ ] Dangruf Wadi → Aydeewa (6 floors) → Arrow on current floor only
- [ ] Aydeewa floor 1→2→3→4→5→6 → Arrow follows each time
- [ ] Aydeewa → Bastok Mines → Arrow draws

### Auto-Scroll Tests (NEW!)
- [ ] Zone change triggers auto-scroll to matching image
- [ ] Floor change triggers auto-scroll to matching floor's image
- [ ] Chat shows "Auto-scrolled to [zone] (floor N)" message
- [ ] Manual scrolling still works after auto-scroll
- [ ] Auto-scroll doesn't trigger when already on correct image

## Debug Information Format

For each scenario, log:
```
Zone: [zone_name] (ID: [zone_id])
Images in step: [count]
  - Image 1: [filename] → Floor [N]
  - Image 2: [filename] → Floor [N]
Is Multi-Floor: [yes/no] (detected via: [method])
Player Floor ID: [raw_id] → Mapped: [floor_num]
Should Draw Arrow:
  - Image 1: [yes/no] (reason: [zone_match/floor_match/floor_mismatch])
  - Image 2: [yes/no] (reason: ...)
```

## Expected Behavior Matrix

| Current Zone Type | Target Zone Type | Expected Behavior |
|------------------|------------------|-------------------|
| Single Floor | Single Floor | Arrow disappears in old zone, appears in new zone |
| Single Floor | Multi-Floor | Arrow disappears in old zone, appears on current floor of new zone |
| Multi-Floor | Single Floor | Arrow disappears on all floors of old zone, appears in new zone |
| Multi-Floor | Multi-Floor | Arrow disappears on all floors of old zone, appears on current floor of new zone |
| Same Multi-Floor | Same Multi-Floor (different floor) | Arrow moves from old floor to new floor |

## Common Issues to Watch For

1. **Sticky arrows**: Arrow remains on old zone after transition
2. **Multi-arrow bug**: Arrow appears on multiple floors simultaneously
3. **No arrow on transition**: Arrow disappears completely when changing zones
4. **Floor lag**: Arrow doesn't update for 5+ seconds when changing floors
