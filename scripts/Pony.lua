local Items = require('../scripts/Items')

local Pony = {}

Pony.PonyHair_ID = Isaac.GetCostumeIdByPath("../gfx/characters/PonyHair.anm2")
Pony.PonyBody_ID = Isaac.GetCostumeIdByPath("../gfx/characters/PonyBody.anm2")
Pony.DragonHoard_ID = Isaac.GetCostumeIdByPath("../gfx/characters/DragonHoard.anm2")
Pony.DragonWings_ID = Isaac.GetCostumeIdByPath("../gfx/characters/DragonWings.anm2")
Pony.DragonWingsBrimstone_ID = Isaac.GetCostumeIdByPath("../gfx/characters/DragonWingsBrimstone.anm2")
Pony.CustomInfestation = Isaac.GetCostumeIdByPath("../gfx/characters/custom_infestation.anm2")
Pony.CustomLibra = Isaac.GetCostumeIdByPath("../gfx/characters/custom_libra.anm2")
Pony.Name = "Pony"
Pony.HasDragonHoard = false
Pony.numcollect = 0
Pony.UsedWings = false
Pony.DAMAGE = 0
Pony.FIREDELAY = 0
Pony.SHOTSPEED = 0.0
Pony.TEARHEIGHT = 2
Pony.TEARFALLINGSPEED = 0
Pony.LUCK = 1
Pony.FLYING = false
Pony.TEARFLAG = 0
Pony.TEARCOLOR = Color(0, 1.0, 0.5, 1.0, 0, 0, 0)

function Pony:InitPony()
  -- Get plyer
  local player = Isaac.GetPlayer();

  -- Add initial items when player name is Pony

  if player:GetName() == self.Name then
    player:AddCollectible(Items.DragonHoardItem, 0, true);
    player:SetPocketActiveItem(Items.DragonWingsActive, Items.DragonWingsActiveSlot, true);
  end

  self.UpdateDragonHoard(player);

  if not player:GetName() == self.Name then
    return;
  end

  if player.CanFly then
    -- This if's are for apply skins specific for the
    -- given item

    if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
      player:AddNullCostume(self.PonyHair_ID)
      player:AddNullCostume(self.DragonWingsBrimstone_ID)
    end

    if player:HasCollectible(CollectibleType.COLLECTIBLE_FATE) or
        player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_GRAIL) or
        player:HasCollectible(CollectibleType.COLLECTIBLE_DOGMA) or
        player:HasCollectible(CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT) or
        player:HasCollectible(CollectibleType.COLLECTIBLE_REVELATION) then
      player:AddNullCostume(self.PonyHair_ID)
      player:AddNullCostume(self.Dragonwings_ID)
    end

    player:AddNullCostume(self.PonyHair_ID)
  end

  if not player.CanFly then
    player:TryRemoveNullCostume(self.DragonWings_ID)
    player:TryRemoveNullCostume(self.DragonWingsBrimstone_ID)
    player:AddNullCostume(self.PonyBody_ID)
    player:AddNullCostume(self.PonyHair_ID)
  end

  if player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION) then
    local currentCosmetics = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_INFESTATION)
    player:RemoveCostume(currentCosmetics)
    player:AddNullCostume(self.CustomInfestation)
  end

  if player:HasCollectible(CollectibleType.COLLECTIBLE_LIBRA) then
    local currentCosmetics = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_LIBRA)
    player:RemoveCostume(currentCosmetics)
    player:AddNullCostume(self.CustomLibra)
  end

  if player:HasCollectible(self.DragonHoardItem) then
    player:AddNullCostume(self.DragonHoard_ID)
  end

  if player:HasCollectible(CollectibleType.COLLECTIBLE_CEREMONIAL_ROBES) then
    player:TryRemoveNullCostume(self.PonyHair_ID)
  end

  if player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_OF_THE_MARTYR) then
    player:AddNullCostume(self.PonyHair_ID)
  end
end

function Pony:AddCostume()
  self.InitPony(self)
end

function Pony:UpdateDragonHoard(player)
  HasDragonHoard = player:HasDragonHoard(Items.DragonHoardItem)
end

function Pony:OnUpdate()
  local player = Isaac.GetPlayer()

  self.numcollect = player:GetCollectibleCount()

  if player:GetName() == self.Name and
      self.numcollect ~= player:GetCollectibleCount() then
    self.AddCostume(self)
  end

  if player:GetName() == Pony.Name then
    local currentItem = player:GetActiveItem(ActiveSlot.SLOT_PRIMARY)

    if currentItem == nil then
      return
    end

    local spriteMapping = Items.SpriteMapping[currentItem];

    local spriteInfo = spriteMapping[UsedWings]

    local collectible = Isaac.GetItemConfig():GetCollectible(currentItem)

    player:ReplaceCostumeSprite(collectible, spriteInfo.path, spriteInfo.index);
  end
end

function Pony:Update()
  local player = Isaac.GetPlayer()

  if player:HasCollectible(Items.DragonhoardItem) then
    player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
    player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY)
    player:AddCacheFlags(CacheFlag.CACHE_SHOTSPEED)
    player:AddCacheFlags(CacheFlag.CACHE_LUCK)
    player:EvaluateItems()
  end

  self.DisableWingsAfterNextRoom(self)
end

