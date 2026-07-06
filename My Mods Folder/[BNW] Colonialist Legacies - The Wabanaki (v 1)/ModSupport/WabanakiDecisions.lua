print('loading Wabanaki Decisions!')
-----------------------------------
--Declare _____ to be the truth.
--  COSTS:
--  1 Magistrate
--  All Your population converts to _________
--  REQS:
--  At least one follower of ______ in one of your cities.
--  GIVES:
--  Whenever the owner of ______ gains a Social Policy, gain 1/3 that Policy's cost in Culture
--  Whenever the owner of ______ gains a Great Person, gain a bunch of Faith
----------------------------------------------------------------------------------------------
 
local Decisions_CLWABANAKICONVERSION = {}
print('Decisions_CLWABANAKICONVERSION loaded')
Decisions_CLWABANAKICONVERSION.Name = "TXT_KEY_DECISIONS_CLWABANAKICONVERSION_NO_NAME"
Decisions_CLWABANAKICONVERSION.Desc = "TXT_KEY_DECISIONS_CLWABANAKICONVERSION_NO_DESC"
HookDecisionCivilizationIcon(Decisions_CLWABANAKICONVERSION, 'CIVILIZATION_CLWABANAKI')
Decisions_CLWABANAKICONVERSION.tRel = {}
Decisions_CLWABANAKICONVERSION.CanFunc = (
    function(pPlayer)
        if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLWABANAKI then
            return false, false
        end
        if load(pPlayer, "Decisions_CLWABANAKICONVERSION") then
            local iRel = load(pPlayer, "PostConversion")
            Decisions_CLWABANAKICONVERSION.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLWABANAKICONVERSION_ADOPTED", iRel)
            return false, false, true
        end
        for pope = 0, GameDefines.MAX_MAJOR_CIVS -1, 1 do
            local pPope = Players[pope]
            local pRel = pPope:GetReligionCreatedByPlayer()
            if pRel ~= nil and pRel > ReligionTypes.RELIGION_PANTHEON and pRel ~= pPlayer:GetReligionCreatedByPlayer() then
                table.insert(Decisions_CLWABANAKICONVERSION.tRel, pRel)
            end
        end
        local tNewRels = {}
        for i, Rel in ipairs(Decisions_CLWABANAKICONVERSION.tRel) do
            print('testing '..tostring(Rel))
            for pCity in pPlayer:Cities() do
                if pCity:GetNumFollowers(Rel) > 0 then
                    tNewRels[Rel] = true
                    break
                end
            end
        end
        if #tNewRels == 0 then
            Decisions_CLWABANAKICONVERSION.Name = "TXT_KEY_DECISIONS_CLWABANAKICONVERSION_NO_NAME"
            Decisions_CLWABANAKICONVERSION.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLWABANAKICONVERSION_NO_DESC")
            return true, false
        end
        --Decision Generation
        for iRel, _ in pairs(tNewRels) do
            local sKey = "Decisions_CLWABANAKICONVERSION" .. iRel
            local tRel = GameInfo.Religions[iRel]
            print('tRel is ' .. tostring(tRel))
            tTempDecisions[sKey] = {}
            tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLWABANAKICONVERSION_NAME", tRel.Description)
            tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLWABANAKICONVERSION_DESC", tRel.Description, tostring(Game.GetFounder(iRel, -1)), tostring(Game.GetHolyCityForReligion(iRel, -1):GetName()))
            tTempDecisions[sKey].Data1 = tRel
            tTempDecisions[sKey].Type = "Civilization"
            HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_CLWABANAKI")
            tTempDecisions[sKey].CanFunc = (
            function(pPlayer, tRel)
                local iRel = tRel.ID
                local sKey = "Decisions_CLWABANAKICONVERSION" .. iRel
                local sName = tRel.Description
                --local postCon = load(pPlayer, "PostConversion")
                if load(pPlayer, sKey) then
                    local postCon = load(pPlayer, "PostConversion")
                    if postCon ~= nil then
                        if postCon == iRel then
                            tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLWABANAKICONVERSION_ADOPTED", sName, sIcon)
                            return false, false, true
                        end
                    end
                    return false, false
                end
                tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLWABANAKICONVERSION_DESC", tRel.Description, tostring(Game.GetFounder(iRel, -1)), tostring(Game.GetHolyCityForReligion(iRel, -1):GetName()))
                if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false) < 1) then return true, false end
                return true, true
            end
            )
            tTempDecisions[sKey].DoFunc = (
            function(pPlayer, tRel)
                local iRel = tRel.ID
                pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_MAGISTRATES, -1)
                for pCity in pPlayer:Cities() do
                    pCity:AdoptReligionFully(iRel)
                end
                save(pPlayer, "Decisions_CLWABANAKICONVERSION", true)
                save(pPlayer, "PostConversion", iRel)
                save(pPlayer, sKey, true)
            end
            )
        end
        --End Generation
    end
)
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CLWABANAKI, "Decisions_CLWABANAKICONVERSION", Decisions_CLWABANAKICONVERSION)
 
