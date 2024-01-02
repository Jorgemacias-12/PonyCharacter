local costumes = {}

costumes.itemCostumes = {
  {
    collectibleType = CollectibleType.COLLECTIBLE_PONY,
    spritePaths = {
      withoutWings = "gfx/characters/costumes/costume_pony.png",
      withWings = "gfx/characters/costumes/costume_ponywings.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_WHITE_PONY,
    spritePaths = {
      withoutWings = "gfx/characters/costumes/costume_whitepony.png",
      withWings = "gfx/characters/costumes/costume_whiteponywings.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_SPEED_BALL,
    spritePaths = {
      default = "gfx/characters/costumes/costume_speedball.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_GODS_FLESH,
    spritePaths = {
      default = "gfx/characters/costumes/costume_godsflesh.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_HAEMOLACRIA,
    spritePaths = {
      default = "gfx/characters/costumes/costume_haemolacria.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_MUTANT_SPIDER,
    spritePaths = {
      default = "gfx/characters/costumes/costume_mutantspider.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_PIGGY_BANK,
    spritePaths = {
      default = "gfx/characters/costumes/costume_piggybank.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_PLACENTA,
    spritePaths = {
      default = "gfx/characters/costumes/costume_placenta.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_WOODEN_SPOON,
    spritePaths = {
      default = "gfx/characters/costumes/costume_woodenspoon.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_CHAOS,
    spritePaths = {
      default = "gfx/characters/costumes/costume_chaos.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_BLOOD_CLOT,
    spritePaths = {
      default = "gfx/characters/costumes/costume_bloodclot.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_GIMPY,
    spritePaths = {
      default = "gfx/characters/costumes/costume_gimpy.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_MOMS_WIG,
    spritePaths = {
      default = "gfx/characters/costumes/costume_momswig.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_SQUEEZY,
    spritePaths = {
      default = "gfx/characters/costumes/costume_squeezy.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_ANALOG_STICK,
    spritePaths = {
      default = "gfx/characters/costumes/costume_analogstick.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_IMMACULATE_HEART,
    spritePaths = {
      default = "gfx/characters/costumes/costume_immaculateheart.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_VIRUS,
    spritePaths = {
      default = "gfx/characters/costumes/costume_virus.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_PAGEANT_BOY,
    spritePaths = {
      default = "gfx/characters/costumes/costume_pageantboy.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_JESUS_JUICE,
    spritePaths = {
      default = "gfx/characters/costumes/costume_jesusjuice.png"
    }
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_ROCK_BOTTOM,
    spritePaths = {
      default = "gfx/characters/costumes/costume_rockbottom.png"
    }
  }
}

costumes.nonFlyingCostumes = {
  [CollectibleType.COLLECTIBLE_INFESTATION] = {
    removeExisting = true,
    customCostume = Isaac.GetCostumeIdByPath("gfx/characters/custom_infestation.anm2")
  },
  [CollectibleType.COLLECTIBLE_LIBRA] = {
    removeExisting = true,
    customCostume = Isaac.GetCostumeIdByPath("gfx/characters/custom_libra.anm2")
  },
  [CollectibleType.COLLECTIBLE_VARICOSE_VEINS] = {
    removeExisting = true,
    customCostume = Isaac.GetCostumeIdByPath("gfx/characters/custom_varicoseveins.anm2")
  },
  [CollectibleType.COLLECTIBLE_CEREMONIAL_ROBES] = {
    removeExisting = true,
    customCostume = Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2")
  },
  [CollectibleType.COLLECTIBLE_BLOOD_OF_THE_MARTYR] = {
    removeExisting = true,
    customCostume = Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2")
  },
  [CollectibleType.COLLECTIBLE_HALO] = {
    removeExisting = true,
    customCostume = Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2")
  },
  [CollectibleType.COLLECTIBLE_MERCURIUS] = {
    removeExisting = true,
    customCostume = Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2")
  },
  [CollectibleType.COLLECTIBLE_URANUS] = {
    removeExisting = true,
    customCostume = Isaac.GetCostumeIdByPath("gfx/characters/custom_uranus.anm2")
  }
}

costumes.flyingCostumes = {
  {
    collectibleType = CollectibleType.COLLECTIBLE_BRIMSTONE,
    costume = {
      customLayer = Isaac.GetCostumeIdByPath("gfx/characters/DragonWingsBrimstone.anm2")
    },
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_FATE,
    costume = nil
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_BRIMSTONE,
    costume = nil,
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_BRIMSTONE,
    costume = nil
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_BRIMSTONE,
    costume = nil,
  },
  {
    collectibleType = CollectibleType.COLLECTIBLE_BRIMSTONE,
    costume = nil,
  },
}

return costumes;