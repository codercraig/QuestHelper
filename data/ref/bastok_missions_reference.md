# Bastok Missions Reference Data

This file contains scraped data from LandSandBoat server and FFXIclopedia for mission creation.

## Mission 2-3: The Emissary

### Wiki Data
- **Mission Number:** 2-3
- **Starting NPC:** Any Bastok Gate Guard (or Naji in Metalworks at J-8)
- **Recommended Level:** 25+ (Level Restriction 99, soloable at 35+)

#### Key Items
- Dark Key (for San d'Oria → Windurst route)
- Sword Offering & Dull Sword (for Windurst → San d'Oria route)
- Aspir Knife (Windurst route only; dropped by Eyy Mon the Ironbreaker)

#### NPCs
- Naji (Metalworks J-8)
- Helaku & Baraka (Consulate of Bastok, Northern San d'Oria K-10)
- Halver (Chateau d'Oraguille I-9)
- Melek & Gold Skull (Consulate of Bastok, Port Windurst F-6)
- Kupipi (Heavens Tower)

#### Walkthrough - San d'Oria First Route
1. Talk to Naji (Metalworks J-8)
2. Visit San d'Oria consulate (Northern San d'Oria K-10) - talk to Baraka and Helaku
3. Go to Chateau d'Oraguille (I-9) - talk to Halver
4. Travel to Ghelsba Outpost (H-7) - defeat Warchief Vatgit
5. Return to Helaku (Northern San d'Oria K-10)
6. Travel to Windurst - talk to Melek (Port Windurst F-6)
7. Go to Heavens Tower - talk to Kupipi to get Dark Key
8. Battle "Black Dragon" and "Searcher" in Balga's Dais
9. Return to complete mission

### Server Data (LandSandBoat)

#### Event IDs
- 1001: Mission acceptance
- 48: Windurst path initiation
- 581: Sandoria path initiation
- 501: Halver dialogue (Chateau d'Oraguille)
- 536: Helaku initial progression
- 539: Baraka dialogue
- 542: Helaku mid-mission dialogue
- 543: Helaku final progression
- 556: Shakir dialogue
- 61, 537, 714, 713: Path progression and completion

#### Progression Status
- Status 0: Not started
- Status 1: After obtaining Consuls Letter
- Status 2: Initial Sandoria state
- Status 3: After Helaku event 536
- Status 4: After Halver event 501
- Status 5: After defeating Warchief Vatgit
- Status 6: Mission complete

---

## Mission 3-1: The Four Musketeers

### Wiki Data
- **Mission Number:** 3-1
- **Recommended Level:** 30+

#### Key NPCs
- Bastok Gate Guard - initial contact
- Iron Eater (Metalworks J-8) - provides mission details

#### Walkthrough
1. Talk to Bastok Gate Guard
2. Speak with Iron Eater twice in Metalworks (J-8)
3. Zone into Beadeaux for cutscene
4. Kill 20 Copper Quadav while in Beadeaux
5. Zone into Pashhow Marshlands for completion cutscene

#### Zones
- Metalworks
- Konschtat Highlands
- Pashhow Marshlands
- Beadeaux

### Server Data (LandSandBoat)

#### Event IDs
- 1001: Mission acceptance
- 1002: Mission progression events
- 715: Iron Eater initial encounter
- 716: Iron Eater follow-up event
- 717: Naji event trigger
- 718: Ayame event trigger
- 120: Beadeaux zone entry
- 10: Pashhow Marshlands progression
- 11: Pashhow Marshlands completion

#### Progression
- Accept mission → status 0
- Talk to Iron Eater (715) → status 1
- Enter Beadeaux → status 2
- Defeat 20 Copper Quadav → status 2-21
- Exit to Pashhow Marshlands → status 22 (completion)

#### Reward
350 Rank Points

---

## Mission 3-2: To the Forsaken Mines

### Wiki Data
- **Mission Number:** 3-2
- **Recommended Level:** 30+

#### Key NPCs
- Bastok Gate Guard
- Davyad (optional, Bastok Mines K-6)

#### Items Needed
- Hare Meat (drops from rabbits or Auction House)

#### Walkthrough
1. Accept mission from Bastok Gate Guard
2. Obtain Hare Meat
3. Travel to Gusgen Mines via Konschtat Highlands (L-7)
4. Trade meat to ??? at Gusgen Mines (J-7) to spawn Blind Moby
5. Defeat Blind Moby to obtain Glocolite
6. Return Glocolite to Bastok Gate Guard

#### Zones
- Konschtat Highlands
- Gusgen Mines

### Server Data (LandSandBoat)

#### Event IDs
- 1001: Mission acceptance
- 1002: NPC interaction during active mission
- 1006: Completion event (when item already obtained)
- 1010: Progress event (when item needs to be obtained)
- 54: Davyad interaction event

#### Progression
- Status 0: Accept mission
- Trade Hare Meat to quest marker → spawn Blind Moby
- Defeat Blind Moby → obtain Glocolite
- Return to gate guard → completion

#### Reward
400 Rank Points

---

## Mission 3-3: Jeuno

### Wiki Data
- **Mission Number:** 3-3
- **Recommended Level:** 40+ (with Sneak/Invisible) or 50+

#### Items Needed
- Delkfutt Key (from defeating Porphyrion)

#### Key NPCs
- Bastok Gate Guard
- Lucius (Metalworks I-9)
- Goggehn (Ru'Lude Gardens H-10)

#### Walkthrough
1. Receive mission from Bastok Gate Guard
2. Visit Lucius at Metalworks to obtain "Letter to the Ambassador"
3. Travel to Ru'Lude Gardens and speak with Goggehn
4. Navigate Delkfutt's Tower (10 floors)
5. Defeat Porphyrion at Floor 10 (H-8) to obtain Delkfutt Key
6. Use key to access basement area
7. Trigger cutscene at basement Cermet Door (L-9)
8. Return to Ru'Lude Gardens Embassy for reward

#### Zones
- Metalworks
- Ru'Lude Gardens
- Delkfutt's Tower

### Server Data (LandSandBoat)

#### Event IDs
- 1001: Mission acceptance
- 1002: Mission progress events
- 322: Lucius event (Metalworks) - mandatory step
- 38: Completion event (Rulude Gardens)
- 41: Goggehn progress event (status 1)
- 66: Goggehn event (status 2)
- 139: Goggehn event (status 3)
- 1: Lower Delkfutts Tower elevator/door event

#### Progression
- Status 0→1: Accept mission → receive "Letter to the Ambassador" from Lucius
- Status 1→2: Deliver letter to Goggehn in Rulude Gardens
- Status 2→3: Trade/trigger Delkfutt Key at tower elevator, receive key item
- Status 3: Complete mission

#### Reward
5,000 gil + Rank 4
