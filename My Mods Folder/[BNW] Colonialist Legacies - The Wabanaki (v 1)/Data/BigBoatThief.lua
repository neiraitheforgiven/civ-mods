--Ship Hunter

function DismantleShip (playerId, unitId)
	local pPlayer = Players[playerId]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLWABANAKI then
		for pCity in pPlayer:Cities() do
			local pPlot = pCity:Plot()
			if pPlot:GetNumUnits() > 0 then
				for i = 0, pPlot:GetNumUnits() - 1 do
					local pUnit = pPlot:GetUnit(i)
					print(pUnit:GetName())
					if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WABCAP) or pUnit:GetOwner() ~= pUnit:GetOriginalOwner() then
						local prod = math.floor((GameInfo.Units[pUnit:GetUnitType()].Cost / 3))
						print(pUnit:GetName() .. prod)
						pCity:ChangeProduction(prod)
						Events.GameplayAlertMessage('We have dismantled a foreign ' .. pUnit:GetName() .. ', providing ' .. prod .. ' [ICON_PRODUCTION] Production in ' .. pCity:GetName() .. '!')
						pUnit:Kill(true, -1)
					end
				end
			end
		end
	end
end				
GameEvents.UnitSetXY.Add(DismantleShip)

function ListenSEUSD(playerId, unitId, newDamage, oldDamage)
    if newDamage > oldDamage then --filter out heals
        local pPlayer = Players[playerId]
        for pUnit in pPlayer:Units() do
            if pUnit:GetID() == unitId then
                if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLBBTF) then -- this is a possible the target
                    if pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA then -- this is a possible target. Fan out for adjacent ships
                        local pPlot = pUnit:GetPlot()
                        for i = 0, 5 do
                            local pAdj = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
                            if pAdj ~= nil then
                                if pAdj:GetNumUnits() > 0 then
                                    for i = 0, pAdj:GetNumUnits() - 1 do
                                        local pSH = pAdj:GetUnit(i)
                                        if pSH:IsHasPromotion(GameInfoTypes.PROMOTION_CLBBTF) then
                                            if pSH:GetCurrHitPoints() > 40 then
                                                local pSHO = pSH:GetOwner()
                                                local pNew = Players[pSHO]:InitUnit(pUnit:GetUnitType(), pPlot:GetX(), pPlot:GetY(), pUnit:GetUnitAIType(), pUnit:GetFacingDirection())
                                                pNew:Convert(pUnit)
                                                pNew:SetHasPromotion(GameInfoTypes.PROMOTION_WABCAP, true)
												pSH:SetDamage(pSH:GetDamage() + 40)
												pNew:SetDamage(math.max(pSH:GetDamage(), 60))
												pNew:SetMoves(0)
                                                pUnit:Kill()
												pSH:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBTF, false)
												Events.GameplayAlertMessage('Our ' .. pSh:GetName() .. ' boarded and captured an enemy ' ..pUnit:GetName().. '!')
                                                print('UKIC Worked. You are the player. Hooray!!!')
                                            else
                                                pSH:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBTF, false)
                                                pSH:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBT, true)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end 
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
            if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLBBTF) then -- unit attacked someone
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBTF, false)
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBT, true)
                print('UKIC Worked. You are the player. Hooray!!!')
            end
        end
    elseif kPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLWABANAKI then
        for pUnit in kPlayer:Units() do
            if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLBBTF) then -- unit attacked someone
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBTF, false)
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBT, true)
                print('UKIC Worked. You are the player. Hooray!!!')
            end
        end
    end
    return --this event expects a return, so it perfoms better if you give it one
end
GameEvents.UnitKilledInCombat.Add(ListenUKIC)

function ListenPT(playerId) -- all else has failed, we'll do this on the next turn
    local pPlayer = Players[playerId]
    for pUnit in pPlayer:Units() do
       if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLBBTF) then -- unit attacked someone
            pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBTF, false)
            pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLBBT, true)
            print('PT Worked. Bummer')
        end
    end
    return --this event expects a return, so it perfoms better if you give it one
end
GameEvents.PlayerDoTurn.Add(ListenPT)