function ConvertedGPX(playerId)
    for player = 0, GameDefines.MAX_MAJOR_CIVS -1, 1 do
        local pPlayer = Players[player]
        if load(pPlayer, "Decisions_CLWABANAKICONVERSION") then
            local iRel = load(pPlayer, "PostConversion")
            local pope = Game.GetFounder(iRel, -1)
            local tRel = GameInfo.Religions[iRel]
            if pope ~= nil and pope == playerId then
                local count = load(pPlayer, 'ProphetCount')
                if count == nil then
                    count = 1
                end
                local faithCount = math.ceil(0 + (count * (count - 1) * 30))
                pPlayer:ChangeFaith(faithCount)
                save(pPlayer, 'ProphetCount', count + 0.2)
                Events.GameplayAlertMessage('A new, great leader has arisen in '..tostring(Game.GetHolyCityForReligion(iRel, -1):GetName()) ..'. Adherents of '..tRel.Description..' among our people have generated '..faithCount..' [ICON_PEACE] Faith.')
            end
        end
    end
end
GameEvents.GreatPersonExpended.Add(ConvertedGPX)
 
function ConvertedCP(playerId)
    for player = 0, GameDefines.MAX_MAJOR_CIVS -1, 1 do
        local pPlayer = Players[player]
        if load(pPlayer, "Decisions_CLWABANAKICONVERSION") then
            local iRel = load(pPlayer, "PostConversion")
            local pope = Game.GetFounder(iRel, -1)
            local tRel = GameInfo.Religions[iRel]  
            if pope ~= nil and pope == playerId then
                local CultureBomb = math.ceil(pope:GetNextPolicyCost() / 3)
                pPlayer:ChangeJONSCulture(CultureBomb)
                Events.GameplayAlertMessage('The leaders of ' .. tRel.Description .. ' have unveiled new moral teachings. Adherents of ' .. tRel.Description ' in our lands cry out for us to adopt these new social codes, generating '..CultureBomb..' [ICON_CULTURE] Culture.')
            end
        end
    end
end
GameEvents.PlayerAdoptPolicy.Add(ConvertedCP)
 
-----------------------------------
--Promote our Winter Games.
--  COSTS:
--  1200 Gold
--  REQS:
--  At least 3 cities on or near tundra or snow tiles that contain broadcast towers
--  GIVES:
--  Whenever a player starts a Golden Age, gain money and GAPs
--  More when you have more culture power
 
