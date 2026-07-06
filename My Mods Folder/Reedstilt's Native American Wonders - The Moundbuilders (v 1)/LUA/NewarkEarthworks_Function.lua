-- MWIdeologyWonders_Function
-- Author: Reedstilt
-- DateCreated: 2/18/2016
--------------------------------------------------------------
function NewarkEarthworksfunction(playerID)
        local player = Players[playerID]
        if player:CountNumBuildings(GameInfoTypes["BUILDING_NEWARKEARTHWORKS"]) > 0 then
                        player:SetHasPolicy(GameInfoTypes["POLICY_NEWARKEARTHWORKS"], true)
        else
                if player:HasPolicy(GameInfoTypes["POLICY_NEWARKEARTHWORKS"]) then
                        player:SetHasPolicy(GameInfoTypes["POLICY_NEWARKEARTHWORKS"], false)
                end
        end
end
GameEvents.PlayerDoTurn.Add(NewarkEarthworksfunction)