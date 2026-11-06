# CAfirstAidKit
 
A Project Zomboid (Build 42) mod that lets you attach medical kits to the bottom slot of your backpack, the slot that normally only takes sleeping bags.
 
> **Status:** in personal playtesting. Not yet released on the Steam Workshop.
 
## Features
 
- **Medical kits fit the backpack's bottom slot.** Attach a kit the same way you would a sleeping bag.
- **Visible on your character.** Each kit has its own model, positioned for all three bottom-slot sizes (regular, big and ALICE packs).
- **Open it while it's attached.** An attached kit gets its own button in your inventory window, so you can use it without taking it off.
### Supported kits
 
| Item | Model |
| --- | --- |
| `Base.FirstAidKit` | `LunchBoxMedic_bedroll` |
| `Base.FirstAidKit_New` | `LunchBoxMedic_bedroll` |
| `Base.FirstAidKit_NewPro` | `LunchBoxMedic_bedroll` |
| `Base.FirstAidKit_Camping` | `FirstAidCamping_bedroll` |
| `Base.FirstAidKit_Camping_New` | `FirstAidCamping_bedroll` |
| `Base.FirstAidKit_Military` | `FirstAidMilitary_bedroll` |
 
## Installation
 
1. Copy `Contents/mods/CAfirstAidKit` into your user Zomboid `mods` folder:
   - Windows: `C:\Users\<you>\Zomboid\mods\`
   - macOS: `~/Zomboid/mods/`
2. Enable **CAfirstAidKit** in the game's Mods menu, and in the mod list for your save.
3. Fully restart the game after enabling or updating it. Item and model changes only load at startup.
## How it works
 
No vanilla files are edited. Everything is patched from the mod's own files at load time.
 
| File | What it does |
| --- | --- |
| `CA_Fixes.lua` | On `OnGameBoot`, uses `DoParam` to give each kit `AttachmentType = Bedroll` (the type the bottom slot already accepts) and a `StaticModel` for drawing it on the bag. |
| `CA_ModelAdjustments.txt` | Defines the bedroll models. Each reuses its kit's vanilla mesh and texture, with attachment blocks for `bedroll_bottom`, `bedroll_bottom_big` and `bedroll_bottom_alice`. They use new names so vanilla's ground models stay untouched. |
| `CA_ContainerManager.lua` | Fixes a weight bug (see below). |
| `CA_InventoryButton.lua` | On `OnRefreshInventoryWindowContainers` (reason `"buttonsAdded"`, player's own window), adds a container button for each attached container that isn't also equipped. Based on the container loop in `ISInventoryPage:refreshBackpacks()`. |
 
### The container weight fix
 
The bottom slot was built for sleeping bags, which aren't containers. When a container is attached there, the game sets its container's parent to the player, and none of the ways of detaching it clear that link. Afterward the kit reports the **player's inventory weight** as its own, so it looks overfull and refuses new items.
 
There are around eight ways an item can leave a slot, so instead of patching each one, `CA_ContainerManager.lua` fixes broken kits wherever they turn up: on every inventory window refresh, any unattached container whose parent is a player gets its parent reset to `nil`. This also repairs kits that were already broken in older saves.
 
## Known issues
 
- Pressing the bottom slot's hotbar number key to draw the kit into your hand can bring the bug back. Under investigation.
- Model offsets for the smaller kits still need fine-tuning.
- `CA_ContainerManager.lua` uses `getPlayer()`, so split-screen players other than player 1 aren't covered yet.
## Planned
 
- Replace the repeated `DoParam` lines with a table of `{ item, model }` pairs and one loop.
- Split-screen support for the weight fix.
- Check whether `Base.FirstAidKit_Pro` also needs patching.
