/*

	Filename: 	SunriseClient_adac_Rematerial.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isNull adac_vehicleToUpgrade) exitWith {};
if (EQUAL((lbCurSel 3713),-1)) exitWith {hint localize "STR_ADAC_NoColorSelect"};
private _material = CONTROL_DATA(3713);

if !(isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _material)) exitWith {};

if !(EQUAL(_material,"")) then {	
	[adac_vehicleToUpgrade,_material] call SunriseClient_system_materialVehicle;
	[adac_vehicleToUpgrade,_material] remoteExecCall ["SunriseServer_system_vehicleAdacRematerial",RSERV];
	[localize "STR_ADAC_VehColorDone", "done"] call SunriseClient_gui_BottomNotification;
} else {
	["Материал пуст", "error"] call SunriseClient_gui_BottomNotification;
};