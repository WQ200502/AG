#include "..\..\script_macros.hpp"
/*

    Filename: 	SunriseClient_system_SwitchWeaponHandler.sqf
	Project: 	AmazingLife - RPG
	Author:		AmazingTeam
	E-mail:		dev@amazingrp.ru
	Web:		http://amazingrp.ru/

*/
if (isNull (missionNamespace getVariable ["life_weaponSwitchHandler",objNull])) then {
	life_weaponSwitchHandler = [] spawn {
		life_switchWeapon_handler = true;
		uiSleep 4;
		life_switchWeapon_handler = false;
	};
} else {
	terminate life_weaponSwitchHandler;
	life_weaponSwitchHandler = [] spawn {
		life_switchWeapon_handler = true;
		uiSleep 4;
		life_switchWeapon_handler = false;
	};
};