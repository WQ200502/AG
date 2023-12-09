/*
	
	Filename: 	SunriseClient_system_pulloutAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _veh = param [0,objNull,[objNull]];
if (player distance _veh > ((boundingBox _veh select 1) select 0) + 2) exitWith {["error","",format[localize "STR_NOTF_TooFarFromTarget"]] call SunriseClient_message;
};
private _crew = crew _veh;
if (_crew isEqualTo []) exitWith {["error","","В машине никого нет"] call SunriseClient_message};
	
[player] remoteExecCall ["SunriseClient_system_pulloutVeh",_crew];