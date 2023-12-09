/*

	Filename: 	SunriseClient_vehicles_destroyAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\script_macros.hpp"
private _veh = param [0,ObjNull,[ObjNull]];
if (isNull _veh OR !(life_copDuty)) exitWith {};
if (player distance _veh > ((boundingBox _veh select 1) select 0) + 2) exitWith {hint localize "STR_NOTF_TooFarFromTarget"};

for "_i" from 1 to 10 do {
	titleText[format[localize "STR_NOTF_VehDestroyIn", (11 - _i)],"PLAIN"];
	uiSleep 1;
	if !(alive _veh) exitWith {};	
};

titleText["","PLAIN"];

if (alive _veh) then {	
	[_veh,"isInsured"] call SunriseClient_system_clearGlobalVar;
	private _vehicleData = _veh GVAR ["vehicle_info_owners",[]];
	private _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");	
	[0,"STR_NOTF_BeingDestroyed",true,[(_vehicleData select 0) select 1,_vehicleName,GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
	_veh setDamage 1;
};