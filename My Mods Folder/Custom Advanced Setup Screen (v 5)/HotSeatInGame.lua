-- Lua Hotseat Ingame
-- Author: Gedemon
-- DateCreated: 4/21/2012 12:32:10 AM
--------------------------------------------------------------

function NewGetNickName(self)
	local playerID = self:GetID()
	local civIndex = PreGame.GetCivilization( playerID )
	if( civIndex ~= -1 ) then
		local civ = GameInfo.Civilizations[ civIndex ]
		local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType]
		return Locale.ConvertTextKey(leader.Description)
	else
		local name = self:GetName()
		return name
	end
end

function InitializeHotseat()
	if Game.IsHotSeat() then
		print("Initializing Hotseat game...")
		-- replace player:GetName() by custom test function...
		local p = getmetatable(Players[0]).__index
		p.OldGetNickName = p.GetNickName
		p.GetNickName = NewGetNickName

		if (PreGame.GetGameOption("GAMEOPTION_NO_MP_LIST") > 0) then
			print("No MP list option is activated...")
			ContextPtr:LookUpControl("/InGame/WorldView/MPList/MPListStack"):SetHide(true)
		end
	end
end

Events.SequenceGameInitComplete.Add( InitializeHotseat )