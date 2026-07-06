-- PlaceDeer
-- Author: Clayton
-- DateCreated: 3/19/2015 2:17:31 AM
--------------------------------------------------------------
-- Place Deer -- Author: Neirai -- DateCreated: 5/12/2014 9:35:31 AM
print("loaded")
include("IconSupport")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "GreatSerpentMound";
 
function buildADeer(pPlayer, pCity)
        for pCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
                local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
                if pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS then
                        if pSpecificPlot:GetFeatureType() == (-1) and not pSpecificPlot:IsMountain() then
                                if pSpecificPlot:GetResourceType(-1) == (-1) then
                                        pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_DEER, 1)
                                        print("Deer Placed on Plains")
                                        save(pPlayer, pCity:GetID(), true)
                                        return true
                                end
                        end
                elseif
                        pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS then
                        if pSpecificPlot:GetFeatureType() == (-1) and not pSpecificPlot:IsMountain() then
                                if pSpecificPlot:GetResourceType(-1) == (-1) then
                                        pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_DEER, 1)
                                        print("Deer Placed on Grasslands")
                                        save(pPlayer, pCity:GetID(), true)
                                        return true
                                end
                        end
                elseif
                        pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
                        if pSpecificPlot:GetFeatureType() == (-1) and not pSpecificPlot:IsMountain() then
                                if pSpecificPlot:GetResourceType(-1) == (-1) then
                                        pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_DEER, 1)
                                        print("Deer Placed on Tundra")
                                        save(pPlayer, pCity:GetID(), true)
                                        return true
                                end
                        end
                elseif
                        pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT then
                        if pSpecificPlot:GetFeatureType() == (-1) and not pSpecificPlot:IsMountain() then
                                if pSpecificPlot:GetResourceType(-1) == (-1) then
                                        pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_DEER, 1)
                                        print("Deer Placed on Desert")
                                        save(pPlayer, pCity:GetID(), true)
                                        return true
                                end
                        end
                end
        end
        save(pPlayer, pCity:GetID(), true)
        return false
end
       
function PutDeerSomewhere(player)
        local pPlayer = Players[player]
        for pCity in pPlayer:Cities() do
                if pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_GREATSERPENTMOUND) == 1 then
                        if not(load(pPlayer, pCity:GetID())) then
                                print("No Deer")
                                if buildADeer(pPlayer, pCity) == false then
                                        print("No place to place a Deer place.")
                                end
                        end
                end
        end
end
GameEvents.PlayerDoTurn.Add(PutDeerSomewhere)