/*

	Filename: 	SunriseClient_hazard_takeQuest.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["error","",format["Вы заняты"]] call SunriseClient_message};

private _action = [
	format["Мне нужно, чтобы ты собрал для меня три артефакта! Наградой не обижу! "],
	"Коллекционер артефактов. Возьмешься за такое легкое задание?",
	"Согласиться",
	"Отказаться"
] call SunriseClient_gui_guiMessage;

if (_action) then {[] spawn SunriseClient_hazard_spawnArtifacts};