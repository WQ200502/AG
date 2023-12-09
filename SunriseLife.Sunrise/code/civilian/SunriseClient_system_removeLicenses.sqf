/*

	Filename: 	SunriseClient_system_removeLicenses.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _state = param [0,-1,[0]];
if (EQUAL(_state,-1)) exitWith {};

switch (_state) do {
	//Death while being wanted
	case 0: {
		if (LIFE_SETTINGS(getNumber,"life_removeLicByJail") isEqualTo 1 AND !life_copDuty AND !life_medDuty) then {
			life_licenses = life_licenses - (LIFE_SETTINGS(getArray,"life_removeLicByJailList"));
		};
	};

	//Remove motor vehicle licenses
	case 1: {
		if (LIFE_SETTINGS(getNumber,"life_removeLicByVeh") isEqualTo 1) then {
			life_licenses = life_licenses - (LIFE_SETTINGS(getArray,"life_removeLicByVehList"));
		};
	};
};