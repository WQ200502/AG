/*

	Filename: 	SunriseClient_system_vehSetupRadio.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (EQUAL(_vehicle,objNull)) exitWith {};

[_vehicle,"tf_hasRadio",true] call CBA_fnc_setVarNet;
switch (true) do {
	case (life_copDuty): {
		[_vehicle,"tf_side",west] call CBA_fnc_setVarNet;
		[_vehicle,"TF_RadioType","tf_rt1523g"] call CBA_fnc_setVarNet;
		[_vehicle,"tf_range",60000] call CBA_fnc_setVarNet;
	};
	case (life_medDuty): {
		[_vehicle,"tf_side",east] call CBA_fnc_setVarNet;
		[_vehicle,"TF_RadioType","tf_mr3000"] call CBA_fnc_setVarNet;
		[_vehicle,"tf_range",60000] call CBA_fnc_setVarNet;
	};
	default {
		[_vehicle,"tf_side",independent] call CBA_fnc_setVarNet;
		[_vehicle,"TF_RadioType","tf_anprc155"] call CBA_fnc_setVarNet;
		[_vehicle,"tf_range",30000] call CBA_fnc_setVarNet;
	};
};