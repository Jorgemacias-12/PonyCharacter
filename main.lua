local Pony = require('./scripts/Pony')

local PonyCharacterMod = RegisterMod("PonyCharacter", 1)

function PonyCharacterMod:player_init(entity_player)
	local player = Isaac.GetPlayer()

	if player:GetName() == Pony.Name then
		Pony.InitPony(Pony)
	end
end

function PonyCharacterMod:onUpdate()
	Pony.OnUpdate(Pony)
end

function PonyCharacterMod:update(currentPlayer)
	Pony.Update(Pony)
end

function PonyCharacterMod:TakeDamage(entity, dmg_amount, dmg_flag, dmg_src, dmg_countdown)
	Pony.TakeDamage(Pony)
end

function PonyCharacterMod:ActiveDragonWings()
	Pony.ActivateWings(Pony)
end

function PonyCharacterMod:onCache()
	Pony.OnCache(Pony)
end

-- Init Callback verification to mod init
PonyCharacterMod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, PonyCharacterMod.player_init)

-- Init callback to update mod
PonyCharacterMod:AddCallback(ModCallbacks.MC_POST_UPDATE, PonyCharacterMod.onUpdate);

-- Update game effects when DragonHoard is picked up
PonyCharacterMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, PonyCharacterMod.update)

-- Event when player gets hit
PonyCharacterMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, PonyCharacterMod.TakeDamage, EntityType.ENTITY_PLAYER)

-- Event when DragonWings are going to be used
PonyCharacterMod:AddCallback(ModCallbacks.MC_USE_ITEM, PonyCharacterMod.ActivateDragonWings,
	PonyCharacterMod.ActivateDragonWings)

-- Event raised every frame to update player statistics
PonyCharacterMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Pony.onCache)
