name = "Leveling: Pokémon Tower 3F (near Lavender)"
author = "Tester"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Lavender Town and Pokémon Tower 3F.]]

function onPathAction()
	if isPokemonUsable(1) then
		if stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Lavender") then
			moveToCell(53, 25)
		elseif getAreaName() == "Lavender Town" then
			moveToCell(126, 117)
		elseif getAreaName() == "Pokémon Tower" then
			moveToCell(23, 16)
		elseif getAreaName() == "Pokémon Tower 2F" then
			moveToCell(74, 15)
		elseif getAreaName() == "Pokémon Tower 3F" then
			moveLinearX(117, 121, 18)
		end
	else
		if getAreaName() == "Pokémon Tower 3F" then
			moveToCell(119, 17)
		elseif getAreaName() == "Pokémon Tower 2F" then
			moveToCell(58, 16)
		elseif getAreaName() == "Pokémon Tower" then
			moveToCell(15, 25)
		elseif getAreaName() == "Lavender Town" then
			moveToCell(115, 116)
		elseif stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Lavender") then
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
	forgetAnyMoveExcept({"Ember", "Dragon Rage", "Vine Whip", "Tackle", "Fire Fang", "Water Gun", "Bubble", "Shadow Ball", "Psychic", "Dark Pulse"})
	log("[INFO] A Pokemon is trying to learn "..moveName .. "!")
end