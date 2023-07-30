-- ///Basic Mod information ///
local NewMod = RegisterMod("PonyCharacter", 1)
local game = Game()

-- ///New items ///
local DragonhoardItem = Isaac.GetItemIdByName("Dragon Hoard")
local DragonwingsActive = Isaac.GetItemIdByName("Dragon Wings")
local UsedWings = false --Dragon Wings is deactivated by default

-- ///Hair and body layer paths ///
local Ponyhair_ID = Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2")
local Ponybody_ID = Isaac.GetCostumeIdByPath("gfx/characters/PonyBody.anm2")
local Dragonhoard_ID = Isaac.GetCostumeIdByPath("gfx/characters/DragonHoard.anm2")
local Dragonwings_ID = Isaac.GetCostumeIdByPath("gfx/characters/DragonWings.anm2")
local DragonwingsBrimstone_ID = Isaac.GetCostumeIdByPath("gfx/characters/DragonWingsBrimstone.anm2")
local CustomInfestation = Isaac.GetCostumeIdByPath("gfx/characters/custom_infestation.anm2")
local CustomLibra = Isaac.GetCostumeIdByPath("gfx/characters/custom_libra.anm2")

-- ///Applies and removes skin layers specific to Pony ///
local function PonyPlayerCostume(player)
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Pony" then
		if player.CanFly then
			if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
				player:AddNullCostume(Ponyhair_ID)
				player:AddNullCostume(DragonwingsBrimstone_ID)
			elseif player:HasCollectible(CollectibleType.COLLECTIBLE_FATE) or player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_GRAIL) or player:HasCollectible(CollectibleType.COLLECTIBLE_DOGMA) or player:HasCollectible(CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT) or player:HasCollectible(CollectibleType.COLLECTIBLE_REVELATION) then
				player:AddNullCostume(Ponyhair_ID)
				player:AddNullCostume(Dragonwings_ID)
			else
				player:AddNullCostume(Ponyhair_ID)
			end
		end
		if player.CanFly == false then
			player:TryRemoveNullCostume(Dragonwings_ID)
			player:TryRemoveNullCostume(DragonwingsBrimstone_ID)
			player:AddNullCostume(Ponybody_ID)
			player:AddNullCostume(Ponyhair_ID)		
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_INFESTATION)
			player:RemoveCostume(ponyanm)
			player:AddNullCostume(CustomInfestation)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_LIBRA) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_LIBRA)
			player:RemoveCostume(ponyanm)
			player:AddNullCostume(CustomLibra)
		end
		if player:HasCollectible(DragonhoardItem) then
			player:AddNullCostume(Dragonhoard_ID)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_CEREMONIAL_ROBES) then
			player:TryRemoveNullCostume(Ponyhair_ID)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_OF_THE_MARTYR) then
			player:AddNullCostume(Ponyhair_ID)
		end
	end
end

-- ///Updates either if the player has Dragon Hoard in order for the sprite to be applied///
local function UpdateDragonHoard(player)
	HasDragonHoard = player:HasCollectible(DragonhoardItem)
end

-- ///Adds items and skin layers within the character spawn ///
function NewMod:player_init(entity_player)
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Pony" then
		PonyPlayerCostume()
		player:AddCollectible(DragonhoardItem, 0, true)
		player:SetPocketActiveItem(DragonwingsActive, 2, true)
	end
	UpdateDragonHoard(player)
end
NewMod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, NewMod.player_init)

