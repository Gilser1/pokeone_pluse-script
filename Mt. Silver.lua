name = "Leveling: Mt. Silver"
author = "Tester"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Mt. Silver and Mt. Silver Pokécenter.]]


function onPathAction()
	if isPokemonUsable(1) then
		if stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Mt. Silver") then
			moveToCell(22, 36)
		elseif getAreaName() == "Mt. Silver" then
			moveLinearX(51, 59, 27)
		end
	else
		if getAreaName() == "Mt. Silver" then
			moveToCell(46, 23)
		elseif stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Mt. Silver") then
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
	forgetAnyMoveExcept({"Ember", "Dragon Rage", "Vine Whip", "Tackle", "Fire Fang", "Water Gun"})
	log("[INFO] A Pokemon is trying to learn "..moveName .. "!")
end