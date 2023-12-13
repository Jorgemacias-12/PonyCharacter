local mod_items = require("scripts.mod_items")
local pony = require("scripts.pony")
local utils = require("scripts.utils")

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

function mod_functions.useDragonWings()
  local player = Isaac.GetPlayer(0);

  pony.UsedWings = true;
  
  player:AddCacheFlags(CacheFlag.CACHE_FLYING)
  player:AddCacheFlags(CacheFlag.CACHE_SPEED)
  player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
  
  if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
    player:AddNullCostume(pony.dragon_wings_brimstone_costume_id);
  else
    player:AddNullCostume(pony.dragon_wings_costume_id);
  end

  player:EvaluateItems()

  -- Return true in other to play the animation
  return true;
end

function mod_functions.onUpdate()
  local player = Isaac.GetPlayer(0);

  if player:GetName() ~= "Pony" then
    return;
  end

  if Game():GetLevel():GetCurrentRoom():GetFrameCount() ~= 1 then
    return;
  end

  local flyingItems = {
    CollectibleType.COLLECTIBLE_FATE,
    CollectibleType.COLLECTIBLE_HOLY_GRAIL,
    CollectibleType.COLLECTIBLE_DOGMA,
    CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT,
    CollectibleType.COLLECTIBLE_REVELATION
  }

  if pony.UsedWings then

    pony.UsedWings = false;

    if utils.hasAnyCollectible(player, flyingItems) then
      player:AddCacheFlags(CacheFlag.CACHE_SPEED)
      player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
    
    else
      player.canFly = false;

      player:TryRemoveNullCostume(pony.dragon_wings_costume_id)
      player:TryRemoveNullCostume(pony.dragon_wings_brimstone_costume_id)
      player:AddCacheFlags(CacheFlag.CACHE_FLYING)
    end

    player:AddCacheFlags(CacheFlag.CACHE_SPEED)
    player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
    player:EvaluateItems()
  end

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