-- ///Updates every frame, applies and removes custome skin layers when neccesary, mostly to Pony///
function NewMod:onUpdate()
local player = Isaac.GetPlayer(0)
	if player:GetName() == "Pony" then
		if player:HasCollectible(CollectibleType.COLLECTIBLE_PONY) and UsedWings == false then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_PONY)
			local spritePath = "gfx/characters/costumes/costume_pony.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		elseif player:HasCollectible(CollectibleType.COLLECTIBLE_PONY) and UsedWings == true then
			local ponyanm2 = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_PONY)
			local spritePath2 = "gfx/characters/costumes/costume_ponywings.png"
			player:ReplaceCostumeSprite(ponyanm2, spritePath2, 1)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_WHITE_PONY) and UsedWings == false then
			local whiteponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_WHITE_PONY)
			local whitespritePath = "gfx/characters/costumes/costume_whitepony.png"
			player:ReplaceCostumeSprite(whiteponyanm, whitespritePath, 0)
		elseif player:HasCollectible(CollectibleType.COLLECTIBLE_WHITE_PONY) and UsedWings == true then
			local whiteponyanm2 = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_WHITE_PONY)
			local whitespritePath2 = "gfx/characters/costumes/costume_whiteponywings.png"
			player:ReplaceCostumeSprite(whiteponyanm2, whitespritePath2, 1)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_SPEED_BALL) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SPEED_BALL)
			local spritePath = "gfx/characters/costumes/costume_speedball.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_GODS_FLESH) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_GODS_FLESH)
			local spritePath = "gfx/characters/costumes/costume_godsflesh.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_HAEMOLACRIA) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_HAEMOLACRIA)
			local spritePath = "gfx/characters/costumes/costume_haemolacria.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER)
			local spritePath = "gfx/characters/costumes/costume_mutantspider.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0) 
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_PIGGY_BANK) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_PIGGY_BANK)
			local spritePath = "gfx/characters/costumes/costume_piggybank.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0) 
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_PLACENTA) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_PLACENTA)
			local spritePath = "gfx/characters/costumes/costume_placenta.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_WOODEN_SPOON) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_WOODEN_SPOON)
			local spritePath = "gfx/characters/costumes/costume_woodenspoon.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0) 
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_CHAOS) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_CHAOS)
			local spritePath = "gfx/characters/costumes/costume_chaos.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0) 
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_BLOOD_CLOT) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_BLOOD_CLOT)
			local spritePath = "gfx/characters/costumes/costume_bloodclot.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0) 
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_GIMPY) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_GIMPY)
			local spritePath = "gfx/characters/costumes/costume_gimpy.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_WIG) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_MOMS_WIG)
			local spritePath = "gfx/characters/costumes/costume_momswig.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_SQUEEZY) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SQUEEZY)
			local spritePath = "gfx/characters/costumes/costume_squeezy.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_ANALOG_STICK) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_ANALOG_STICK)
			local spritePath = "gfx/characters/costumes/costume_analogstick.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_HEART) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_HEART)
			local spritePath = "gfx/characters/costumes/costume_immaculateheart.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_VIRUS) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_VIRUS)
			local spritePath = "gfx/characters/costumes/costume_virus.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_PAGEANT_BOY) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_PAGEANT_BOY)
			local spritePath = "gfx/characters/costumes/costume_pageantboy.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_JESUS_JUICE) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_JESUS_JUICE)
			local spritePath = "gfx/characters/costumes/costume_jesusjuice.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_ROCK_BOTTOM) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_ROCK_BOTTOM)
			local spritePath = "gfx/characters/costumes/costume_rockbottom.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_DEAD_TOOTH) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_DEAD_TOOTH)
			local spritePath = "gfx/characters/costumes/costume_deadtooth.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION_2) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_INFESTATION_2)
			local spritePath = "gfx/characters/costumes/costume_infestation2.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_BAR_OF_SOAP) then
			local ponyanm = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_BAR_OF_SOAP)
			local spritePath = "gfx/characters/costumes/costume_soap.png"
			player:ReplaceCostumeSprite(ponyanm, spritePath, 0)
		end
	end
	if not HasDragonHoard and player:HasCollectible(DragonhoardItem) then -- Applies the Dragon Hoard sprite when held
		player:AddNullCostume(Dragonhoard_ID)
		HasDragonHoard = true
	end
end
NewMod:AddCallback(ModCallbacks.MC_POST_UPDATE, NewMod.onUpdate)

-- ///A bit of code idk how it works but it's neccesary for costumes to be properly applied ///
function NewMod:onUpdate()
local player = Isaac.GetPlayer(0)
	if player:GetName() == "Pony" then
		if numocollect ~= player:GetCollectibleCount() then
			numocollect = player:GetCollectibleCount()
			PonyPlayerCostume(player)
		end
	end
end
NewMod:AddCallback(ModCallbacks.MC_POST_UPDATE, NewMod.onUpdate)

-- ///Dragon Hoard Functionality ///
function NewMod:update(currentPlayer)
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(DragonhoardItem) then	
		player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
		player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY)
		player:AddCacheFlags(CacheFlag.CACHE_SHOTSPEED)
		player:AddCacheFlags(CacheFlag.CACHE_LUCK)
		player:EvaluateItems()
	end
end
NewMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, NewMod.update)

-- ///Dragon Hoard substrats 1 coin when hit ///
function NewMod:TakeDamage(entity,dmg_amount, dmg_flag, dmg_src, dmg_countdown)
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(DragonhoardItem) then	
		if entity.Type == 1 then
			player:AddCoins(-1)
		end
	end
end
NewMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, NewMod.TakeDamage, EntityType.ENTITY_PLAYER)

