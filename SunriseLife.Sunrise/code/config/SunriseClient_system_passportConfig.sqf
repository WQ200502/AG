/*

	Filename: 	SunriseClient_system_passportConfig.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _side = switch(true) do {
	case (life_copDuty): {"cop"};
	case (life_medDuty): {"med"};
	default {"civ"};
};

if (!isClass (missionConfigFile >> "LifeCfgPassports" >> life_myPassportID)) exitWith {
	life_myPassportID = format ["%1default",_side];
};

private _passportSide = M_CONFIG(getText,"LifeCfgPassports",life_myPassportID,"side");
if !(EQUAL(_passportSide,_side)) exitWith {
	life_myPassportID = format ["%1default",_side];
};

private _conditions = M_CONFIG(getText,"LifeCfgPassports",life_myPassportID,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	life_myPassportID = format ["%1default",_side];	
};