/*

	Filename: 	SunriseClient_hazard_fromZone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

if (life_action_inUse) exitWith {["error","",format["Вы заняты"]] call SunriseClient_message};
params ["_object", "_caller", "_actionId", "_arguments"];
if (_object isEqualTo hazard_kater) exitWith {
	private _price = LIFE_SETTINGS(getNumber,"life_hazard_boat");
	private _action = [
		format["Для того чтобы уплыть на катере вам нужно заплатить $%1 наличными владельцу",[_price] call SunriseClient_system_numberText],
		"Возврат домой",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call SunriseClient_gui_guiMessage;

	if (CASH < _price) exitWith {["error","",format["У вас нет $%1 наличными для того чтобы уплыть!",[_price] call SunriseClient_system_numberText]] call SunriseClient_message};
	["cash","take",_price] call SunriseClient_system_myCash;

	if (_action) then {
		call SunriseClient_actions_inUse;
		titleText ["Плывем обратно...","BLACK",1];
		uisleep 2;
		player setPos (getPos hazard_toZone);
		uisleep 1;
		titleText ["","BLACK IN"];
		life_action_inUse = false;
	};
};

private _action = [
	format["Вы действительно хотите переместиться обратно?"],
	"Возврат домой",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call SunriseClient_gui_guiMessage;

if (_action) then {
	call SunriseClient_actions_inUse;
	["info","",format["Ожидайте прибытия проводника..."]] call SunriseClient_message;
	sleep random [5,10,15];
	titleText ["Едем обратно...","BLACK",1];
	uisleep 2;
	player setPos (getPos hazard_toZone);
	uisleep 1;
	titleText ["","BLACK IN"];
	life_action_inUse = false;
};