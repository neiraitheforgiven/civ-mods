include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "CLCOASTSALISH";
include("FLuaVector.lua")

function GenerosityPoints(player)
	local pPlayer = Players[player]
	if pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLCOASTSALISH then
		local iCash = load(pPlayer, "GoldAmount")
		if iCash ~= nil then
			local iSwing = iCash - pPlayer:GetGold()
			local iCred = math.floor(iSwing / 8)
			if iCred > 0 then
				if not pPlayer:IsGoldenAge() then
				    pPlayer:ChangeGoldenAgeProgressMeter(iCred)

					Events.GameplayAlertMessage("Having spend [ICON_GOLD] the previous turn has generated " .. iCred .. " [ICON_GOLDEN_AGE] Golden Age Points!");
				end
			end
		end
		save(pPlayer, "GoldAmount", pPlayer:GetGold())
	end
end

function GenerosityBomb(player)
	local pPlayer = Players[player]
	if pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLCOASTSALISH then
		local bAge = load(pPlayer, "IsAge")
		local coefficient = math.ceil((2.5 + pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_BANK)) * 8)
		if bAge ~= nil then
			if bAge then
				if pPlayer:IsGoldenAge() then
					print("Golden Age is true, bAge is true, and golden age coefficient is " .. coefficient)
				else
					print("Golden Age is false, bAge is true, and golden age coefficient is " .. coefficient)
				end
			else
				if pPlayer:IsGoldenAge() then
					print("Golden Age is true, bAge is false, and golden age coefficient is " .. coefficient)
				else
					print("Golden Age is false, bAge is false, and golden age coefficient is " .. coefficient)
				end
			end
			if pPlayer:IsGoldenAge() and not bAge then
				print("Yes, UA is working")
				for i,v in ipairs(pPlayer:GetTradeRoutes()) do
					print("Iterating route")
					local pTarget = nil
					if Players[v.FromCity:GetOwner()]:IsMinorCiv() then
						pTarget = v.FromCity
						print("pTarget is v.FromCity = ", pTarget)
					elseif Players[v.ToCity:GetOwner()]:IsMinorCiv() then
						pTarget = v.ToCity
						print("pTarget is v.ToCity = ", pTarget)
					end
					if pTarget ~= nil then
						Players[pTarget:GetOwner()]:ChangeMinorCivFriendshipWithMajor(pPlayer, coefficient)
						print("Influence modded")
						local pPlot = pTarget:Plot()
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "Potlatch:[NEWLINE]+"..coefficient.." [ICON_INFLUENCE] Influence", 0)
					end
					print("pTarget is ", pTarget)
				end
			end
		end
		save(pPlayer, "IsAge", pPlayer:IsGoldenAge())
	end
end

function StomexGold(player)
	local pPlayer = Players[player]
	if pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLCOASTSALISH then
		for uUnit in pPlayer:Units() do
			if uUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLSTOMEX) then
			    local iCash = (uUnit:GetLevel() - 2)
				if iCash > 0 then
					local pPlot = uUnit:GetPlot()
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "[COLOR_YIELD_GOLD]+"..iCash.." [ICON_GOLD] Gold[ENDCOLOR]", 0)
					pPlayer:ChangeGold(iCash)
				end
			end
		end
	end
end

function PotlatchHouse(player)
	local pPlayer = Players[player]
	if pPlayer:IsEverAlive() and pPlayer ~= nil then
		for cCity in pPlayer:Cities() do
			local iTrades = 0
			for i,v in ipairs(pPlayer:GetTradeRoutes()) do
				if v.FromCity == cCity then
					if v.FromCity:IsHasBuilding(GameInfoTypes.BUILDING_CLPOTLATCH) or v.ToCity:IsHasBuilding(GameInfoTypes.BUILDING_CLPOTLATCH) then
						if Players[v.ToCity:GetOwner()] ~= pPlayer then
							iTrades = iTrades + 1
						end
					end
				end
			end
			--print("Number of potlatch trading partners is " .. iTrades)
			if iTrades ~= nil and iTrades > 0 and cCity ~= nil then
				print("Setting " .. iTrades .. " bonus potlatch trade buildings!!")
				cCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CLPLFOODHAP, iTrades)
			end
		end
	end
end

for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	local pPlayer = Players[i]
	if pPlayer:IsEverAlive() and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLCOASTSALISH then
		print("Coast Salish UA lua loaded!")
		GameEvents.PlayerDoTurn.Add(GenerosityPoints)
		GameEvents.PlayerDoTurn.Add(GenerosityBomb)
		GameEvents.PlayerDoTurn.Add(StomexGold)
		GameEvents.PlayerDoTurn.Add(PotlatchHouse)
        break
    end
end