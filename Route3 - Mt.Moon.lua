name = "Leveling: Route 3 (near Mt.Moon)"
author = "Tester"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Mt.Moon and Route 3.]]

function onPathAction()
	if isPokemonUsable(1) then
		if stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Mt. Moon") then
			moveToCell(10, 25)
		elseif getAreaName() == "Route 3" then
			moveLinearX(183, 188, 73)
		end
	else
		if getAreaName() == "Route 3" then
			moveToCell(178, 48)
		elseif stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Mt. Moon") then
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
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else 
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end

function onLearningMove(moveName, pokemonIndex)
	forgetAnyMoveExcept({"Ember", "Dragon Rage", "Vine Whip", "Tackle", "Fire Fang", "Water Gun"})
	log("[INFO] A Pokemon is trying to learn "..moveName .. "!")
end