-- ///Dragon Wings Functionality ///
function NewMod:ActivateDragonWings()
	local player = Isaac.GetPlayer(0)
	UsedWings = true
	if player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
		player:AddCacheFlags(CacheFlag.CACHE_FLYING)
		player:AddCacheFlags(CacheFlag.CACHE_SPEED)
		player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
		player:AddNullCostume(DragonwingsBrimstone_ID)
		player:EvaluateItems()
		return true --play the animation
	else
		player:AddCacheFlags(CacheFlag.CACHE_FLYING)
		player:AddCacheFlags(CacheFlag.CACHE_SPEED)
		player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
		player:AddNullCostume(Dragonwings_ID)
		player:EvaluateItems()
		return true --play the animation
	end
end
NewMod:AddCallback(ModCallbacks.MC_USE_ITEM, NewMod.ActivateDragonWings, DragonwingsActive)

-- ///Disable Dragon Wings after entering next room ///
function NewMod:OnUpdate()
	local player = Isaac.GetPlayer(0)
	if Game():GetLevel():GetCurrentRoom():GetFrameCount() == 1 then
		if(UsedWings == true) then
			if player:HasCollectible(CollectibleType.COLLECTIBLE_FATE) or player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_GRAIL) or player:HasCollectible(CollectibleType.COLLECTIBLE_DOGMA) or player:HasCollectible(CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT) or player:HasCollectible(CollectibleType.COLLECTIBLE_REVELATION) then --If the player gets any of these items, flying won't deactivate after entering next room
				UsedWings = false
				player:AddCacheFlags(CacheFlag.CACHE_SPEED)
				player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
				player:EvaluateItems()
			else
				UsedWings = false	
				player.CanFly = false
				player:TryRemoveNullCostume(Dragonwings_ID)
				player:TryRemoveNullCostume(DragonwingsBrimstone_ID)				
				player:AddCacheFlags(CacheFlag.CACHE_FLYING)
				player:AddCacheFlags(CacheFlag.CACHE_SPEED)
				player:AddCacheFlags(CacheFlag.CACHE_TEARFLAG)
				player:EvaluateItems()
			end
		end
	end
end
NewMod:AddCallback(ModCallbacks.MC_POST_UPDATE, NewMod.OnUpdate)

-- ///Character starting stats ///
local Pony = {
    DAMAGE = 0, --Base value: 3.5
	FIREDELAY = 0, --Base value: 3.73; for each 1 here is added/subtracted 0.20 from the tears value
    SPEED = 0.0, --Base value: 1.0
    SHOTSPEED = 0.0, --Base value: 1.0
    TEARHEIGHT = 2, --Base value: 2. Not a relevant stat
    TEARFALLINGSPEED = 0, --Base value: 0. Not a relevant stat
    LUCK = 1, --Base value: 0
    FLYING = false, --Despite being a dragon, Pony does not start flying                  
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(0.0, 1.0, 0.5, 1.0, 0, 0, 0)  --Green tears. Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) is default blue
}

function NewMod:onCache(player, cacheFlag)
    if player:GetName() == "Pony" then
        PonycacheHandler(player, cacheFlag, Pony)
    end
end

-- ///Cache information ///
function Pony:onCache(player, cacheFlag)
    if player:GetName() == "Pony" then
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
		player.Damage = player.Damage + Pony.DAMAGE
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
    end
	if cacheFlag == CacheFlag.CACHE_FLYING then --Dragon Wings application
		if UsedWings then
			player.CanFly = true
		end
	end
	if player:HasCollectible(DragonhoardItem) then --Dragon Hoard application
		if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + player:GetNumCoins()/10
		end
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + player:GetNumCoins()/6
		end
		if cacheFlag == CacheFlag.CACHE_FIREDELAY then
			if player:GetNumCoins() < 31 then
				player.MaxFireDelay = player.MaxFireDelay - player:GetNumCoins()/30
			elseif player:GetNumCoins() >= 51 then
				player.MaxFireDelay = player.MaxFireDelay - 30/30
			end
		end
		if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
			if player:GetNumCoins() < 31 then
				player.ShotSpeed = player.ShotSpeed + player:GetNumCoins()/65
			elseif player:GetNumCoins() >= 31 then
				player.ShotSpeed = player.ShotSpeed + 30/65
			end
		end
	end
	if (UsedWings == true) then	
		if cacheFlag == CacheFlag.CACHE_SPEED then --Adds a bit of speed while Dragon Wings is active
			player.MoveSpeed = player.MoveSpeed + 0.2
		end
		if cacheFlag == CacheFlag.CACHE_TEARFLAG then --Adds spectral tears while Dragon Wings is active
            player.TearFlags = player.TearFlags | TearFlags.TEAR_SPECTRAL
		end
	end
end
NewMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Pony.onCache)