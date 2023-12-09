/*

	Filename: 	SunriseClient_gather_Take.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_action_gathering) exitWith {["error","Добыча","Вы заняты добычей"] call SunriseClient_message};
if (life_action_inUse) exitWith {["error","Добыча","Вы заняты"] call SunriseClient_message};
private _item = param [0,objNull,[objNull]];
private _gather = param [1,"",[""]];
if (isNull _item) exitWith {};
if (EQUAL(_gather,"")) exitWith {};

private _curValue = _item GVAR ["resourceValue",0];
if (_curValue <= 0) exitWith {deleteVehicle _item};

if (time - (_item GVAR ["resourceTime",0]) > 60) exitWith {["error","Добыча","У объекта закончился срок годности"] call SunriseClient_message; deleteVehicle _item};

_diff = [_gather,_curValue,life_carryWeight,life_maxWeight] call SunriseClient_system_calWeightDiff;
if (EQUAL(_diff,0)) exitWith {["error","Добыча","Ваш инвентарь переполнен."] call SunriseClient_message};  

call SunriseClient_actions_inUse;
if ([true,_gather,_diff] call SunriseClient_system_handleInv) then {	
	["done","Добыча",format[localize "STR_NOTF_Gather_Success",ITEM_NAME(_gather),_diff]] call SunriseClient_message;
	_item SVAR ["resourceValue",(_curValue - _diff)];
	if (_curValue - _diff <= 0) then {deleteVehicle _item};
	player playAction "PutDown";
} else {
	[localize "STR_NOTF_InvFull","error"] call SunriseClient_gui_bottomNotification;
	["error","Добыча",format[localize "STR_NOTF_InvFull"]] call SunriseClient_message;
};
life_action_inUse = false;