/*-**************-*\
City-States
\*-**************-*/

UPDATE MinorCivilizations SET Type = 'MINOR_CIV_FB_TAKRUR', Description = 'TXT_KEY_MINOR_CIV_FB_TAKRUR', ShortDescription = Description, Adjective = 'TXT_KEY_MINOR_CIV_FB_TAKRUR_ADJ', Civilopedia = 'TXT_KEY_MINOR_CIV_FB_TAKRUR_PEDIA', ArtStyleType = 'ARTSTYLE_MIDDLE_EASTERN', ArtStylePrefix = 'AFRICAN', ArtStyleSuffix = '_AFRI' WHERE Type = 'MINOR_CIV_SOFIA';
UPDATE MinorCivilization_CityNames SET MinorCivType = 'MINOR_CIV_FB_TAKRUR', CityName = 'TXT_KEY_MINOR_CIV_FB_TAKRUR' WHERE MinorCivType = 'MINOR_CIV_SOFIA';
UPDATE MinorCivilization_Flavors SET MinorCivType = 'MINOR_CIV_FB_TAKRUR' WHERE MinorCivType = 'MINOR_CIV_SOFIA';