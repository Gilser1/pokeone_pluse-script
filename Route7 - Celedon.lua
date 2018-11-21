name = "Leveling: Route 7 (near Celadon)"
author = "Tester"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Celadon City and Route 7.]]

function onPathAction()
	if isPokemonUsable(1) then
		if stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Celadon") then
			moveToCell(12, 84)
		elseif getAreaName() == "Celadon City" then
			moveToArea("Route 7")
		elseif getAreaName() == "Route 7" then
			moveLinearX(203, 209, 88)
		end
	else
		if getAreaName() == "Route 7" then
			moveToArea("Celadon City")
		elseif getAreaName() == "Celadon City" then
			moveToCell(165, 82)
		elseif stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Celadon") then
			usePokecenter()
		end
	end
end

function onBattleAction()
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
	forgetAnyMoveExcept({"Dragon Rage", "Vine Whip", "Fire Fang", "Water Pulse", "Aqua Tail", "Cut", "Fly", "Surf", "Sucker Punch"})
	log("[INFO] A Pokemon is trying to learn "..moveName .. "!")
end
