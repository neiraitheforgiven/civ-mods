-- Troyville Function
-- Author: JFD
-- DateCreated: 5/9/2015 6:09:20 AM
--------------------------------------------------------------
local direction_types = {
    DirectionTypes["DIRECTION_NORTHEAST"],
    DirectionTypes["DIRECTION_NORTHWEST"],
    DirectionTypes["DIRECTION_EAST"],
    DirectionTypes["DIRECTION_SOUTHEAST"],
    DirectionTypes["DIRECTION_SOUTHWEST"],
    DirectionTypes["DIRECTION_WEST"]
    }
 
function Reed_GetNumAdjacentRiverTiles(city)
    local numAdjacentRiverTiles = 0
    if Map.GetPlot(city:GetX(), city:GetY()) then
       for loop, direction in ipairs(direction_types) do
          local adjPlot = Map.PlotDirection(city:GetX(), city:GetY(), direction)
          if adjPlot:IsRiver() then    
             numAdjacentRiverTiles = numAdjacentRiverTiles + 1
          end
       end
    end
    return numAdjacentRiverTiles    
end
         
local buildingGreatMoundID = GameInfoTypes["BUILDING_GREATMOUNDTROYVILLE"]               
function Reed_TroyvilleHappiness(playerID, cityID, buildingID)
        local player = Players[playerID]
        if player:IsAlive() then
                if buildingID == buildingGreatMoundID then
                        local city = player:GetCityByID(cityID)
                        local numAdjacentRivers = math.min(Reed_GetNumAdjacentRiverTiles(city),6)
                        local buildingID =  GameInfoTypes["BUILDING_TROYVILLEHAPPINESS_" .. numAdjacentRivers]
                        city:SetNumRealBuilding(buildingID, 1)
                end    
        end
end
GameEvents.CityConstructed.Add(Reed_TroyvilleHappiness)