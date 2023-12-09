/*
	
	Filename: 	SunriseClient_pouch_pouchMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_pouch = param [0,[],[[]]];
disableSerialization;
if (life_action_inUse OR life_is_processing) exitWith {["Вы чем-то заняты","error"] call SunriseClient_gui_bottomNotification};

if !(createDialog "SunriseDialogPouch") exitWith {[localize "STR_MISC_DialogError","error"] call SunriseClient_gui_bottomNotification;}; //Couldn't create the menu?

call SunriseClient_system_pouchContainerCheck;

player say3D "house_cont";

private _title = CONTROL(4100,4101);
private _houseEdit = CONTROL(4100,4105);
private _playerEdit = CONTROL(4100,4106);
private _filters = CONTROL(4100,4107);

_title ctrlSetText "Защищенный контейнер";

_filters lbAdd "Все снаряжение";
_filters lbAdd "Амуниция";
_filters lbAdd "Оружие";
_filters lbAdd "Боеприпасы";
_filters lbAdd "Обвес";
_filters lbAdd "Предметы";

_filters lbSetCurSel 0;

life_pouch_sync = +life_pouch;
[{isNull (findDisplay 4100)},{		
	if !(life_pouch_sync isEqualTo life_pouch) then {
		life_pouch_sync = [];
		[life_pouch,player] remoteExecCall ["SunriseServer_pouch_updatePouch",2];
		[] call SunriseClient_system_saveGear;
	};
}] call CBA_fnc_waitUntilAndExecute;
