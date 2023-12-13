local utils = require("scripts.utils")

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

function pony.applyCostume(player)
  if player:GetName() ~= "Pony" then
    return
  end

  local flyingItems = {
    CollectibleType.COLLECTIBLE_FATE,
    CollectibleType.COLLECTIBLE_HOLY_GRAIL,
    CollectibleType.COLLECTIBLE_DOGMA,
    CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT,
    CollectibleType.COLLECTIBLE_REVELATION
  }

  if player.CanFly then
    player:AddNullCostume(pony.hair_costume_id)

    if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
      player:AddNullCostume(pony.dragon_wings_brimstone_costume_id)
    elseif utils.hasAnyCollectible(player, flyingItems) then
      player:AddNullCostume(pony.dragon_wings_costume_id)
    end
  
  else
    player:TryRemoveNullCostume(pony.dragon_wings_costume_id)
    player:TryRemoveNullCostume(pony.dragon_wings_brimstone_costume_id)
    player:AddNullCostume(pony.body_costume_id)
    player:AddNullCostume(pony.hair_costume_id)
  end

end

return pony
