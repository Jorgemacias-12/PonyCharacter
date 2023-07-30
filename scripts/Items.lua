local NewItems = {}

NewItems.DragonHoardItem = Isaac.GetItemIdByName("Dragon Hoard")
NewItems.DragonWingsActive = Isaac.GetItemIdByName("Dragon Wings")
NewItems.DragonWingsActiveSlot = 2
NewItems.UsedWings = false -- Dragon Wings is deactivated by default
NewItems.SpriteMapping = {
  [CollectibleType.COLLECTIBLE_PONY] = {
    [false] = { path = "../gfx/characters/costumes/costume_pony.png", index = 0 },
    [true] = { path = "../gfx/characters/costumes/costume_ponywings.png", index = 1 }
  },
  [CollectibleType.COLLECTIBLE_WHITE_PONY] = {
    [false] = { path = "gfx/characters/costumes/costume_whitepony.png", index = 0 },
    [true] = { path = "gfx/characters/costumes/costume_whiteponywings.png", index = 1 }
  }
  ,
  [CollectibleType.COLLECTIBLE_WHITE_PONY] = {
    [false] = { path = "gfx/characters/costumes/costume_speedball.png", index = 0 },
    [true] = { path = "gfx/characters/costumes/costume_godsflesh.png", index = 1 }
  }
  ,
  [CollectibleType.COLLECTIBLE_SPEED_BALL] = {
    [false] = { path = "gfx/characters/costumes/costume_haemolacria.png", index = 0 },
  },
  [CollectibleType.COLLECTIBLE_GODS_FLESH] = {
    [false] = { path = "gfx/characters/costumes/costume_godsflesh.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_HAEMOLACRIA] = {
    [false] = { path = "gfx/characters/costumes/costume_haemolacria.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_MUTANT_SPIDER] = {
    [false] = { path = "gfx/characters/costumes/costume_mutantspider.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_PIGGY_BANK] = {
    [false] = { path = "gfx/characters/costumes/costume_piggybank.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_PLACENTA] = {
    [false] = { path = "gfx/characters/costumes/costume_placenta.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_WOODEN_SPOON] = {
    [false] = { path = "gfx/characters/costumes/costume_woodenspoon.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_CHAOS] = {
    [false] = { path = "gfx/characters/costumes/costume_chaos.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_BLOOD_CLOT] = {
    [false] = { path = "gfx/characters/costumes/costume_bloodclot.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_GIMPY] = {
    [false] = { path = "gfx/characters/costumes/costume_gimpy.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_MOMS_WIG] = {
    [false] = { path = "gfx/characters/costumes/costume_momswig.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_SQUEEZY] = {
    [false] = { path = "gfx/characters/costumes/costume_squeezy.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_ANALOG_STICK] = {
    [false] = { path = "gfx/characters/costumes/costume_analogstick.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_INMACULATE_HEART] = {
    [false] = { path = "gfx/characters/costumes/costume_immaculateheart.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_VIRUS] = {
    [false] = { path = "gfx/characters/costumes/costume_virus.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_PAGEANT_BOY] = {
    [false] = { path = "gfx/characters/costumes/costume_pageantboy.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_JESUS_JUICE] = {
    [false] = { path = "gfx/characters/costumes/costume_jesusjuice.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_ROCK_BOTTOM] = {
    [false] = { path = "gfx/characters/costumes/costume_rockbottom.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_DEAD_TOOTH] = {
    [false] = { path = "gfx/characters/costumes/costume_deadtooth.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_INFESTATION_2] = {
    [false] = { path = "gfx/characters/costumes/costume_infestation2.png", index = 0 }
  },
  [CollectibleType.COLLECTIBLE_BAR_OF_SOAP] = {
    [false] = { path = "gfx/characters/costumes/costume_soap.png", index = 0 }
  }
}

return NewItems
