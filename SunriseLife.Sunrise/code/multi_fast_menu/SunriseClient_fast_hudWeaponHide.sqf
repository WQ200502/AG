#include "..\..\script_macros.hpp"
/*

	Filename: 	fn_hudWeaponHide.sqf
	Project: 	AmazingLife - RPG
	Author:		AmazingTeam
	E-mail:		dev@amazingrp.ru
	Web:		http://amazingrp.ru/

*/
if (life_is_arrested) exitWith {};

private _mode = [_this,0,false,[false]] call BIS_fnc_param;

disableSerialization;
private _ui = GVAR_UINS ["playerHUD",displayNull];
if (isNull _ui) exitWith {};

private _getControl = {
	params ["_key"];
	private _ctrl = controlNull;
	private _index = ((_ui getVariable "map") find _key) + 10000;
	if (_index != -1) then {
		_ctrl = _ui displayCtrl _index;
	};
	_ctrl;
};

for "_i" from 0 to 8 do {
	_ctrl = ("main_area_button_group_" + str _i) call _getControl;
	if (_mode) then {
		_ctrl ctrlSetFade 0;
	} else {
		_ctrl ctrlSetFade 1;
	};
	_ctrl ctrlCommit 0.3;
};
