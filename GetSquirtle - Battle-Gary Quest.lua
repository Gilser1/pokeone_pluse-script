name = "Starting Quest"
author = "Purple"
description = [[This script will get a starter from Prof. Oak.
This script will also beat Gary. You can set the starter by editing the script.]]


function onStart()
	talkedToMom = false
	doneQuest = false
	starterName = "Squirtle"
end


function onPathAction()
	if doneQuest then
		fatal("Done quest!")
	end
	if getTeamSize() > 0 then
		if getAreaName() == "Pallet Town" and isNpcOnCell(75, 9) then
			return moveToCell(73, 7)
		elseif getAreaName() == "Pallet Town" and isNpcOnCell(14, 7) then
			return moveToCell(13, 13)
		elseif getAreaName() == "Oak's Lab" then
			return moveToCell(22, 108)
		elseif getMapName() == "kanto_e_pallet_viridian_01_02_21_22" and isNpcOnCell(150, 174) then
			return talkToNpcOnCell(150, 174)
		elseif not isNpcOnCell(150, 174) then
			doneQuest = true
		end
	else
		if getAreaName() == "Pallet Town" and getMapName() != "kanto_e_pallet_viridian_01_02_21_22" then
			if not talkedToMom then
				return moveToCell(73, 7) or talkToNpcOnCell(14, 7)
			else
				return moveToCell(73, 7) or moveToCell(13, 13)
			end
		elseif getMapName() == "kanto_e_pallet_viridian_01_02_21_22" then
			return moveToCell(158, 192)
		elseif getAreaName() == "Oak's Lab" then
			pushDialogAnswer(starterName)
			return talkToNpcOnCell(22, 103)
		end
	end
end

function onDialogMessage(message)
	if stringContains(message, "Smell") then
		doneQuest = true
	elseif stringContains(message, "boys") then
		talkedToMom = true
	end
end

function onBattleAction()
	wasInBattle = true
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