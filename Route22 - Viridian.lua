name = "Leveling: Route 22 (near Viridian)"
author = "Tester"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Viridian City and Route 22.]]

function onPathAction()
	if isPokemonUsable(1) then
		if stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Viridian") then
			moveToCell(9, 129)
		elseif getAreaName() == "Viridian City" then
			moveToArea("Route 22")
		elseif getAreaName() == "Route 22" then
			moveLinearX(90, 95, 100)
		end
	else
		if getAreaName() == "Route 22" then
			moveToArea("Viridian City")
		elseif getAreaName() == "Viridian City" then
			moveToCell(146, 91)
		elseif stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Viridian") then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") then
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
	forgetAnyMoveExcept({"Ember", "Dragon Rage", "Vine Whip", "Tackle", "Fire Fang", "Water Gun"})
	log("[INFO] A Pokemon is trying to learn "..moveName .. "!")
end
