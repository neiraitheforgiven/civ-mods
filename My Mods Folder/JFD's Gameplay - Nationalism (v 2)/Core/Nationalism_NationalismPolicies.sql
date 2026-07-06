--==========================================================================================================================
-- NATIONALISM POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Policies (Type,IsNationalism,Description,Civilopedia,Strategy,Help,PolicyBranchType,NumExtraBranches,CultureCost,GridX,GridY,Level,PolicyCostModifier,CulturePerCity,CulturePerWonder,CultureWonderMultiplier,CulturePerTechResearched,CultureImprovementChange,CultureFromKills,CultureFromBarbarianKills,GoldFromKills,EmbarkedExtraMoves,AttackBonusTurns,GoldenAgeTurns,GoldenAgeMeterMod,GoldenAgeDurationMod,NumFreeTechs,NumFreePolicies,NumFreeGreatPeople,MedianTechPercentChange,StrategicResourceMod,WonderProductionModifier,BuildingProductionModifier,GreatPeopleRateModifier,GreatGeneralRateModifier,GreatAdmiralRateModifier,GreatWriterRateModifier,GreatArtistRateModifier,GreatMusicianRateModifier,GreatMerchantRateModifier,GreatScientistRateModifier,DomesticGreatGeneralRateModifier,ExtraHappiness,ExtraHappinessPerCity,UnhappinessMod,CityCountUnhappinessMod,OccupiedPopulationUnhappinessMod,CapitalUnhappinessMod,FreeExperience,WorkerSpeedModifier,AllFeatureProduction,ImprovementCostModifier,ImprovementUpgradeRateModifier,SpecialistProductionModifier,SpecialistUpgradeModifier,MilitaryProductionModifier,BaseFreeUnits,BaseFreeMilitaryUnits,FreeUnitsPopulationPercent,FreeMilitaryUnitsPopulationPercent,HappinessPerGarrisonedUnit,CulturePerGarrisonedUnit,HappinessPerTradeRoute,HappinessPerXPopulation,ExtraHappinessPerLuxury,UnhappinessFromUnitsMod,NumExtraBuilders,PlotGoldCostMod,PlotCultureCostModifier,PlotCultureExponentModifier,NumCitiesPolicyCostDiscount,GarrisonedCityRangeStrikeModifier,UnitPurchaseCostModifier,BuildingPurchaseCostModifier,CityConnectionTradeRouteGoldModifier,TradeMissionGoldModifier,FaithCostModifier,CulturalPlunderMultiplier,StealTechSlowerModifier,StealTechFasterModifier,CatchSpiesModifier,GoldPerUnit,GoldPerMilitaryUnit,RouteGoldMaintenanceMod,BuildingGoldMaintenanceMod,UnitGoldMaintenanceMod,UnitSupplyMod,UnitUpgradeCostMod,CityStrengthMod,CityGrowthMod,CapitalGrowthMod,SettlerProductionModifier,CapitalSettlerProductionModifier,NewCityExtraPopulation,FreeFoodBox,HappyPerMilitaryUnit,MilitaryFoodProduction,HappinessToCulture,HappinessToScience,NumCitiesFreeCultureBuilding,NumCitiesFreeFoodBuilding,HalfSpecialistUnhappiness,HalfSpecialistFood,MaxConscript,UnitSightRangeChange,WoundedUnitDamageMod,BarbarianCombatBonus,AlwaysSeeBarbCamps,RevealAllCapitals,FreeSpecialist,ExpModifier,ExpInBorderModifier,MinorQuestFriendshipMod,MinorGoldFriendshipMod,MinorFriendshipMinimum,MinorFriendshipDecayMod,OtherPlayersMinorFriendshipDecayMod,CityStateUnitFrequencyModifier,CommonFoeTourismModifier,LessHappyTourismModifier,SharedIdeologyTourismModifier,LandTradeRouteGoldChange,SeaTradeRouteGoldChange,SharedIdeologyTradeGoldChange,RiggingElectionModifier,MilitaryUnitGiftExtraInfluence,ProtectedMinorPerTurnInfluence,AfraidMinorPerTurnInfluence,MinorBullyScoreModifier,CityStateTradeChange,ThemingBonusMultiplier,InternalTradeRouteYieldModifier,SharedReligionTourismModifier,TradeRouteTourismModifier,OpenBordersTourismModifier,MinorGreatPeopleAllies,MinorScienceAllies,MinorResourceBonus,GarrisonFreeMaintenance,GoldenAgeCultureBonusDisabled,SecondReligionPantheon,AddReformationBelief,EnablesSSPartHurry,EnablesSSPartPurchase,AbleToAnnexCityStates,OneShot,IncludesOneShotFreeUnits,WeLoveTheKing,FreeBuildingOnConquest,TechPrereq,PortraitIndex,IconAtlas,IconAtlasAchieved)
SELECT Type || '_NATIONALISM',1,Description,Civilopedia,Strategy,Help,null,NumExtraBranches,CultureCost,GridX,GridY,Level,PolicyCostModifier,CulturePerCity,CulturePerWonder,CultureWonderMultiplier,CulturePerTechResearched,CultureImprovementChange,CultureFromKills,CultureFromBarbarianKills,GoldFromKills,EmbarkedExtraMoves,AttackBonusTurns,GoldenAgeTurns,GoldenAgeMeterMod,GoldenAgeDurationMod,NumFreeTechs,NumFreePolicies,NumFreeGreatPeople,MedianTechPercentChange,StrategicResourceMod,WonderProductionModifier,BuildingProductionModifier,GreatPeopleRateModifier,GreatGeneralRateModifier,GreatAdmiralRateModifier,GreatWriterRateModifier,GreatArtistRateModifier,GreatMusicianRateModifier,GreatMerchantRateModifier,GreatScientistRateModifier,DomesticGreatGeneralRateModifier,ExtraHappiness,ExtraHappinessPerCity,UnhappinessMod,CityCountUnhappinessMod,OccupiedPopulationUnhappinessMod,CapitalUnhappinessMod,FreeExperience,WorkerSpeedModifier,AllFeatureProduction,ImprovementCostModifier,ImprovementUpgradeRateModifier,SpecialistProductionModifier,SpecialistUpgradeModifier,MilitaryProductionModifier,BaseFreeUnits,BaseFreeMilitaryUnits,FreeUnitsPopulationPercent,FreeMilitaryUnitsPopulationPercent,HappinessPerGarrisonedUnit,CulturePerGarrisonedUnit,HappinessPerTradeRoute,HappinessPerXPopulation,ExtraHappinessPerLuxury,UnhappinessFromUnitsMod,NumExtraBuilders,PlotGoldCostMod,PlotCultureCostModifier,PlotCultureExponentModifier,NumCitiesPolicyCostDiscount,GarrisonedCityRangeStrikeModifier,UnitPurchaseCostModifier,BuildingPurchaseCostModifier,CityConnectionTradeRouteGoldModifier,TradeMissionGoldModifier,FaithCostModifier,CulturalPlunderMultiplier,StealTechSlowerModifier,StealTechFasterModifier,CatchSpiesModifier,GoldPerUnit,GoldPerMilitaryUnit,RouteGoldMaintenanceMod,BuildingGoldMaintenanceMod,UnitGoldMaintenanceMod,UnitSupplyMod,UnitUpgradeCostMod,CityStrengthMod,CityGrowthMod,CapitalGrowthMod,SettlerProductionModifier,CapitalSettlerProductionModifier,NewCityExtraPopulation,FreeFoodBox,HappyPerMilitaryUnit,MilitaryFoodProduction,HappinessToCulture,HappinessToScience,NumCitiesFreeCultureBuilding,NumCitiesFreeFoodBuilding,HalfSpecialistUnhappiness,HalfSpecialistFood,MaxConscript,UnitSightRangeChange,WoundedUnitDamageMod,BarbarianCombatBonus,AlwaysSeeBarbCamps,RevealAllCapitals,FreeSpecialist,ExpModifier,ExpInBorderModifier,MinorQuestFriendshipMod,MinorGoldFriendshipMod,MinorFriendshipMinimum,MinorFriendshipDecayMod,OtherPlayersMinorFriendshipDecayMod,CityStateUnitFrequencyModifier,CommonFoeTourismModifier,LessHappyTourismModifier,SharedIdeologyTourismModifier,LandTradeRouteGoldChange,SeaTradeRouteGoldChange,SharedIdeologyTradeGoldChange,RiggingElectionModifier,MilitaryUnitGiftExtraInfluence,ProtectedMinorPerTurnInfluence,AfraidMinorPerTurnInfluence,MinorBullyScoreModifier,CityStateTradeChange,ThemingBonusMultiplier,InternalTradeRouteYieldModifier,SharedReligionTourismModifier,TradeRouteTourismModifier,OpenBordersTourismModifier,MinorGreatPeopleAllies,MinorScienceAllies,MinorResourceBonus,GarrisonFreeMaintenance,GoldenAgeCultureBonusDisabled,SecondReligionPantheon,AddReformationBelief,EnablesSSPartHurry,EnablesSSPartPurchase,AbleToAnnexCityStates,OneShot,IncludesOneShotFreeUnits,WeLoveTheKing,FreeBuildingOnConquest,TechPrereq,PortraitIndex,IconAtlas,IconAtlasAchieved || '_NATIONALISM'
FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_CityYieldChanges (PolicyType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', YieldType, Yield
FROM Policy_CityYieldChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_CoastalCityYieldChanges (PolicyType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', YieldType, Yield
FROM Policy_CoastalCityYieldChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_CapitalYieldChanges (PolicyType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', YieldType, Yield
FROM Policy_CapitalYieldChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_CapitalYieldPerPopChanges (PolicyType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', YieldType, Yield
FROM Policy_CapitalYieldPerPopChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_CapitalYieldModifiers (PolicyType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', YieldType, Yield
FROM Policy_CapitalYieldModifiers WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_GreatWorkYieldChanges (PolicyType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', YieldType, Yield
FROM Policy_GreatWorkYieldChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_HurryModifiers (PolicyType, HurryType, HurryCostModifier)
SELECT PolicyType || '_NATIONALISM', HurryType, HurryCostModifier
FROM Policy_HurryModifiers WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_SpecialistExtraYields (PolicyType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', YieldType, Yield
FROM Policy_SpecialistExtraYields WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
SELECT PolicyType || '_NATIONALISM', BuildingClassType, YieldType, YieldMod
FROM Policy_BuildingClassYieldModifiers WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT PolicyType || '_NATIONALISM', BuildingClassType, YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassCultureChanges (PolicyType, BuildingClassType, CultureChange)
SELECT PolicyType || '_NATIONALISM', BuildingClassType, CultureChange
FROM Policy_BuildingClassCultureChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers (PolicyType, BuildingClassType, ProductionModifier)
SELECT PolicyType || '_NATIONALISM', BuildingClassType, ProductionModifier
FROM Policy_BuildingClassProductionModifiers WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassTourismModifiers (PolicyType, BuildingClassType, TourismModifier)
SELECT PolicyType || '_NATIONALISM', BuildingClassType, TourismModifier
FROM Policy_BuildingClassTourismModifiers WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassHappiness (PolicyType, BuildingClassType, Happiness)
SELECT PolicyType || '_NATIONALISM', BuildingClassType, Happiness
FROM Policy_BuildingClassHappiness WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges (PolicyType, ImprovementType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', ImprovementType, YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementCultureChanges (PolicyType, ImprovementType, CultureChange)
SELECT PolicyType || '_NATIONALISM', ImprovementType, CultureChange
FROM Policy_ImprovementCultureChanges WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ValidSpecialists (PolicyType, SpecialistType)
SELECT PolicyType || '_NATIONALISM', SpecialistType
FROM Policy_ValidSpecialists WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_YieldModifiers (PolicyType, YieldType, Yield)
SELECT PolicyType || '_NATIONALISM', YieldType, Yield
FROM Policy_YieldModifiers WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FreePromotions (PolicyType, PromotionType)
SELECT PolicyType || '_NATIONALISM', PromotionType || '_NATIONALISM'
FROM Policy_FreePromotions WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_UnitCombatFreeExperiences (PolicyType, UnitCombatType, FreeExperience)
SELECT PolicyType || '_NATIONALISM', UnitCombatType, FreeExperience
FROM Policy_UnitCombatFreeExperiences WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FreePromotionUnitCombats (PolicyType, UnitCombatType, PromotionType)
SELECT PolicyType || '_NATIONALISM', UnitCombatType, PromotionType || '_NATIONALISM'
FROM Policy_FreePromotionUnitCombats WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_UnitCombatProductionModifiers (PolicyType, UnitCombatType, ProductionModifier)
SELECT PolicyType || '_NATIONALISM', UnitCombatType, ProductionModifier
FROM Policy_UnitCombatProductionModifiers WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FreeUnitClasses (PolicyType, UnitClassType, Count)
SELECT PolicyType || '_NATIONALISM', UnitClassType, Count
FROM Policy_FreeUnitClasses WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_TourismOnUnitCreation (PolicyType, UnitClassType, Tourism)
SELECT PolicyType || '_NATIONALISM', UnitClassType, Tourism
FROM Policy_TourismOnUnitCreation WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FreeItems (PolicyType, SetType, MinItems, MaxItems)
SELECT PolicyType || '_NATIONALISM', SetType, MinItems, MaxItems
FROM Policy_FreeItems WHERE PolicyType IS NOT NULL
AND PolicyType IN (SELECT Type FROM Policies WHERE PolicyBranchType IS NOT NULL AND Level = 0); 
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
--==========================================================================================================================