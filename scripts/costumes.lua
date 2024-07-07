local costumes = {}

costumes.animations = {
  {
    name = "Pony",
    costume = {
      body = Isaac.GetCostumeIdByPath("gfx/characters/PonyBody.anm2"),
      hair = Isaac.GetCostumeIdByPath("gfx/characters/PonyHair.anm2"),
      tail = Isaac.GetCostumeIdByPath("gfx/characters/DragonHoard.anm2")
    }
  }
}

costumes.items = {
  {
    CollectibleType = CollectibleType.COLLECTIBLE_PONY,
    spritePaths = {
      default = "gfx/characters/costumes/costume_pony.png",
      withWings = "gfx/characters/costumes/costume_ponywings.png",
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_WHITE_PONY,
    spritePaths = {
      default = "gfx/characters/costumes/costume_whitepony.png",
      withWings = "gfx/characters/costumes/costume_whiteponywings.png",
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_SPEED_BALL,
    spritePaths = {
      default = "gfx/characters/costumes/costume_speedball.png",
      withWings = nil, -- Puedes dejarlo como nil si no hay variante con alas
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_GODS_FLESH,
    spritePaths = {
      default = "gfx/characters/costumes/costume_godsflesh.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_HAEMOLACRIA,
    spritePaths = {
      default = "gfx/characters/costumes/costume_haemolacria.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_MUTANT_SPIDER,
    spritePaths = {
      default = "gfx/characters/costumes/costume_mutantspider.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_PIGGY_BANK,
    spritePaths = {
      default = "gfx/characters/costumes/costume_piggybank.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_PLACENTA,
    spritePaths = {
      default = "gfx/characters/costumes/costume_placenta.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_WOODEN_SPOON,
    spritePaths = {
      default = "gfx/characters/costumes/costume_woodenspoon.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_CHAOS,
    spritePaths = {
      default = "gfx/characters/costumes/costume_chaos.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_BLOOD_CLOT,
    spritePaths = {
      default = "gfx/characters/costumes/costume_bloodclot.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_GIMPY,
    spritePaths = {
      default = "gfx/characters/costumes/costume_gimpy.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_MOMS_WIG,
    spritePaths = {
      default = "gfx/characters/costumes/costume_momswig.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_SQUEEZY,
    spritePaths = {
      default = "gfx/characters/costumes/costume_squeezy.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_ANALOG_STICK,
    spritePaths = {
      default = "gfx/characters/costumes/costume_analogstick.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_IMMACULATE_HEART,
    spritePaths = {
      default = "gfx/characters/costumes/costume_immaculateheart.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_VIRUS,
    spritePaths = {
      default = "gfx/characters/costumes/costume_virus.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_PAGEANT_BOY,
    spritePaths = {
      default = "gfx/characters/costumes/costume_pageantboy.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_JESUS_JUICE,
    spritePaths = {
      default = "gfx/characters/costumes/costume_jesusjuice.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_ROCK_BOTTOM,
    spritePaths = {
      default = "gfx/characters/costumes/costume_rockbottom.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_DEAD_TOOTH,
    spritePaths = {
      default = "gfx/characters/costumes/costume_deadtooth.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_INFESTATION_2,
    spritePaths = {
      default = "gfx/characters/costumes/costume_infestation2.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_COMMON_COLD,
    spritePaths = {
      default = "gfx/characters/costumes/costume_commoncold.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_BAR_OF_SOAP,
    spritePaths = {
      default = "gfx/characters/costumes/costume_soap.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_IPECAC,
    spritePaths = {
      default = "gfx/characters/costumes/costume_ipecac.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_EYE_SORE,
    spritePaths = {
      default = "gfx/characters/costumes/costume_eyesore.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_GLASS_EYE,
    spritePaths = {
      default = "gfx/characters/costumes/costume_glasseye.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_JUPITER,
    spritePaths = {
      default = "gfx/characters/costumes/costume_jupiter.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_VENUS,
    spritePaths = {
      default = "gfx/characters/costumes/costume_venus.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_PLUTO,
    spritePaths = {
      default = "gfx/characters/costumes/costume_pluto.png",
      withWings = nil,
    }
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_DADS_LOST_COIN,
    spritePaths = {
      default = "gfx/characters/costumes/costume_dadslostcoin.png",
      withWings = nil,
	}
  },
  {
    CollectibleType = CollectibleType.COLLECTIBLE_NUMBER_ONE,
    spritePaths = {
      default = "gfx/characters/costumes/costume_numberone.png",
      withWings = nil,
	}
  }
}

return costumes