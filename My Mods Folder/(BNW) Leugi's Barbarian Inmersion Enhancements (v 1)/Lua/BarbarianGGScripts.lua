--=======================================================================================================================
--=======================================================================================================================
-- Include other lua stuff:
include("Leugi_Barbarian_Settings")

--=======================================================================================================================
--=======================================================================================================================

SpeedGold = (GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldPercent / 100)
SpeedCulture = (GameInfo.GameSpeeds[Game.GetGameSpeedType()].CulturePercent / 100)

function Leugi_BarbarianGG(iPlayer)
	print ("Barb GG func")
	local bPlayer = Players[iPlayer];
	if (bPlayer:IsAlive()) then
		print ("1")
		if bPlayer:IsBarbarian() then
			print ("2")
			for bUnit in bPlayer:Units() do
				print ("3")
				if bUnit:GetID() ~= GameInfoTypes["UNIT_BARBARIAN_GENERAL"] then
					print ("4")
					local uPlot = bUnit:GetPlot();
					if not ( uPlot:GetNumUnits() > 1 ) then
						print ("5")
						local ImpID = uPlot:GetImprovementType()
						if ImpID == GameInfoTypes.IMPROVEMENT_BARBARIAN_CAMP then
							print ("6")
							local random = Map.Rand(40, "Random Possibility of General")
							if random == 1 then
								print ("A BarbArian General was Born!")
								iUnitID = GameInfoTypes["UNIT_BARBARIAN_GENERAL"]
								unit = bPlayer:InitUnit (iUnitID, uPlot:GetX(), uPlot:GetY());
								unit:JumpToNearestValidPlot()
							else
								print ("aww, no general")
							end
						end
					end
				end
			end
		end
	end
end

function Leugi_BarbarianHealing(iPlayer)
	local bPlayer = Players[iPlayer];
	if (bPlayer:IsAlive()) then
		if bPlayer:IsBarbarian() then
			for bUnit in bPlayer:Units() do
				if bUnit:IsStackedGreatGeneral() then
					bUnit:ChangeDamage(-25);
				end
			end
		end
	end
end

local iBoostID = GameInfo.Units.UNIT_GENERALBOOST.ID

function GrantGeneralGold(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
       	    if pPlayer:GetUnitByID(iUnit) ~= nil then
				pUnit = pPlayer:GetUnitByID(iUnit);
                if (pUnit:GetUnitType() == iBoostID) then
					local eratype = pPlayer:GetCurrentEra();
                    pUnit:Kill(true, -1);
					culturebonus = 75 * eratype * SpeedCulture
					goldbonus = 75 * eratype * SpeedGold
					pPlayer:ChangeJONSCulture(culturebonus);
					pPlayer:ChangeGold (goldbonus);
					if (pPlayer:IsHuman()) then
						local alert = "Capturing the hostile Great General has earned " .. culturebonus .. "[ICON_CULTURE] Culture and " .. goldbonus .. "[ICON_GOLD] Gold!"
						Events.GameplayAlertMessage(alert)
						isgeneral = 1
					end
                end
            end
    end
end


if settings_BarbarianGenerals == 1 then
	GameEvents.PlayerDoTurn.Add(Leugi_BarbarianGG)
	GameEvents.PlayerDoTurn.Add(Leugi_BarbarianHealing)
	Events.SerialEventUnitCreated.Add(GrantGeneralGold)
	isgeneral = 0
	print("Barbarian Generals are active")
end