function Pony:TakeDamage(entity, dmg_amount, dmg_flag, dmg_src, dmg_countdown)
  local player = Isaac.GetPlayer()

  if player:HasCollectible(Items.DragonHoardItem) and
      entity.Type == 1 then
    player:AddCoins(-1)
  end
end

function Pony:ActivateWings()
  local player = Isaac.GetPlayer()

  self.UsedWings = true

  if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
    player:AddCacheFlags(CacheFlag.CACHE_FLYING)
    player:AddCacheFlags(CacheFlag.CACHE_SPEED)
    player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
    player:AddNullCostume(self.DragonWingsBrimstone_ID)
    player:EvaluateItems()

    return true
  end

  player:AddCacheFlags(CacheFlag.CACHE_FLYING)
  player:AddCacheFlags(CacheFlag.CACHE_SPEED)
  player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
  player:AddNullCostume(self.DragonWings_ID)
  player:EvaluateItems()

  return true
end

function Pony:DisableWingsAfterNextRoom()
  local player = Isaac.GetPlayer()

  local NEXT_ROOM = 1

  if Game():GetLevel():GetCurrentRoom():GetFrameCount() == NEXT_ROOM then
    if self.UsedWings then
      if player:HasCollectible(CollectibleType.COLLECTIBLE_FATE) or player:HasCollectible
          (CollectibleType.COLLECTIBLE_HOLY_GRAIL) or player:HasCollectible(CollectibleType.COLLECTIBLE_DOGMA) or player:HasCollectible(CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT) or player:HasCollectible(CollectibleType.COLLECTIBLE_REVELATION) then --If the player gets any of these items, flying won't deactivate after entering next room
        UsedWings = false
        player:AddCacheFlags(CacheFlag.CACHE_SPEED)
        player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
        player:EvaluateItems()
      else
        UsedWings = false
        player.CanFly = false
        player:TryRemoveNullCostume(Pony.DragonWings_ID)
        player:TryRemoveNullCostume(Pony.DragonWingsBrimstone_ID)
        player:AddCacheFlags(CacheFlag.CACHE_FLYING)
        player:AddCacheFlags(CacheFlag.CACHE_SPEED)
        player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
        player:EvaluateItems()
      end
    end
  end
end

function Pony:OnCache(player, cacheFlag)
  local coins = player:GetNumCoins()

  local FIRST_THRESHOLD = 31
  local SECOND_THRESHOLD = 51

  local RATIO = 30

  if player:GetName() == self.Name then
    if cacheFlag == CacheFlag.CACHE_DAMAGE then
      player.MaxFireDelay = player.MaxFireDelay - Pony.FIREDELAY
    end

    if cacheFlag == CacheFlag.CACHE_FIREDELAY then
      player.MaxFireDelay = player.MaxFireDelay - Pony.FIREDELAY
    end

    if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
      player.ShotSpeed = player.ShotSpeed + Pony.SHOTSPEED
    end

    if cacheFlag == CacheFlag.CACHE_RANGE then
      player.TearHeight = player.TearHeight - Pony.TEARHEIGHT
      player.TearFallingSpeed = player.TearFallingSpeed + Pony.TEARFALLINGSPEED
    end

    if cacheFlag == CacheFlag.CACHE_SPEED then
      player.MoveSpeed = player.MoveSpeed + Pony.SPEED
    end

    if cacheFlag == CacheFlag.CACHE_LUCK then
      player.Luck = player.Luck + Pony.LUCK
    end

    if cacheFlag == CacheFlag.CACHE_TEARFLAG then
      player.TearFlags = player.TearFlags | Pony.TEARFLAG
    end

    if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
      player.TearColor = Pony.TEARCOLOR
    end

    -- Dragon Wings application
    if cacheFlag == CacheFlag.CACHE_FLYING then
      if UsedWings then
        player.CanFly = true
      end
    end
  end

  if player:HasCollectible(Items.DragonHoardItem) then
    if cacheFlag == CacheFlag.CACHE_LUCK then
      player.Luck = player.Luck + player:GetNumCoins() / 10
    end

    if cacheFlag == CacheFlag.CACHE_DAMAGE then
      player.Damage = player.Damage + player:GetNumCoins() / 6
    end

    if cacheFlag == CacheFlag.CACHE_FIRE_DELAY then
      if coins < FIRST_THRESHOLD then
        player.MaxFireDelay = player.MaxFireDelay - coins / 20;
      end

      if coins >= SECOND_THRESHOLD then
        player.MaxFireDelay = player.MaxFireDelay - RATIO / RATIO
      end
    end

    if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
      if coins < FIRST_THRESHOLD then
        player.ShotSpeed = player.ShotSpeed + coins / 65
      end

      if coins >= FIRST_THRESHOLD then
        player.ShotSpeed = player.ShotSpeed + 30 / 65
      end
    end
  end

  if UsedWings then
    --Adds a bit of speed while Dragon Wings is active
    if cacheFlag == CacheFlag.CACHE_SPEED then
      player.MoveSpeed = player.MoveSpeed + 0.2
    end

    --Adds spectral tears while Dragon Wings is active
    if cacheFlag == CacheFlag.CACHE_TEARFLAG then
      player.TearFlags = player.TearFlags | TearFlags.TEAR_SPECTRAL
    end
  end
end

return Pony;
