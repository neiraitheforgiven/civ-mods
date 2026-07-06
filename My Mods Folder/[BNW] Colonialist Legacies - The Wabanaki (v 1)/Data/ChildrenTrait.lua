--Wabanaki Trait

local function GetWabWaters(playerId, pUnit, inX, inY)
    local pPlot = pUnit:GetPlot()
	if pPlot == nil then
		pPlot = Map.GetPlot(iX, iY)
	end
    local range = 4
    local x = pPlot:GetX()
    local y = pPlot:GetY()
    for dx = -range, range do
        for dy = -range, range do
            local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
            if SpecificPlot ~= nil and SpecificPlot:GetOwner() == playerId and SpecificPlot:IsWater() then
                return true
            end
        end
    end
    return false
end


function GiveWabPromo(playerId, unitId, x, y)
    local pPlayer = Players[playerId]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLWABANAKI then
		print('Wab moves')
        local pUnit = pPlayer:GetUnitByID(unitId)
		if pUnit ~= nil then
			if pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA then
				print("It's a boat")
				if GetWabWaters(playerId, pUnit, x, y) then
					print('Wab Water Found')
					if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF) then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIP, true)
					end
				else
					print('Wab Water Not Found')
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIP, false)
				end
            end
        else
			local pPlot = Map.GetPlot(x, y)
			if pPlot:GetNumUnits() > 0 then
				for i = 0, pPlot:GetNumUnits() - 1, 1 do
					pUnit = pPlot:GetUnit(i)
					if pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA then
						print("It's a boat")
						if GetWabWaters(playerId, pUnit, x, y) then
							print('Wab Water Found')
							if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF) then
								pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIP, true)
							end
						else
							print('Wab Water Not Found')
							pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIP, false)
						end
					end
				end
			end
		end				
    end
end
GameEvents.UnitSetXY.Add(GiveWabPromo)
           

function ListenSEUSD(playerId, unitId, newDamage, oldDamage)
    if newDamage > oldDamage then --filter out heals
        local pPlayer = Players[playerId]
        for pUnit in pPlayer:Units() do
            if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF) then -- unit attacked someone
                pPlayer:ChangeFaith(math.ceil(pUnit:GetDamage() / 30))
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIP, true)
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF, false)
                print('SEUSD Worked. Hooray!!!')
            end
        end
    end
    return --this event expects a return, so it perfoms better if you give it one
end
Events.SerialEventUnitSetDamage.Add(ListenSEUSD)

function ListenUKIC(playerId, killOwnerId, unitId)
    local pPlayer = Players[playerId]
    local kPlayer = Players[killOwnerId]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLWABANAKI then
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF) then -- unit attacked someone
				pPlayer:ChangeFaith(math.ceil(pUnit:GetDamage() / 30))
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIP, true)
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF, false)
				print('UKIC Worked. You are the player. Hooray!!!')
			end
        end
	elseif kPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLWABANAKI then
		for pUnit in kPlayer:Units() do
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF) then -- unit attacked someone
				kPlayer:ChangeFaith(math.ceil(pUnit:GetDamage() / 30))
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIP, true)
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF, false)
				print('UKIC Worked. You are the kill owner. Hooray!!!')
			end
        end
    end
    return --this event expects a return, so it perfoms better if you give it one
end
GameEvents.UnitKilledInCombat.Add(ListenUKIC)

function ListenPT(playerId) -- all else has failed, we'll do this on the next turn
    local pPlayer = Players[playerId]
    for pUnit in pPlayer:Units() do
        if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF) then -- unit attacked someone
            pPlayer:ChangeFaith(math.ceil(pUnit:GetDamage() / 30))
            pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIP, true)
            pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLWABSHIPF, false)
            print('PT Worked. Bummer.')
        end
    end
    return --this event expects a return, so it perfoms better if you give it one
end
GameEvents.PlayerDoTurn.Add(ListenPT)