local pony = require("scripts.pony")
local utils = require("scripts.utils")
local mod_items = require("scripts.mod_items")

local mod_functions = {}

function mod_functions.playerInit(entiy_player)
  pony.init();
end

---@param collectibleType CollectibleType
---@param player EntityPlayer
function mod_functions.onUseItem(_, collectibleType, charge, player)
  print("onUseItem called")
  print("CollectibleType:", collectibleType)
  print("Player:", player)

  if not player or collectibleType ~= mod_items.DragonWingsItem then
    return;
  end

  local hasBrimstone = player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE);

  player:AddCacheFlags(CacheFlag.CACHE_FLYING)
  player:AddCacheFlags(CacheFlag.CACHE_SPEED)
  player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)


  if hasBrimstone then
    player:AddNullCostume(pony.dragon_wings_brimstone_costume_id)
  else
    player:AddNullCostume(pony.dragon_wings_costume_id)
  end

  player:EvaluateItems()
  return true
end

function mod_functions.onUpdate()

  ---@class EntityPlayer
  local player = Isaac.GetPlayer(0);

  local game = Game();
  local level = game:GetLevel();
  local room = level:GetCurrentRoom();
  local frameCount = room:GetFrameCount();

  -- TODO: change costume efficiently

  if frameCount == 1 then
    if pony.UsedWings then
      
      local flyingCollectibles = {
        CollectibleType.COLLECTIBLE_FATE,
        CollectibleType.COLLECTIBLE_HOLY_GRAIL,
        CollectibleType.COLLECTIBLE_DOGMA,
        CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT,
        CollectibleType.COLLECTIBLE_REVELATION
      }

      local hasAnyFlyingCollectible = utils.hasAnyCollectible(player, flyingCollectibles);

      if hasAnyFlyingCollectible then
        pony.UsedWings = false;
        player:AddCacheFlags(CacheFlag.CACHE_SPEED)
        player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
      else
        player.CanFly = false;

        -- Remove flying costume
        player:TryRemoveNullCostume(pony.dragon_wings_brimstone_costume_id);
        player:TryRemoveNullCostume(pony.dragon_wings_costume_id);

        player:AddCacheFlags(CacheFlag.CACHE_FLYING)
        player:AddCacheFlags(CacheFlag.CACHE_SPEED)
        player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
      end

      player:EvaluateItems();
    end
  end
end

---@param player EntityPlayer
function mod_functions.postPeffectUpdate(_, player)
  local hasDragonHoard = player:HasCollectible(mod_items.DragonHoardItem);

  if hasDragonHoard then
    player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
    player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY)
    player:AddCacheFlags(CacheFlag.CACHE_SHOTSPEED)
    player:AddCacheFlags(CacheFlag.CACHE_LUCK)
    player:EvaluateItems()
  end
end

function mod_functions.entityTakeDmg(entity, dmg_amount, dmg_flag, dmg_src, dmg_countdown)
end

function mod_functions.useItem(collectibleType, charge, player)
end

---@param player EntityPlayer
---@param cacheFlag CacheFlag
function mod_functions.evaluateCache(self, player, cacheFlag)
  pony.updateStats(cacheFlag);

  -- If dragon hoard item is held apply this logic
  local hasDragonHoard = player:HasCollectible(mod_items.DragonHoardItem);

  -- Check if the BirthRight item is used by the player
  local hasBirthRight = player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT);

  -- Get player coins
  local playerCoins = player:GetNumCoins();

  -- Define balance values in a array (table)
  local balanceValues = {
    LuckCap = 10,
    DamageCap = 5,
    NormalFireDelayCaps = { 50, 28 },
    BirthRightFireDelayCap = 30,
    NormalShotSpeedCaps = { 63, 35 },
    BirthRightShotCap = 80,
  }

  local coinCheckValues = {
    51,
    36
  }

  if hasDragonHoard then
    if cacheFlag == CacheFlag.CACHE_LUCK then
      player.Luck = player.Luck + playerCoins / balanceValues.LuckCap;
    end

    if cacheFlag == CacheFlag.CACHE_DAMAGE then
      player.Damage = player.Damage + playerCoins / balanceValues.DamageCap;
    end
    
    if cacheFlag == CacheFlag.CACHE_FIREDELAY then      
      

      if hasBirthRight then
        player.MaxFireDelay = player.MaxFireDelay - playerCoins / balanceValues.BirthRightFireDelayCap;
      else
        if playerCoins < coinCheckValues[1] then
          player.MaxFireDelay = player.MaxFireDelay - playerCoins / balanceValues.NormalFireDelayCaps[2];
        end

        if playerCoins >= coinCheckValues[1] then
          player.MaxFireDelay = player.MaxFireDelay - balanceValues.NormalFireDelayCaps[1] / balanceValues.NormalFireDelayCaps[2];
        end
      end
    end

    if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
      if hasBirthRight then
        player.ShotSpeed = player.ShotSpeed + playerCoins / balanceValues.BirthRightShotCap
      end

      if playerCoins < coinCheckValues[2] then
        player.ShotSpeed = player.ShotSpeed + playerCoins / balanceValues.NormalShotSpeedCaps[1];
      end
      if playerCoins >= coinCheckValues[2] then
        player.ShotSpeed = player.ShotSpeed + balanceValues.NormalShotSpeedCaps[2] / balanceValues.NormalShotSpeedCaps
        [1];
      end
    end
  end

  if cacheFlag == CacheFlag.CACHE_FLYING then
    if pony.UsedWings then
      player.CanFly = true;
    end
  end

  -- !! Refactor to apply this when dragon wings are in use.
  -- if player.CanFly then
  --   if cacheFlag == CacheFlag.CACHE_SPEED then
  --     local speedIncrement = 0.3;
  --     player.MoveSpeed = player.MoveSpeed + speedIncrement;
  --   end

  --   if cacheFlag == CacheFlag.CACHE_TEARFLAG then
  --     player.TearFlags = player.TearFlags | TearFlags.TEAR_SPECTRAL
  --   end
  -- end
end

return mod_functions