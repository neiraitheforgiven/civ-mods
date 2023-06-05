include("FLuaVector.lua")
include("Sukritact_SaveUtiles.lua"); MY_MOD_NAME = "Neirai-Pohnpei-Lua";

--=======================================================================================================================
--Place City on coast when founding a city on the coast.

-- Event handler for city creation
function OnCityCreated(
    hexPos, playerID, cityID, cultureType, eraType, continent, populationSize, size, fogState)
  local plot = Map.GetPlot(ToGridFromHex(hexPos.x, hexPos.y))
  local city = Players[playerID]:GetCityByID(cityID)
  local player = Players[playerID]
  if player.GetCivilizationType() == NTF_POHNPEI then
    if not load(player, 'HasFoundedNanMadol') then
      --check if the city is on the coast
      if plot:IsCoastalLand() then
        --get an eligible plot
        local nanMadolPlot = GetNanMadolPlot(plot)
        --create the city
        local nanMadol = player:InitCity(nanMadolPlot:GetX(), nanMadolPlot:GetY())
        nanMadol:SetName("Nan Madol")
        --save that the city has been founded
        save(player, 'HasFoundedNanMadol', true)
        --check all plots owned by both cities



  if plot:IsCoastalLand() then
      -- Get the adjacent plots to the original city
      local adjacentPlots = GetAdjacentPlots(city:Plot())

      -- Find the first empty adjacent plot
      local targetPlot
      for i, adjPlot in ipairs(adjacentPlots) do
          if not adjPlot:IsCity() then
              targetPlot = adjPlot
              break
          end
      end

      -- Create a new city on the target plot
      if targetPlot ~= nil then
          local newCity = Players[playerID]:InitCity(targetPlot:GetX(), targetPlot:GetY())
          newCity:SetName(city:GetName() .. " 2")
      end
  end
end

for _, player in pairs(Players) do
  if player:GetCivilizationType() == NTF_POHNPEI then
    print('Pohnpei found. Loading functions')
    Events.SerialEventCityFounded(OnCityCreated)
    break
  end
end
