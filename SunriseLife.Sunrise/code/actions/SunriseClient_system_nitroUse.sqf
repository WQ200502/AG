/*
	
	Filename: 	SunriseClient_system_nitroUse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (NOTINVEH(player)) exitWith {["error","",format[localize "STR_NOTF_NotInVeh"]] call SunriseClient_message};
private _vehicle = objectParent player;
private _adacNitroUsed = _vehicle GVAR ["adacNitroUsed",-1];
if (EQUAL(_adacNitroUsed,-1)) exitWith {["error","",format[localize "STR_NOTF_VehNitroError"]] call SunriseClient_message};
if (_adacNitroUsed > 0 && {(time - _adacNitroUsed) < 300}) exitWith {["error","",format[localize "STR_NOTF_VehNitroCD"],true] call SunriseClient_message};
if ((speed _vehicle) <= 20) exitWith {["error","",format[localize "STR_NOTF_VehNitroSpeed"],true] call SunriseClient_message};
if (fuel _vehicle < 0.5) exitWith {["error","",format[localize "STR_NOTF_VehNitroFuel"],true] call SunriseClient_message};

[_vehicle,"adacNitroUsed",time] call CBA_fnc_setVarNet;

titleText[localize "STR_NOTF_VehNitroUsed","PLAIN"];
player say3D "action_nitro";

private _vel = velocity _vehicle;  
private _dir = direction _vehicle;  
private _speed = 40;
_vehicle setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)];

if (!local _vehicle) then {	
	[_vehicle,(fuel _vehicle) - 0.3] remoteExecCall ["SunriseClient_system_setFuel",_vehicle];
} else {
	_vehicle setFuel ((fuel _vehicle) - 0.3);
};