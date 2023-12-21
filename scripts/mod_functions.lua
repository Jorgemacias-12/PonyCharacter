local pony = require("scripts.pony")
local utils = require("scripts.utils")
local mod_items = require("scripts.mod_items")
local mod_functions = {}

function mod_functions.playerInit(entiy_player)
  pony.init();
end

function mod_functions.onUpdate() 

end

---@param collectibleType CollectibleType
---@param player EntityPlayer
function mod_functions.onUseItem(_, collectibleType, charge, player)
  
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

function mod_functions.entityTakeDmg(_, entity, dmg_amount, dmg_flag, dmg_src, dmg_countdown)
  ---@class EntityPlayer
  local player = Isaac.GetPlayer(0);

  local hasDragonHoard = player:HasCollectible(mod_items.DragonHoardItem);

  local playerCoins = player:GetNumCoins();

  local coinThreshold = 61;

  if hasDragonHoard and dmg_src ~= nil and entity.Type == 1 and dmg_flag ~= DamageFlag.DAMAGE_FAKE and not utils.isSelfDamage(dmg_flag) then
    if playerCoins < coinThreshold then
      player:AddCoins(-1)
    end

    if playerCoins >= coinThreshold then
      player:AddCoins(-2)
    end
  end
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
          player.MaxFireDelay = player.MaxFireDelay -
              balanceValues.NormalFireDelayCaps[1] / balanceValues.NormalFireDelayCaps[2];
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
    -- !! check if the player has dragon wings item to allow to fly and check if also is allowed for him to fly.

    local hasDragonWings = player:HasCollectible(mod_items.DragonWingsItem);

    if hasDragonWings and pony.UsedWings then
      player.CanFly = true;
    else
      player.CanFly = false;
    end
  end

  -- !! Refactor to apply this when dragon wings are in use.

  if cacheFlag == CacheFlag.CACHE_SPEED and player.CanFly and pony.UsedWings then
    local speedIncrement = 0.3;

    player.MoveSpeed = player.MoveSpeed + speedIncrement;
  end

  if cacheFlag == CacheFlag.CACHE_TEARFLAG then
    player.TearFlags = player.TearFlags | TearFlags.TEAR_SPECTRAL
  end
end

function mod_functions.onNPCDeath()
  Isaac.ConsoleOutput("onNPCDeath called \n")

  local spawnChance = math.random(1, 25);

  Isaac.ConsoleOutput("Spawn chance: " .. tostring(spawnChance) .. "\n")

  local HEART_SPAWN_NUMBER = 24;
  local HELP_ITEM_SPAWN_NUMBER = 8;

  ---@class EntityPlayer
  local player = Isaac.GetPlayer(0);

  local isPony = player:GetName() == "Pony";
  local hasBirthRight = player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT);

  if isPony and hasBirthRight then
    local roomEntities = Isaac.GetRoomEntities();

    for _, entity in pairs(roomEntities) do
      local data = entity:GetData();

      entity = entity:ToNPC();

      if entity and entity:IsActiveEnemy(true) then
        if entity:IsDead() and not data.Died then
          data.Died = true;

          local entityToSpawn;

          Isaac.ConsoleOutput("Spawneando moneda \n")

          if spawnChance <= HELP_ITEM_SPAWN_NUMBER then
            Isaac.ConsoleOutput("spawn change coin \n");

            entityToSpawn = Isaac.Spawn(
              EntityType.ENTITY_PICKUP,
              PickupVariant.PICKUP_COIN,
              CoinSubType.COIN_PENNY,
              entity.Position,
              entity.Velocity,
              nil
            );
          end

          if spawnChance == HEART_SPAWN_NUMBER then
            Isaac.ConsoleOutput("Spawneando corazon \n")

            entityToSpawn = Isaac.Spawn(
              EntityType.ENTITY_PICKUP,
              PickupVariant.PICKUP_HEART,
              HeartSubType.HEART_HALF_SOUL,
              entity.Position,
              entity.Velocity,
              nil
            );
          end

          entityToSpawn:GetData().Timer = 60;
        end
      end
    end
  end
end

return mod_functions
