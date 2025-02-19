# QuestHelper Addon

QuestHelper is an Ashita addon designed to help players track quests, missions, and guides within Final Fantasy XI. It features an intuitive UI and support for JSON-based quest configuration, enabling easy creation and customization of guides. HD maps taken form Remapster project for the HD map creation.

---

## Features

- **Quest and Mission Tracking**: Organize quests by category and missions by steps.
- **Step Completion**: Track individual steps and mark them as completed.
- **Image Support**: Attach maps or other images with highlights to each step - remapster rpoject
- **Highlighting on Maps**: Visual markers (e.g., green boxes) to guide players.
- **Multiple Steps and Images**: Add multiple steps and images for a mission.
- **Customization**: Offset highlights for precise positioning.

---

## Installation

1. Place the `QuestHelper` addon in the `addons` directory of your Ashita installation.
2. Place your JSON quest files in the `addons/QuestHelper/data/` directory.
3. Start the addon in-game using `/load questhelper`.

---

## LUA Format for Quests

The LUA files in the `data/` directory define quests, missions, steps, and associated images. Below is the structure:

### General Format

Will create a player LUA format to add your own guides.