/*

	Filename: 	SunriseClient_spawn_pointselected.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
disableSerialization;
params [
    ["_control",controlNull,[controlNull]],
    ["_selection",0,[0]]
];
if (_selection isEqualTo life_spawn_lastSel) exitWith {};
life_spawn_lastSel = _selection;
_spCfg = [] call SunriseClient_spawn_PointCfg;
_sp = _spCfg select _selection;
[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call SunriseClient_spawn_SetMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];