local Decisions_CLWABANAKISPORTS = {}
print('Decisions_CLWABANAKISPORTS loaded')
Decisions_CLWABANAKISPORTS.Name = 'TXT_KEY_DECISIONS_CLWABANAKISPORTS_NAME'
Decisions_CLWABANAKISPORTS.Desc = 'The people of the world seek something to distract them from their sorrows. Let us use the media to promote an International Oochamadyk League as a method of promoting national pride and bolstering the economy![NEWLINE]Requirement/Restrictions:[NEWLINE][ICON_BULLET]Player must be the Wabanaki[NEWLINE][ICON_BULLET]Must have at least 3 Broadcast towers in cities working Tundra or Snow tiles.[NEWLINE]Costs:[NEWLINE][ICON_BULLET]1200 [ICON_GOLD] Gold[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]Whenever a player starts a golden age, gain [ICON_GOLD] Gold and [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE][ICON_BULLET]Gain more [ICON_GOLD] Gold and [ICON_GOLDEN_AGE] Golden Age points from civilizations as your culture eclipses theirs.'
HookDecisionCivilizationIcon(Decisions_CLWABANAKISPORTS, 'CIVILIZATION_CLWABANAKI')
Decisions_CLWABANAKISPORTS.CanFunc = (
    function(pPlayer)
        if(pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLWABANAKI) then
            return false, false
        end
        if load(pPlayer, 'Decisions_CLWABANAKISPORTS') == true then
            Decisions_CLWABANAKISPORTS.Desc = 'Rewards:[NEWLINE][ICON_BULLET]Whenever a player starts a golden age, gain [ICON_GOLD] Gold and [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE][ICON_BULLET]Gain more [ICON_GOLD] Gold and [ICON_GOLDEN_AGE] Golden Age points from civilizations as your culture eclipses theirs.'
            return false, false, true
        end
 
        local pCap = pPlayer:GetCapitalCity()
        if pCap == nil then
            return true, false
        end
        if pPlayer:GetGold() < 1200 then
            return true, false
        end
        local goldCost = 1200
        local numCold = 0
        for pCity in pPlayer:Cities() do
            if CityIsCold(pCity) then
                if pCity:GetNumBuilding(GameInfoTypes.BUILDING_BROADCAST_TOWER) > 0 then
                    numCold = numCold + 1
                end
            end
        end
        if numCold < 3 then
            return true, false
        end
    return true, true
    end
)
Decisions_CLWABANAKISPORTS.DoFunc = (
    function(pPlayer)
        pPlayer:ChangeGold(-1200)
        save(pPlayer, "Decisions_CLWABANAKISPORTS", true)
    end
)      
 
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CLWABANAKI, "Decisions_CLWABANAKISPORTS", Decisions_CLWABANAKISPORTS)
 
function CityIsCold(pCity)
    for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
        print("You're curious. The number of city plots is ".. pCity:GetNumCityPlots())
        local pPlot = pCity:GetCityIndexPlot(pCityPlot)
        if pPlot ~= nil then
            if pPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
                return true
            end
        end
    end
    return false
