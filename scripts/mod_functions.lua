local pony = require("scripts.pony")
local utils = require("scripts.utils")
local mod_items = require("scripts.mod_items")

local mod_functions = {}

function mod_functions.playerInit(entiy_player)
  pony.init();
end

function mod_functions.useDragonWings()

end

function mod_functions.onUpdate()
end

function mod_functions.postPeffectUpdate(currentPlayer)

end

function mod_functions.entityTakeDmg(entity, dmg_amount, dmg_flag, dmg_src, dmg_countdown)
end

function mod_functions.useItem(collectibleType, charge, player)
end

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