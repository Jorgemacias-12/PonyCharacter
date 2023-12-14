local utils = require("scripts.utils")
local mod_items = require("scripts.mod_items")

local pony = {}

pony.UsedWings = false
pony.hair_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2")
pony.body_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/PonyBody.anm2")
pony.dragon_hoard_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/DragonHoard.anm2")
pony.dragon_hoard_alt_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/DragonHoard_ALT.anm2") -- Shows only the WalkUp tail animation,
pony.dragon_wings_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/DragonWings.anm2")         -- Useful for items that distort the body.
pony.dragon_wings_brimstone_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/DragonWingsBrimstone.anm2")
pony.custom_infestation_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/custom_infestation.anm2")
pony.custom_libra_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/custom_libra.anm2")
pony.custom_uranus_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/custom_uranus.anm2")
pony.custom_varicose_veins_costume_id = Isaac.GetCostumeIdByPath("gfx/characters/custom_varicoseveins.anm2")

pony.DAMAGE = -1.0;
pony.FIREDELAY = -1.0;
pony.SHOOTSPEED = -0.2;
pony.TEARHEIGHT = 2;
pony.TEARFALLINGSPEED = 0;
pony.LUCK = -0.5;
pony.FLYING = false;
pony.TEARFLAG = 0;
pony.TEARCOLOR = Color(0.0, 1.0, 0.5, 1.0, 0, 0, 0);

-- TODO: apply costumes reading a json file to improve code quality
function pony.applyCostume(player)
  if player:GetName() ~= "Pony" then
    return;
  end

  if player.CanFly then
    -- !! Validate if the item has `applyWhenFly` boolean to true
    for itemId, costumeValues in pairs(mod_items.itemsToCostumeMap) do
      local hasItem = player:HasCollectible(itemId);

      if hasItem then
        for _, costumeValue in ipairs(costumeValues) do
          if type(costumeValue) == "boolean" then
            if not costumeValue then
              break;
            end
          else
            player:AddNullCostume(costumeValue);
          end
        end
      end
    end
  end

  if not player.CanFly then
    player:AddNullCostume(pony.body_costume_id)
    player:AddNullCostume(pony.hair_costume_id)
  end

  -- !! Apply custom costumes here
  for itemId, costumeValues in pairs(mod_items.itemsToCostumeMap) do
    local hasItem = player:HasCollectible(itemId);

    if hasItem then
      for _, costumeValue in ipairs(costumeValues) do
        if type(costumeValue) == "boolean" and not costumeValue then
          return;
        end      

        if type(costumeValue) ~= "boolean" then
          player:AddNullCostume(costumeValue);
        end
      end
    end
  end
end

return pony
