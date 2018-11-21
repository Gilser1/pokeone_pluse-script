name = "Leveling: Route 6 (near Vermilion)"
author = "Froakie"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Vermilion City and Route 6.]]

function onPathAction()
	if isPokemonUsable(1) then
		if stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Vermilion") then
			moveToCell(141,98)
		elseif getAreaName() == "Vermilion City" then
			moveToArea("Route 6")
		elseif getAreaName() == "Route 6" then
			moveLinearX(121,127,66)
		end
	else
		if getAreaName() == "Route 6" then
			moveToCell(121,85)			
		elseif getAreaName() == "Vermilion City" then
			moveToCell(107,105)
		elseif stringContains(getAreaName(), "Center") and stringContains(getAreaName(), "Vermilion") then
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
		return attack() or sendUsablePokemon() or run()
	else 
		return run() or sendUsablePokemon() or sendAnyPokemon()
	end
end

function onLearningMove(moveName, pokemonIndex)
	forgetAnyMoveExcept({"Ember", "Dragon Rage", "Vine Whip", "Tackle", "Fire Fang", "Water Gun", "Thunder Shock" ,"Electro Ball","Quick Attack","Flame Burst"
	,"Bite","Thrash","Ice Fang","Aqua Tail"})
	log("[INFO] A Pokemon is trying to learn "..moveName .. "!")
end
