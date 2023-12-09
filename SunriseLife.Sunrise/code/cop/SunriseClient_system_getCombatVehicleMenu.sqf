/*

	Filename: 	SunriseClient_system_getCombatVehicleMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5900)) then {
	createDialog "SunriseDialogBattleVeh";
	waitUntil {!isNull (findDisplay 5900)};
};

private _control = CONTROL(5900,5902);
lbClear _control;

life_combatVehMarker = _this select 3;

private "_vehicleInfo";
{
	_vehicleInfo = [getText(_x >> "vehicleClass")] call SunriseClient_system_fetchVehInfo;
	if !(EQUAL(_vehicleInfo,[])) then {
		_control lbAdd format["%1",getText(_x >> "displayName")];
		_control lbSetData [(lbSize _control)-1,configName _x];
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgBattleVehicles"));