/*

	Filename: 	SunriseClient_system_getCombatVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 5902),-1)) exitWith {};
private _cfgClass = CONTROL_DATA(5902);

if (!isClass (missionConfigFile >> "LifeCfgBattleVehicles" >> _cfgClass)) exitWith {};

private _conditions = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	["error","",format["%1",M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"conditionsMessage")]] call SunriseClient_message;
};

private _className = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"vehicleClass");
private _vehicleInfo = [_className] call SunriseClient_system_fetchVehInfo;
private _action = [
	format["Вы действительно хотите достать %1?",_vehicleInfo select 3],
	"Боевая техника",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call SunriseClient_gui_guiMessage;
if (!isNil "_action" && {!_action}) exitWith {};

private _nearVehicles = nearestObjects[getMarkerPos life_combatVehMarker,["LandVehicle","Air","Ship"],10];
if !(_nearVehicles isEqualTo []) exitWith {["error","","Место занято!"] call SunriseClient_message};

private _maximum = M_CONFIG(getNumber,"LifeCfgBattleVehicles",_cfgClass,"maximum");
[player,_cfgClass,life_combatVehMarker,_maximum] remoteExec ["SunriseServer_system_combatVehicleReq",RSERV];
["info","","Отправлен запрос..."] call SunriseClient_message;
closeDialog 0;