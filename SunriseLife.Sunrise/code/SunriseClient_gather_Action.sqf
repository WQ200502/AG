/*

	Filename: 	SunriseClient_gather_Action.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _gather = [] call SunriseClient_gather_checkZone;
if (EQUAL(_gather,"")) exitWith {[] spawn SunriseClient_archeology_checkDistance};

private _weaponNeed = M_CONFIG(getText,"LifeCfgGather",_gather,"tool");
if !(EQUAL(CURWEAPON,_weaponNeed)) exitWith {hint "Для добычи этого ресурса нужен специальный инструмент"};

private _val = M_CONFIG(getNumber,"LifeCfgGather",_gather,"amount");
private _itemModel = M_CONFIG(getText,"LifeCfgGather",_gather,"model");

private _conditions = M_CONFIG(getText,"LifeCfgGather",_gather,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	//hint format ["%1",M_CONFIG(getText,"LifeCfgGather",_gather,"conditionsMessage")];
	["error","",format["%1",M_CONFIG(getText,"LifeCfgGather",_gather,"conditionsMessage")]] call SunriseClient_message;
};

private _animationSleep = switch (_weaponNeed) do {
	case ("sunrise_Tool_PickAxe") : {6.7};
	case ("sunrise_Tool_Hoe") : {6.7};
	case ("sunrise_Tool_Shovel") : {8};
	default {0};
};

life_action_gathering = true;
uiSleep _animationSleep;
life_action_gathering = false;

if ((call SunriseClient_system_isInterrupted) OR !(NOTINVEH(player))) exitWith {titleText["Добыча прервана","PLAIN"]};

if (FETCH_CONST(life_donator) > 0) then {ADD(_val,1)};
[_gather,_itemModel,_val] spawn SunriseClient_gather_Spawn;