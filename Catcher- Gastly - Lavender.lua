name = "Catcher: Gastly and Haunter (near Lavender)"
author = "Tester"
description = [[This script will catch Gastly and Haunter using sync Pokémon at frist slot.
If it encounters any Gastly it will switch to any other Pokémon and will try to throw balls to catch it.
Start anywhere between Lavender Town and Pokémon Tower 3F.]]

function onPathAction()
	if isPokemonUsable(2) and getPokemonHealth(1) > 0 then
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

	if getOpponentName() == "Gastly" or getOpponentName() == "Haunter" then
		if getActivePokemonNumber() == 1 then
			return sendPokemon(2) or sendUsablePokemon() or sendAnyPokemon() or run()
		else
			return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poké Ball")
		end
	end
	return run() or attack() or sendAnyPokemon()
end