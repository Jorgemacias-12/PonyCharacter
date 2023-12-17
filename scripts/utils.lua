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

return utils;