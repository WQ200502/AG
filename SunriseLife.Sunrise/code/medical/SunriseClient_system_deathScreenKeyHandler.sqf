/*

	Filename: 	SunriseClient_system_deathScreenKeyHandler.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
if !(LSINCAP(player)) exitWith {false};

private _handled = false;
private _medicReqKey = (actionKeys "ShowMap") select 0;
private _deathKey = 19; //R
private _resKey = 35; //H

switch (true) do {
	case (EQUAL(_code,_medicReqKey)): {
		_handled = true;
		[player] call SunriseClient_system_requestMedic;
	};
	case (EQUAL(_code,_deathKey)): {
		_handled = true;
		if (life_deathScreen_canRespawn) then {
			[player] call SunriseClient_dmg_dieInAgony;
		};
	};
	case (EQUAL(_code,_resKey)): {
		if (call life_isAdmin) then {
			_handled = true;
			[player] spawn SunriseClient_system_revived;
		};
	};
};

_handled