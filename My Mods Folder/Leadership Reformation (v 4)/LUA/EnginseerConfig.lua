------------------------------------------------------
-- Leader Reformation Config
-- 
-- This is the "user-friendly" config.
------------------------------------------------------ 
RandomExperience = true --Setting this to false disables random experience and only allows static experience.
CityYieldTraits = true --Setting this to false disables the bonus yields that Great General/Admirals may give to their non-coastal/coastal cities.
XPRequiredForLevel2 = 25 --This value determines the amount of XP to reach level 2 on a Great General/Admiral. Quick/Normal/Epic/Marathon do modify this value by 0.5/1.0/1.5/2.0
XPRequiredForLevel3 = 60 --This value determines the amount of XP to reach level 3 on a Great General/Admiral. Quick/Normal/Epic/Marathon do modify this value by 0.5/1.0/1.5/2.0
XPEarnedOnTile = 1 --This value determines how much MAX experience can be earned for ranged kills.
XPEarnedAdjacentTile = 2 --This value determines how much MAX experience can be earned for GG/GA when units adjacent to them destroy an enemy unit. 
XPEarned2ndTileAway = 2 --This value determines how much MAX experience can be earned for GG/GA when units two tile away from them destroy an enemy unit.
XPEarned3rdTileAway = 2 --This value determines how much MAX experience can be earned for GG/GA when units three tile away from them destroy an enemy unit.
XPEarned4thTileAway = 2 --This value determines how much MAX experience can be earned for GG/GA when units four tile away from them destroy an enemy unit.
------------------------------------------------------
--    This is is how much experience can be given.  --
------------------------------------------------------
if RandomExperience then 
	XPEarnedMeleeExperience = {1, 2, 3, 4, 5}
	XPEarnedRangedExperience = {1, 2, 3}
end
------------------------------------------------------
-- XP Modifiers, you may touch the modifiers only.  --
------------------------------------------------------
Expneeded2 = XPRequiredForLevel2
Expneeded3 = XPRequiredForLevel3
-- marathon: 1.5x the XP requirement
if (Game.GetGameSpeedType() == 0) then
	Expneeded2 = math.ceil(XPRequiredForLevel2*1.5)
	Expneeded3 = math.ceil(XPRequiredForLevel3*1.5)
end
-- epic: 1.25x the XP requirement
if (Game.GetGameSpeedType() == 1) then
	Expneeded2 = math.ceil(XPRequiredForLevel2*1.25)
	Expneeded3 = math.ceil(XPRequiredForLevel3*1.25)
end
-- normal: 1.0x the XP requirement
if (Game.GetGameSpeedType() == 2) then
	Expneeded2 = math.ceil(XPRequiredForLevel2*1)
	Expneeded3 = math.ceil(XPRequiredForLevel3*1)
end
-- quick: 0.5x the XP requirement
if (Game.GetGameSpeedType() == 3) then
	Expneeded2 = math.ceil(XPRequiredForLevel2*0.5)
	Expneeded3 = math.ceil(XPRequiredForLevel3*0.5)
end
-- Global City Trait List
if CityYieldTraits then
	CityTraitsList = { GameInfoTypes.PROMOTION_MILITARY_ADDER, GameInfoTypes.PROMOTION_SCIENCE_ADDER, GameInfoTypes.PROMOTION_FAITH_ADDER, GameInfoTypes.PROMOTION_GOLD_ADDER, GameInfoTypes.PROMOTION_PRODUCTION_ADDER, GameInfoTypes.PROMOTION_CULTURE_ADDER, GameInfoTypes.PROMOTION_FOOD_ADDER, "NONE", "NONE", "NONE" }
end