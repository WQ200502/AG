/*

    Filename:   SunriseClient_martiallaw_listWarPoints.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team



#include "..\script_macros.hpp"
disableSerialization;
createDialog "SunriseDialogManageWarPoint";
waitUntil {!isNull (findDisplay 4500)};

private _list = CONTROL(4500,4502);
private _BtnRemove = CONTROL(4500,4503);
lbClear _list;

if (EQUAL(server_warzones,[])) exitWith {
	_list lbAdd "Пусто";
	_BtnRemove ctrlEnable false;
};

{
	if !(EQUAL((_x select 4),"BattleGround")) then {
		_list lbAdd format["Зона: %1 [X: %2 - Y: %3] от %4",_x select 1,_x select 2,_x select 3,_x select 4];
		_list lbSetValue [(lbSize _list)-1,_x select 0];
		_list lbSetData [(lbSize _list)-1,_x select 1];
	};
} forEach server_warzones;*/

if (!alive player ) exitWith {}; //Prevent them from opening this for exploits while dead.

disableSerialization;

if (!createDialog "playerSettingsWZ") exitWith {hint "Не удалось открыть меню установки ВП";};
_display = findDisplay 9701;
if (isNull _display) exitWith {};
ctrlShow [4002, false];
