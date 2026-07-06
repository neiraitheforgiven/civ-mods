-- UniqueCulturalInfluence
-- Author: Mir
-- DateCreated: 10/4/2014 1:23:37 AM
--------------------------------------------------------------

function ChangeInfluentialText()
    for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[iPlayer]
        if player ~= nil and player:IsAlive() and player:IsHuman() then
			local text
			local tag = "TXT_KEY_GENERIC_" ..string.gsub(GameInfo.Civilizations[player:GetCivilizationType()].Type, "CIVILIZATION_", "") .."_INFLUENTIAL_ON_AI_1"
			--print( tag )
			local locale = "Language_" ..Locale.GetCurrentLanguage().Type
			--print ( locale )
			for _ in DB.Query("SELECT Text FROM " ..locale .." WHERE Tag='" ..tag .."'") do text = _.Text end
			if text then
				--print (text)
				for _ in DB.Query("UPDATE " ..locale .." SET Text = '" ..text .."' WHERE Tag='TXT_KEY_GENERIC_INFLUENTIAL_ON_AI_1'") do end
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
			end
        end
    end
end

Events.SequenceGameInitComplete.Add( ChangeInfluentialText );