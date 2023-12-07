#include "..\..\script_macros.hpp"
if (isServer) exitWith {};
disableSerialization;

2 cutRsc ["AL_Hud","PLAIN"];
[] call ANZUS_fnc_hudUpdate;

[] spawn
{
	private["_dam"];
	while {true} do
	{
		_dam = damage player;
		waitUntil {(damage player) != _dam};
		[] call ANZUS_fnc_hudUpdate;
	};
};

_version = MAIN_SETTINGS_TYPE(getNumber,"Branch","serverVersion");

private _display = uiNamespace getVariable ["AL_Hud",displayNull];
private _versionText = _display displayCtrl 1252;
_versionText ctrlSetText format ["v%1",_version];
