local utils = {}

function utils.hasAnyCollectible(player, collectibles)

  for _, collectible in ipairs(collectibles) do
    if player:HasCollectible(collectible) then
      return true
    end
  end
  
  return false
end

return utils;