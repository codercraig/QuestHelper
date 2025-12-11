# QuestHelper Addon

QuestHelper is an Ashita addon designed to help players track quests, missions, and guides within Final Fantasy XI. It features an intuitive UI and support for a custom LUA-based quest configuration, enabling easy creation and customization of guides.

---

## Features

- **Quest and Mission Tracking**: Organise quests by category and missions by steps.
- **Step Completion**: Track individual steps and mark them as completed.
- **Multiple Steps and Images**: Add multiple steps and images for a mission.
- **Customization**: Offset highlights for precise positioning.

---

## Installation

1. Place the `QuestHelper` addon in the `addons` directory of your Ashita installation.
2. Place your JSON quest files in the `addons/QuestHelper/data/` directory.
3. Start the addon in-game using `/load questhelper`.

---

## LUA Format for Quests

The LUA files in the `data/` directory define quests, missions and steps. Below is the structure:

### General Format

Will create a player LUA format to add your own guides.

---

## Credits and Thanks

This addon wouldn't have been possible without the incredible work and support from the Ashita community. Special thanks to:

### Core Contributors

- **[Atom0s](https://github.com/atom0s)** - Floor ID detection and Texture loading code samples via Ashita Discord
- **[Thorny](https://github.com/ThornyFFXI)** - Key items packet handling, and Ashita development support via Ashita Discord
- **[Loonsies](https://github.com/loonsies/boussole)** - DAT map loading implementation from [Boussole](https://github.com/loonsies/boussole)
  - Map table memory scanning and signature detection
  - ImageHeader structure and bitmap/DXT parsing
  - DXT texture decompression support
  - DAT index calculation from map entries

### Additional References

- **[MalRD](https://github.com/MalRD/)** - Item finding and inventory reference code
- **[Jyouya/Will](https://github.com/Jyouya/targetlines)** - Target lines base code references used to draw from player -> NPC.

---

## License

QuestHelper is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

This project uses code and techniques from various open-source projects in the FFXI community. All original authors are credited above. Please respect their licenses and contributions.

If you use this code, please maintain these credits - Thank you! - Oxos