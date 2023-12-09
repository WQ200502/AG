/*

	Filename: 	SunriseClient_spawn_Menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (life_is_arrested) exitWith {
	[] call SunriseClient_system_respawned;
};
if (life_respawned) then {
	[] call SunriseClient_system_respawned;
};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
if !(createDialog "SunriseDialogSpawnSelection") exitWith {[] call SunriseClient_spawn_Menu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","if((_this select 1) == 1) then {true}"];

private _spCfg = [] call SunriseClient_spawn_PointCfg;
private _ctrl = ((findDisplay 38500) displayCtrl 38510);
{
	_ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
	_ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
	_ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} foreach _spCfg;

private _sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call SunriseClient_spawn_SetMapPosition;
life_spawn_point = _sp;
life_spawn_lastSel = -1;

//ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];