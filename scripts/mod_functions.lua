local mod_items = require("scripts.mod_items")
local pony = require("scripts.pony")

local mod_functions = {}

function mod_functions.playerInit(entiy_player)
  local player = Isaac.GetPlayer(0);

  if player:GetName() ~= "Pony" then
    return
  end

  player:AddCollectible(mod_items.DragonHoardItem, 0, true);
  player:AddNullCostume(pony.dragon_hoard_costume_id)
  player:AddNullCostume(pony.body_costume_id)
  player:SetPocketActiveItem(mod_items.DragonWingsItem, 2, true)

  pony.applyCostume(player)

end

function mod_functions.useDragonWings(collectibleType, charge, player)

end

function mod_functions.onUpdate()
end

function mod_functions.postPeffectUpdate()
end

function mod_functions.entityTakeDmg(entity, dmg_amount, dmg_flag, dmg_src, dmg_countdown)
end

function mod_functions.useItem(collectibleType, charge, player)
end

function mod_functions.evaluateCache(player, cacheFlag)
end

return mod_functions
