local pony = require("scripts.pony")

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

function mod_functions.evaluateCache(cacheFlag, player)
  -- player.Damage = 100;
end

return mod_functions