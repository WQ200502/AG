/*

	Filename: 	SunriseClient_hazard_toZone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (CASH < _price) exitWith {["error","",format["У вас нет $%1 необходимых для покупки талона!",[_price] call SunriseClient_system_numberText]] call SunriseClient_message};
if (life_action_inUse) exitWith {["error","",format["Вы заняты"]] call SunriseClient_message};

private _action = [
	format["Для выживания в зоне вам нужна защитная одежда! Вы действительно хотите переместиться в аномальную зону?"],
	"Зараженная зона",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call SunriseClient_gui_guiMessage;

if (_action) then {
	call SunriseClient_actions_inUse;
	["info","",format["Ожидайте прибытия проводника..."]] call SunriseClient_message;	
	sleep random [5,10,15];
	private _points = getArray(missionConfigFile >> "LifeCfgHazard" >> "spawn_points");
	titleText ["Едем в аномальную зону...","BLACK",1];
	life_hazard_guided = true;
	uisleep 2;
	player setPos selectRandom _points;
	uisleep 1;
	titleText ["","BLACK IN"];
	life_action_inUse = false;
};