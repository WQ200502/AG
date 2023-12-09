/*

	Filename: 	SunriseClient_processing_action_all.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isNull (findDisplay 5000)) exitWith {hint "нет окна переработки"};
disableSerialization;


private _mats = life_process_info select 0;
private _totaled = ITEM_VALUE((_mats # 0) # 0);
private _notAllMats = false;
{	
	if (ITEM_VALUE(_x select 0) < ((_x select 1) * _totaled)) exitWith {
		hint format ["Ошибка. У вас недостаточное количество %1 (нужно %2 или более)",ITEM_NAME(_x select 0),(_x select 1)*_totaled];
		_notAllMats = true;
	};
} forEach _mats;
if (_notAllMats) exitWith {};

private _progress = CONTROL(5000,5006);
private _pgText = CONTROL(5000,5007);
private _processButton = CONTROL(5000,5005);
private _processButtonAll = CONTROL(5000,5008);
private _processEditBox = CONTROL(5000,5004);
private _newItem = life_process_info select 1;
private _cP = 0;

private _time = switch (FETCH_CONST(life_donator)) do {
    case 0: {0.40};
    case 1: {0.35};
    case 2: {0.30};
    case 3: {0.25};
    case 4: {0.20};
};

player say3D "process";
life_is_processing = true;	
_processButton ctrlEnable false;
_processButtonAll ctrlEnable false;
_processEditBox ctrlEnable false;

while {true} do {
	_cP = _cP + 0.01;	
	_pgText ctrlSetText format["%1%2",round(_cP * 100),"%"];
	_progress progressSetPosition _cP;	
	if (_cP >= 1 OR (call SunriseClient_system_isInterrupted) OR (isNull (findDisplay 5000))) exitWith {};
	player playActionNow "FT_Act_Craft_Thing";
	uiSleep _time;
};
_processButtonAll ctrlEnable true;
_processButton ctrlEnable true;
_processEditBox ctrlEnable true;
life_is_processing = false;

_pgText ctrlSetText "";
_progress progressSetPosition 0;

if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};

player PlayActionNow "FT_Act_Gesture_Reset";

if (isNull (findDisplay 5000)) exitWith {[localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

private _itemRemoved = true;
{
	if !([false,_x select 0,(_x select 1)*_totaled] call SunriseClient_system_handleInv) exitWith {_itemRemoved = false};
} forEach _mats;

if !(_itemRemoved) exitWith {hint "Недостаточно исходных ингридиентов"};
if !([true,_newItem,_totaled] call SunriseClient_system_handleInv) exitWith {
	{
		[true,_x select 0,(_x select 1)*_totaled] call SunriseClient_system_handleInv;
	} forEach _mats;
	hint "Недостаточно свободного места в инвентаре";
};

["done","Переработка",format[localize "STR_Process_Processed",ITEM_NAME(_newItem)]] call SunriseClient_message;
[life_process_info] call SunriseClient_processing_update;