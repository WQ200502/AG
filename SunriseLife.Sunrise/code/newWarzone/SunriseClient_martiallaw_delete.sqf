/*

	Filename: 	SunriseClient_martiallaw_delete.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (server_warzones isEqualTo []) exitWith {};

private _text = "";
{
	if ((_x select 0) isEqualTo marker_countLocal) then {
		_text = _x select 2;
	};
} forEach server_warzones;
if (_text isEqualTo "") exitWith {};

[marker_countLocal,player,_text] remoteExecCall ["SunriseServer_system_removeWarPoint",RSERV];

[false] call SunriseClient_martiallaw_mapControl;