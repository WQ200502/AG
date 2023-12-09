/*

	Filename: 	SunriseClient_system_sellSlave.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (life_copDuty OR life_medDuty) exitWith {};
if (!server_slavery && (count units life_copGroup < LIFE_SETTINGS(getNumber,"life_cop_min_illegal"))) exitWith {hint format[localize "STR_Civ_NotEnoughCops",LIFE_SETTINGS(getNumber,"life_cop_min_illegal")]};
private _rate = if (server_slavery) then {25000} else {10000};

private _units = nearestObjects[getMarkerPos "slavery_market",["Man"],10];
_units = _units - [player];

private "_unit";
if (count _units isEqualTo 0) exitWith {hint "Ты один..."};
	
{
	if (GVAR_RESTRAINED(_x) && !(_x getVariable ["copDuty",false] OR _x getVariable ["medDuty",false]) && (isPlayer _x) && (LSALIVE(_x))) exitWith {_unit = _x};
	if (!isNil "_unit") exitWith {};
} foreach _units;

if (isNil "_unit") exitWith {}; //Not valid
if (!isPlayer _unit) exitWith {};
if !(GVAR_RESTRAINED(_unit)) exitWith {};
if (GVAR_RNAME(_unit) isEqualTo "") exitWith {};
if (EQUAL(player,_unit)) exitWith {};
if (_unit getVariable ["copDuty",false] OR _unit getVariable ["medDuty",false]) exitWith {hint localize "STR_NOTF_OnlyCivSlave"};
private _check = false;

if (!server_slavery) then {
	{
		if (player distance _x < 200 && (_x getVariable ["copDuty",false])) exitWith {_check = true;};
	} forEach playableUnits;
};
if (_check) exitWith {hint localize "STR_NOTF_CopsAreNear"};

if !(server_slavery) then {
	[[steamid,GVAR_RNAME(player),"236"],"wantedAdd"] call SunriseClient_system_hcExec;
};

call SunriseClient_actions_inUse;
hint localize "STR_NOTF_SellSlaveInProgress";
[player,_rate] remoteExecCall ["SunriseClient_system_sellSlaveAction",_unit];