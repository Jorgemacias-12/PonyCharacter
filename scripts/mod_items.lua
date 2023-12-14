local mod_items = {}

mod_items.DragonHoardItem = Isaac.GetItemIdByName("Dragon Hoard");
mod_items.DragonWingsItem = Isaac.GetItemIdByName("Dragon Wings");

mod_items.itemsToCostumeMap = {
  [CollectibleType.COLLECTIBLE_BRIMSTONE] = {
    applyWhenFly = true,
    Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2"),
    Isaac.GetCostumeIdByPath("gfx/characters/DragonWingsBrimstone.anm2"),
  },
  [CollectibleType.COLLECTIBLE_FATE] = {
    applyWhenFly = true,
    Isaac.GetCostumeIdByPath("gfx/characters/PonyBody.anm2"),
    Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2")
  },
  [CollectibleType.COLLECTIBLE_HOLY_GRAIL] = {
    applyWhenFly = true,
    Isaac.GetCostumeIdByPath("gfx/characters/PonyBody.anm2"),
    Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2"),
  },
  [CollectibleType.COLLECTIBLE_DOGMA] = {
    applyWhenFly = true,
    Isaac.GetCostumeIdByPath("gfx/characters/PonyBody.anm2"),
    Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2"),
  },
  [CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT] = {
    applyWhenFly = true,
    Isaac.GetCostumeIdByPath("gfx/characters/PonyBody.anm2"),
    Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2"),
  },
  [CollectibleType.COLLECTIBLE_REVELATION] = {
    applyWhenFly = true,
    Isaac.GetCostumeIdByPath("gfx/characters/PonyBody.anm2"),
    Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2"),
  },
  [CollectibleType.COLLECTIBLE_INFESTATION] = {
    applyWhenFly = false,
    Isaac.GetCostumeIdByPath("gfx/characters/custom_infestation.anm2")
  },
  [CollectibleType.COLLECTIBLE_LIBRA] = {
    applyWhenFly = false,
    Isaac.GetCostumeIdByPath("gfx/characters/custom_libra.anm2")
  },
  [CollectibleType.COLLECTIBLE_VARICOSE_VEINS] = {
    applyWhenFly = false,
    Isaac.GetCostumeIdByPath("gfx/characters/custom_varicoseveins.anm2")
  },
  [CollectibleType.COLLECTIBLE_URANUS] = {
    applyWhenFly = false,
    Isaac.GetCostumeIdByPath("gfx/characters/custom_uranus.anm2")
  },
}

return mod_items;