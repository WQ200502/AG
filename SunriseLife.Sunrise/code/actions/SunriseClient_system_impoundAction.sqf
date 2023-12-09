/*
	
	Filename: 	SunriseClient_system_impoundAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,ObjNull,[ObjNull]];
if !([_vehicle] call SunriseClient_system_isVehicleKind) exitWith {};
if (player distance _vehicle > 10) exitWith {};
if (!alive _vehicle) exitWith {["error","",format[localize "STR_NOTF_VehNotAlive"]] call SunriseClient_message};

private _vehicleData = _vehicle GVAR ["vehicle_info_owners",[]];
if (EQUAL(_vehicleData,[])) exitWith {deleteVehicle _vehicle}; //Bad vehicle.

private _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");	
[1,"STR_NOTF_BeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];

private _time = 30;
if (IS_VIP) then {_time = _time call SunriseClient_system_timeDiscount};
[localize "STR_NOTF_Impounding",_time,{(player distance _vehicle > 10)}] call SunriseClient_system_progressBarSimple;
if (call SunriseClient_system_isInterrupted) exitWith {["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};
if (player distance _vehicle > 10) exitWith {["error","",format[localize "STR_NOTF_ImpoundingCancelled"]] call SunriseClient_message};

if (EQUAL((crew _vehicle),[]) OR ((typeOf _vehicle) in ["B_UAV_02_F","B_UGV_01_F","I_UGV_01_F"])) then {	
	private _type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	private _price = switch (true) do {
		case (_vehicle isKindOf "LandVehicle"): {LIFE_SETTINGS(getNumber,"life_impound_car")};
		case (_vehicle isKindOf "Ship"): {LIFE_SETTINGS(getNumber,"life_impound_boat")};
		case (_vehicle isKindOf "Air"): {LIFE_SETTINGS(getNumber,"life_impound_air")};
	};
	
	life_impound_inuse = true;

	[[_vehicle,true,player],"vehicleStore","SYS",false] call SunriseClient_system_hcExec;

	waitUntil {uiSleep 0.03; !life_impound_inuse};
	if (life_copDuty) then {
		_price = _price call SunriseClient_system_increase;
	};

	["done","",format[localize "STR_NOTF_Impounded",_type,_price]] call SunriseClient_message;
	[0,"STR_NOTF_HasImpounded",true,[GVAR_RNAME(player),(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
	["atm","add",_price,"impound"] call SunriseClient_system_myCash;		
} else {
	["error","",format[localize "STR_NOTF_ImpoundingCancelled"]] call SunriseClient_message;
};