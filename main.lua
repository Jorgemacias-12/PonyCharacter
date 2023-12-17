-- Import the module containing function definitions for the mod's callbacks.
-- This assumes that 'mod_functions.lua' contains the necessary logic for each event.
local mod_functions = require("scripts.mod_functions")
local mod_items = require('scripts.mod_items')
-- Register the mod with the name "Pony the Dragon! [REP]" and a version number of 1.
local Mod = RegisterMod("Pony the Dragon! [REP]", 1)

-- Get a reference to the game object.
local game = Game()

-- Register various callbacks with the game engine. Each callback is linked to a specific function
-- in the 'mod_functions.lua' file, handling different aspects of the game's events.

-- This callback is triggered after a player character is initialized in the game.
Mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, mod_functions.playerInit)

-- This callback is triggered every game update (typically, this occurs every frame).
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod_functions.onUpdate)

-- This callback is triggered after the effects of a passive item are updated.
Mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, mod_functions.postPeffectUpdate)

-- This callback is triggered when an entity takes damage. It specifically listens for damage taken by the player.
Mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, mod_functions.entityTakeDmg, EntityType.ENTITY_PLAYER)

-- This callback is triggered when a specific item is used. Replace 'your_item_id' with the actual item ID.
Mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod_functions.onUseItem, mod_items.DragonWingsItem)

-- This callback is used to re-evaluate certain cached values, like player stats, whenever they need updating.
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod_functions.evaluateCache)
