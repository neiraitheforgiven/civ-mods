--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView
            (StrategicViewType,									TileType,   Asset)
VALUES      ('ART_DEF_UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER',	'Unit',     'sv_appaloosarider.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================           
INSERT INTO ArtDefine_UnitInfos
            (Type,											DamageStates,   Formation)
SELECT      ('ART_DEF_UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'),	DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE  (Type = 'ART_DEF_UNIT_U_HUNS_HORSE_ARCHER');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitInfoMemberInfos  
            (UnitInfoType,										UnitMemberInfoType,											NumMembers)
VALUES		('ART_DEF_UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER',	'ART_DEF_UNIT_MEMBER_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER',		5);

--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
--Model 1
INSERT INTO ArtDefine_UnitMemberCombats
            (UnitMemberType,											EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER');

--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
--Model 1
INSERT INTO ArtDefine_UnitMemberCombatWeapons  
            (UnitMemberType,											"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER');

--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitMemberInfos  
            (Type,															Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'),		Scale, ZOffset, Domain, ('nez_perce_horse.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER');

--==========================================================================================================================
--==========================================================================================================================