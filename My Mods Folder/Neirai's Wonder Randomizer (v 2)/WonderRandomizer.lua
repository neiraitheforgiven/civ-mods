-- WonderRandomizer
-- Author: Neirai
-- DateCreated: 12/30/2015 8:40:51 AM
--------------------------------------------------------------

include( "Sukritact_SaveUtils" ); MY_MOD_NAME = "WonderRandomizer";

local n = {}
n[0] = 3
n[1] = 7
n[2] = 7
n[3] = 7
n[4] = 2
n[5] = 6
n[6] = 3
n[7] = 2
n[8] = 9
n[9] = 4

local e = {}
e[0] = 'ERA_ANCIENT'
e[1] = 'ERA_CLASSICAL'
e[2] = 'ERA_MEDIEVAL'
e[3] = 'ERA_RENAISSANCE'
e[4] = 'ERA_INDUSTRIAL'
e[5] = 'ERA_MODERN'
e[6] = 'ERA_ATOMIC'
e[7] = 'ERA_INFORMATION'
e[8] = 'ERA_ENLIGHTENMENT'
e[9] = 'ERA_PREHISTORIC'

local s = {}
s[0] = {}
s[1] = {}
s[2] = {}
s[3] = {}
s[4] = {}
s[5] = {}
s[6] = {}
s[7] = {}
s[8] = {}
s[9] = {}
for PB in GameInfo.PolicyBranchTypes() do
	s[PB.Type] = {}
end

local function shuffle(t)
  local n = #t
  while n > 2 do
    local k = Game.Rand(#t, 'Shuffling Wonders!')
    t[n], t[k] = t[k], t[n]
    n = n - 1
 end
 return t
end

function randomizeWonders()
	for BT in GameInfo.Buildings() do
		local BC = BT.BuildingClass
		if GameInfo.BuildingClasses[BC].MaxGlobalInstances == 1 then
			if BT.Cost == -1 then
				--this is a special wonder like one in Decisions
				save(Players[0], BT.Type, true)
				--print(BT.Type .. ' enabled due to being a cost exception.')
			elseif BT.PolicyBranchType ~= nil then
				--this is a wonder that comes from a policy. We can randomize these but they should have their own table because we only want one.
				table.insert(s[BT.PolicyBranchType], 1, BT)
				--print(tostring(BT.Type) .. ' added to Policy Branch Table '.. tostring(BT.PolicyBranchType) .. '.')
			else
				local BTech = BT.PrereqTech
				local BEra = 0
				if BTech == nil then
					BEra = 'ERA_ANCIENT'
				else
				    BEra = GameInfo.Technologies[BTech].Era
				end
				if BEra == nil then
					BEra = 'ERA_ANCIENT'
				end
				for Era = 0, #e - 1, 1 do
					if e[Era] == BEra then
						table.insert(s[Era], 1, BT)
					end
				end
			end
		end
	end
	for Era = 0, #e - 1, 1 do
		s[Era] = shuffle(s[Era])
		for i, BT in pairs(s[Era]) do
			if i < n[Era] then
				--print(BT.Type .. ' enabled.')
			else
				save(Players[0], BT.Type, 'Disable')
				--print(BT.Type .. ' disabled.')
			end
		end
	end
	for PB in GameInfo.PolicyBranchTypes() do
		if #s[PB.Type] ~= 0 then --avoid possible crashes by skipping empty tables
			s[PB.Type] = shuffle(s[PB.Type])
			for i, BT in pairs(s[PB.Type]) do
				if i == 1 then
					--print(BT.Type .. ' enabled for Policy Branch Type '.. PB.Type .. '.')
				else
					save(Players[0], BT.Type, 'Disable')
					--print(BT.Type .. ' disabled.')
				end
			end
		end
	end
	save(Players[0], 'WonderRandomizer', 'Shuffled')
	return
end

if load(Players[0], 'WonderRandomizer') == nil then
	randomizeWonders()
end

function restrictAIWonders(player, city, BT)
	print('restrict?: '..tostring(BT))
	local yesno = load(Players[0], GameInfo.Buildings[BT].Type)
	if yesno == nil then
		print('No record')
	    return true
	elseif yesno == 'Disable' then
	    return false
	else
		return true
	end
end
GameEvents.CityCanConstruct.Add(restrictAIWonders)

function restrictWonders()
	--print('this happened')
	local disabletable = {}
	for BT in GameInfo.Buildings() do
		if load(Players[0], BT.Type) == 'Disable' then
			table.insert(disabletable, BT.Type)
		end
	end
	for i, X in pairs(disabletable) do
		for _ in DB.Query("UPDATE Buildings SET GreatWorkCount = -1, Cost = -1, PrereqTech = Null WHERE Type = '" .. X .. "';") do
			--do nothing, but run the query.
			--oops, it's a command, not a query!
			--Thank God (and LastSword) that this event will trigger a commit at the end.
		end
	end
	return
end
Events.SequenceGameInitComplete.Add(restrictWonders)