end
 
 
local function shuffle(t)
  local n = #t
  while n > 2 do
    local k = Game.Rand(#t, 'Founding League!')
    t[n], t[k] = t[k], t[n]
    n = n - 1
 end
 return t
end
 
local Roster = {}
Roster[0] = 'Strikers'
Roster[1] = 'Puffins'
Roster[2] = 'Hurricane'
Roster[3] = 'Blue Flames'
Roster[4] = 'Sharks'
Roster[5] = 'Caribou'
Roster[6] = 'Silverbacks'
Roster[7] = 'Raiders'
Roster[8] = 'Sliders'
Roster[9] = 'Clubbers'
Roster[10] = 'Hunters'
Roster[11] = 'Wendigoes'
Roster[12] = 'Rebels'
Roster[13] = 'Anglers'
Roster[14] = 'Bombers'
Roster[15] = 'Panthers'
Roster[16] = 'Heroes'
Roster[17] = 'Predators'
Roster[18] = 'Slayers'
Roster[19] = 'Sonics'
Roster[20] = 'Sea Dragons'
Roster[21] = 'Dragoons'
Roster[22] = 'Hobbitses'
Roster[23] = 'Quicksilver'
Roster[24] = 'United'
Roster[24] = 'Lich Kings'
Roster[25] = 'Spiders' --
Roster[26] = 'Rockets'
Roster[27] = 'Commandos'
Roster[28] = 'Immortals'
Roster[29] = 'Stars'
Roster[30] = 'Berserkers'
Roster[31] = 'Final Forms' --
Roster[32] = 'White Walkers'
Roster[33] = 'Cardinals'   --
Roster[34] = 'Pressing Fs'
Roster[35] = 'Agent Ems'
Roster[36] = 'Frost Shock'
Roster[37] = 'Ultraviolets'
Roster[38] = 'Auroras'
Roster[39] = 'Phoenix'
Roster[40] = 'Outlaws'
Roster[41] = 'Fickle Hearts'
Roster[42] = 'Royales'
Roster[43] = 'Gushues'
Roster[44] = 'Exonyms'
Roster[45] = 'Bruins'
Roster[46] = 'R. R. Martins'
Roster[47] = 'Lightning'
Roster[48] = 'Penguins'
Roster[49] = 'Barons'
Roster[50] = 'Scouts'
Roster[51] = 'Falcons'
Roster[52] = 'Belugas'
Roster[53] = 'Minotaurs'
Roster[54] = 'Marauders'
Roster[55] = 'Nobles'
Roster[56] = 'Chariots'
Roster[57] = 'Magistrates'
Roster[58] = 'Militia'
Roster[59] = 'Battle Priests'
Roster[60] = 'Mercenaries'
Roster[61] = 'Guardsmen'
Roster[62] = 'Grads'
Roster[63] = 'Philosophers'
Roster[64] = 'Rangers'
Roster[65] = 'Partisans'
Roster[66] = 'Spartans'
Roster[67] = 'Riders'
Roster[68] = 'Mammoths'
Roster[69] = 'Paladins'
Roster[70] = 'Highlanders'
Roster[71] = 'Bombardiers'
Roster[72] = 'Dreadnaughts'
Roster[73] = 'Crusaders'
Roster[74] = 'Ravens'
Roster[75] = 'Dragonflies'
Roster[76] = 'Chosen'
Roster[77] = 'Massive Death Cannons'
Roster[78] = 'Devils'
Roster[79] = 'Angels'
Roster[80] = 'Freebooters'
Roster[81] = 'Runners'
Roster[82] = 'Ninjas'
Roster[83] = 'Doges'
Roster[84] = 'Ministers'
Roster[85] = 'Slytherin'
Roster[86] = 'Polar Vortex'
Roster[87] = 'Rocky Roads'
Roster[88] = 'Magpies'
Roster[89] = 'Griffon Doors'
Roster[90] = 'Raging Owls'
Roster[91] = 'Flying Foxes'
Roster[92] = 'Great Generals'
Roster[93] = 'Champions'
Roster[94] = 'Wizards'
Roster[95] = 'Mythical Beasts'
Roster[96] = 'Typhoons'
Roster[97] = 'Limit Breakers'
Roster[98] = 'Demigods'
Roster[99] = 'Darksiders'
shuffle(Roster)
 
--sadly, no event!
function AnyNewGoldenAges(player)
    local pPlayer = Players[player]
    if load(pPlayer, "Decisions_CLWABANAKISPORTS") == true then
        for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
            local pOther = Players[iPlayer]
            if pOther ~= pPlayer then
                local bGold = load(pPlayer, "Decisions_CLWABANAKISPORTS" .. iPlayer)
                if bGold == nil then
                    save(pPlayer, "Decisions_CLWABANAKISPORTS" .. iPlayer, pOther:IsGoldenAge())
                elseif bGold then
                    if not pOther:IsGoldenAge() then
                        save(pPlayer, "Decisions_CLWABANAKISPORTS" .. iPlayer, false)
                    end
                elseif not bGold then
                    if pOther:IsGoldenAge() then -- new golden age
                        save(pPlayer, "Decisions_CLWABANAKISPORTS" .. iPlayer, true)
                        --hope this works
                        local mod = 1 + (pPlayer:GetTourismModifierWith(iPlayer) / 100) -- test
                        print('tourism modifier is '..tostring(mod))
                        local prize = math.ceil(100 * mod)
                        local fans = math.ceil(30 * mod)
                        pPlayer:ChangeGold(prize)
						pPlayer:ChangeGoldenAgeProgressMeter(fans)
                        local jersey = iPlayer
                        Events.GameplayAlertMessage('A recent hot streak by the ' .. pOther:GetCapitalCity():GetName() .. ' ' .. Roster[jersey] .. ' has made our International Ochamydyk League ' .. prize.. ' [ICON_GOLD] Gold')
						Events.GameplayAlertMessage("The rivalry between the "..pOther:GetCapitalCity():GetName() .. " ".. Roster[jersey] .. " and our " .. pPlayer:GetCapitalCity():GetName() .. " ".. Roster[playerId] .. " has given us " .. fans .. " [ICON_GOLDEN_AGE_POINTS] Golden Age Points!")
                    end
                end
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(AnyNewGoldenAges)