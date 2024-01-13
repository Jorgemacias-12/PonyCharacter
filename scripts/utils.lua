-- Utils.lua
-- Author: Jorge macias
-- Description: Contains utility functions for the mod
-- Version: 0.0.1

local utils = {}

function utils.hasAnyCollectible(player, collectibles)
  for _, collectible in ipairs(collectibles) do
    if player:HasCollectible(collectible) then
      return true
    end
  end

  return false
end

function utils.iterateTable(table)
  for key, value in pairs(table) do
    Isaac.ConsoleOutput("Clave: " .. tostring(key) .. ", valor: " .. tostring(value) .. '\n')
  end
end

--- Determines if the given damageFlags correspond to self-inflicted damage types in The Binding of Isaac.
--- This function checks against a predefined set of damage types typically considered as self-damage, such as damage taken from
--- Confessional, Demon Beggar, Blood Donation Machine, etc.
--- @param damageFlags number: The damage flags to be checked, representing different types of damage in the game.
--- @return boolean: Returns true if the damageFlags correspond to a self-damage type, false otherwise.
--- @usage This function is used in scenarios where it's necessary to distinguish between self-inflicted damage and damage from other sources.
--- It's particularly useful in mods where specific actions or effects need to be triggered only on self-damage.
function utils.isSelfDamage(damageFlags)
  local selfDamageFlags = {
    ['Confessional'] = DamageFlag.DAMAGE_RED_HEARTS,
    ['DemonBeggar'] = DamageFlag.DAMAGE_RED_HEARTS,
    ['BloodDonationMachine'] = DamageFlag.DAMAGE_RED_HEARTS,
    ['IVBag'] = DamageFlag.DAMAGE_RED_HEARTS | DamageFlag.DAMAGE_INVINCIBLE | DamageFlag.DAMAGE_IV_BAG,
    ['HellGame'] = DamageFlag.DAMAGE_RED_HEARTS,
    ['CurseRoom'] = DamageFlag.DAMAGE_NO_PENALTIES | DamageFlag.DAMAGE_CURSED_DOOR,
    ['MausoleumDoor'] = DamageFlag.DAMAGE_SPIKES | DamageFlag.DAMAGE_NO_PENALTIES | DamageFlag.DAMAGE_INVINCIBLE |
    DamageFlag.DAMAGE_NO_MODIFIERS,
    ['SacrificeRoom'] = DamageFlag.DAMAGE_SPIKES | DamageFlag.DAMAGE_NO_PENALTIES,
    ['BadTrip'] = DamageFlag.DAMAGE_NOKILL | DamageFlag.DAMAGE_INVINCIBLE | DamageFlag.DAMAGE_NO_PENALTIES
  }

  for source, flags in pairs(selfDamageFlags) do
    if damageFlags == flags then
      return true
    end
  end

  return false
end

return utils;