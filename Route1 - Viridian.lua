name = "Leveling: Route 1 (near Viridian)"
author = "Tester"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Viridian City and Route 1.]]

lagCount = 0

function onStart() 
	startTime = os.time()
	coordinates = {
		{160, 164, 122},
		{160, 164, 123},
		{156, 160, 122},
		{162, 164, 125},
		{122, 125, 164}
	}
	timeToPickACoordinate = 1
   	newcoordinate = coordinates[math.random(1, #coordinates)]
end

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "kanto_e_pallet_viridian_01_02_21_22" and getAreaName() != "Route 1" then
			return moveToArea("Route 1")
		elseif getMapName() == "kanto_i_pallet" then
			return moveToCell(13, 13) or moveToCell(73, 7)
		elseif stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Viridian") then
			return moveToCell(9, 129) 
		elseif getAreaName() == "Route 1" then
			if os.difftime(os.time(), startTime) > timeToPickACoordinate * 60 then
               startTime = os.time()
               newcoordinate = coordinates[math.random(1, #coordinates)]
            end
			return moveLinearX(newcoordinate) or moveLinearY(newcoordinate)
		end
	else
		if getAreaName() == "Route 1" then
			return moveToArea("Viridian City")
		elseif getAreaName() == "Viridian City" then
			return moveToCell(146, 91)
		elseif stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Viridian") then
			return usePokecenter()
		end
	end
end

function onBattleAction()
	wasInBattle = true
	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poké Ball") then
			return
		end
	end
	if getActivePokemonNumber() == 1 then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end

function onLearningMove(moveName, pokemonIndex)
	forgetAnyMoveExcept({"Ember", "Dragon Rage", "Vine Whip", "Tackle", "Fire Fang", "Water Gun", "Bubble"})
	log("[INFO] A Pokemon is trying to learn "..moveName .. "!")
end

function onMovementLag(distance)
	lagCount = lagCount + 1
    log("Got lag total of "..lagCount.." these lag can happen for teleportation or for battle or for proxy.")
end

function onWarningMessage(isDifferentMap, distance)
	
end
