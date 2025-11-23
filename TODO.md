# QuestHelper TODO

1.  **Get Player Name:**
    *   Implement a function to retrieve the player's name from the game. This is the foundational step for several new features.

2.  **Item Acquisition Trigger (`trigger_on_item`):**
    *   Add a new trigger that advances the quest when the player obtains a specific item, detected by looking for `"<player name> obtains a <item name>."` in the chat log.

3.  **Enemy Defeat Trigger (`trigger_on_defeat`):**
    *   Create a trigger that completes a step when the player defeats a specific enemy, watching for `"<player name> defeats the <enemy name>."` in the chat.

4.  **Zone & Position Triggers (`trigger_on_zone`, `trigger_on_pos`):**
    *   Implement triggers that advance the quest when the player enters a specified zone or reaches a particular set of coordinates.

5.  **Enhanced Dialogue Triggers:**
    *   Improve the existing `trigger_on_talk` to allow for matching specific dialogue text from an NPC, making quest progression more precise.
