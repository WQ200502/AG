/*

	Filename: 	SunriseClient_adac_Recolor.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isNull adac_vehicleToUpgrade) exitWith {};
if (EQUAL((lbCurSel 3709),-1)) exitWith {hint localize "STR_ADAC_NoColorSelect"};
private _color = CONTROL_DATA(3709);

if !(isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) exitWith {};

if !(EQUAL(_color,"")) then {
	[adac_vehicleToUpgrade,_color] call SunriseClient_system_colorVehicle;	
	[adac_vehicleToUpgrade,_color] remoteExecCall ["SunriseServer_system_vehicleAdacRecolor",RSERV];
	[localize "STR_ADAC_VehColorDone", "done"] call SunriseClient_gui_BottomNotification;
} else {
	["Цвет пуст", "error"] call SunriseClient_gui_BottomNotification;
};