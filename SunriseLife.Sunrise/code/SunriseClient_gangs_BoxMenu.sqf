/*
	
	Filename: 	SunriseClient_gangs_BoxMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _box = param [0,objNull,[objNull]];
if (isNull _box) exitWith {};
if (dialog) exitWith {};
life_gang_box = _box;
if (isNull life_gang_box OR (typeOf life_gang_box != LIFE_SETTINGS(getText,"life_trunkClass"))) exitWith {}; //Either a null or invalid vehicle type.
if (life_action_inUse OR life_is_processing) exitWith {["Вы чем-то заняты","error"] call SunriseClient_gui_bottomNotification};
if (life_gang_box GVAR ["locked",false]) exitWith {hint "Заперто"};
if ([life_gang_box] call SunriseClient_system_isTrunkInUse) exitWith {[localize "STR_MISC_VehInvUse","error"] call SunriseClient_gui_bottomNotification};
//////////////////////////////
private _connected = call SunriseClient_system_checkConnection;
if !(_connected) exitWith {["Кажется вы потеряли соединение с сервером.","error"] call SunriseClient_gui_bottomNotification};
//////////////////////////////
private _house_box_slots = life_gang_box GVAR ["slots",1];

if !(createDialog "SunriseDialogGangContainer") exitWith {[localize "STR_MISC_DialogError","error"] call SunriseClient_gui_bottomNotification;}; //Couldn't create the menu?

[life_gang_box,"trunk_inUseBy",steamid] call CBA_fnc_setVarNet;
player say3D "house_cont";

private _title = CONTROL(4800,4801);
private _filters = CONTROL(4800,4807);

_title ctrlSetText "Хранилище банды";

_filters lbAdd "Все снаряжение";
_filters lbAdd "Амуниция";
_filters lbAdd "Оружие";
_filters lbAdd "Боеприпасы";
_filters lbAdd "Обвес";
_filters lbAdd "Предметы";

_filters lbSetCurSel 0;

life_veh_trunk_sync = +((life_gang_box GVAR ["inventory",[[],0]]) select 0);

[{!(_this GVAR ["trunk_inUseBy",""] isEqualTo steamid) OR (isNull (findDisplay 4800))}, {
	if !(_this GVAR ["trunk_inUseBy",""] isEqualTo steamid) exitWith {
		[_this,"trunk_inUseBy"] call SunriseClient_system_clearGlobalVar;
		["Инвентарь уже используется другим игроком","error"] call SunriseClient_gui_bottomNotification;
		(findDisplay 4800) closeDisplay 0;
	};
	if (isNull (findDisplay 4800)) exitWith {
		[_this,"trunk_inUseBy"] call SunriseClient_system_clearGlobalVar;
		private _data = (_this GVAR ["inventory",[[],0]]) select 0;
		if !(EQUAL(life_veh_trunk_sync,_data)) then {
			life_veh_trunk_sync = [];
			[_this,player] remoteExecCall ["SunriseServer_system_updateGangTrunks",2];
			[] call SunriseClient_system_saveGear;
		};
	};
},life_gang_box] call CBA_fnc_waitUntilAndExecute;