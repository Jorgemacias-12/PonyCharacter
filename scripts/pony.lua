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
pony.SPEED = 0;
pony.FIREDELAY = -1.0;
pony.SHOOTSPEED = -0.2;
pony.TEARHEIGHT = 2;
pony.TEARFALLINGSPEED = 0;
pony.LUCK = -0.5;
pony.FLYING = false;
pony.TEARFLAG = 0;
pony.TEARCOLOR = Color(0.0, 1.0, 0.5, 1.0, 0, 0, 0)

function pony.init()
  ---@class EntityPlayer
  local player = Isaac.GetPlayer(0);

  if player:GetName() ~= "Pony" then
    return;
  end

  -- Add pony initial items
  pony.addInitialItems();

  -- Add initial costume
  pony.applyCostume();

  -- Add initial stats
  pony.applyInitialStats();
end

function pony.addInitialItems()
  ---@class EntityPlayer
  local player = Isaac.GetPlayer(0);

  player:AddCollectible(mod_items.DragonHoardItem, 2, true);
  player:SetPocketActiveItem(mod_items.DragonWingsItem, 2, true)
end

function pony.applyCostume()
  ---@class EntityPlayer
  local player = Isaac.GetPlayer(0);
  
  if not player.CanFly then
    player:AddNullCostume(pony.dragon_hoard_costume_id);
    player:AddNullCostume(pony.body_costume_id);
    player:AddNullCostume(pony.hair_costume_id);
  end
end

function pony.applyInitialStats()
  ---@class EntityPlayer
  local player = Isaac.GetPlayer(0);

  player.Damage = player.Damage + pony.DAMAGE;
  player.FireDelay = player.FireDelay + pony.FIREDELAY;
  player.ShotSpeed = player.ShotSpeed + pony.SHOOTSPEED;
  player.TearHeight = player.TearHeight + pony.TEARHEIGHT;
  player.Luck = player.Luck + pony.LUCK;
  player.TearColor = pony.TEARCOLOR;
end

function pony.updateStats(cacheFlag)
  
  ---@class EntityPlayer 
  local player = Isaac.GetPlayer(0);

  if player:GetName() ~= "Pony" then
    return;
  end

  -- Apply default pony stats
  if cacheFlag == CacheFlag.CACHE_DAMAGE then
    player.Damage = player.Damage + pony.DAMAGE
  end
  if cacheFlag == CacheFlag.CACHE_FIREDELAY then
    player.MaxFireDelay = player.MaxFireDelay - pony.FIREDELAY
  end
  if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
    player.ShotSpeed = player.ShotSpeed + pony.SHOTSPEED
  end
  if cacheFlag == CacheFlag.CACHE_RANGE then
    player.TearHeight = player.TearHeight - pony.TEARHEIGHT
    player.TearFallingSpeed = player.TearFallingSpeed + pony.TEARFALLINGSPEED
  end
  if cacheFlag == CacheFlag.CACHE_SPEED then
    player.MoveSpeed = player.MoveSpeed + pony.SPEED
  end
  if cacheFlag == CacheFlag.CACHE_LUCK then
    player.Luck = player.Luck + pony.LUCK
  end
  if cacheFlag == CacheFlag.CACHE_TEARFLAG then
    player.TearFlags = player.TearFlags | pony.TEARFLAG
  end
  if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
    player.TearColor = pony.TEARCOLOR
  end

  -- Allow to users to fly with dragon wings item
  if cacheFlag == CacheFlag.CACHE_FLYING then
    if pony.UsedWings then
      player.CanFly = true;
    end
  end

end

return pony
