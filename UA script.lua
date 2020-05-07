include("FLuaVector.lua")
include("Sukritact_saveutils.lua"); MY_MOD_NAME = "Neirai-Seneca-Lua";

function countPlayerKeeperStacks(playerId)
    local playerObj = Players[playerId]
    if playerObj:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_SENECA then
        --create a table for this player or don't
        local uaTableName = string.format("senecaUAtable%s", playerId)
        MapModData.uaTableName = MapModData.uaTableName or {}
        local uaTable = MapModData.uaTableName
        for i in pairs(uaTable) do
            uaTable[i] = nil 
        end
        playerTeamId = playerObj:GetTeam()
        playerTeamObj = Teams[playerTeamId]
        for entryPlayerId, entryPlayerObj in pairs(Players) do
            if entryPlayerObj:IsBarbarian() then 
                table.insert(uaTable, entryPlayerId, 0)
                continue 
            end
            if playerTeamObj:IsAtWar(entryPlayerObj:GetTeam()) then
                local numberOfWarringCivs = 0
                for otherPlayerId, otherPlayerObj in pairs(Players) do
                    local otherTeamObj = Teams[otherPlayerId]
                    if not otherTeamObj:IsAtWar(playerTeamId) and 
                            otherTeamObj:IsAtaWar(entryPlayerObj:GetTeam()) then
                        numberOfWarringCivs = numberOfWarringCivs + 1
                    end
                end
                table.insert(uaTable, entryPlayerId, numberOfWarringCivs)
            else
                table.insert(uaTable, entryPlayerId, 0)
            end
        end
    end
end
--run on DoPlayerTurn so we only do this once/turn

function GetKeeperStacks(playerId, targetId)
    local uaTableName = string.format("senecaUATable%s", playerId)
    local uaTable = MapModData.uaTableName
    return uaTable[targetId]
end
--intended to be run whenever an enemy unit is encountered on a nearby tile

function KeeperPower(playerId)
    local playerObj = Players[playerId]
    if playerObj:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_SENECA then
        



