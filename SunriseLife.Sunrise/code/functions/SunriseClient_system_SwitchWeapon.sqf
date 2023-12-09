#include "..\..\script_macros.hpp"
/*

    Filename: 	SunriseClient_system_SwitchWeapon.sqf
	Project: 	AmazingLife - RPG
	Author:		AmazingTeam
	E-mail:		dev@amazingrp.ru
	Web:		http://amazingrp.ru/

*/

_switchNumber = param [0,100,[0]];
[] call SunriseClient_system_switchWeaponhandler;
life_curWep_h = currentWeapon player;
player action ["SwitchWeapon", player, player, _switchNumber];
player switchCamera cameraView;
[] call SunriseClient_fast_hudWeaponUpdate;
[] call SunriseClient_evh_click_check;
