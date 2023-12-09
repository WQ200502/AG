/*

	Filename: 	SunriseClient_evh_onPlayerKilled.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_killer",ObjNull,[ObjNull]]
];

if !(EQUAL(_unit,_killer)) exitWith {};

if ((vehicle _unit) != _unit) then {
	unassignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};
if (((life_copDuty && (count units life_copGroup) > LIFE_SETTINGS(getNumber,"life_cop_min")) OR !(life_copDuty OR life_medDuty)) AND !life_is_arrested) then {
	if ([_unit,"players_spawn_zone"] call CBA_fnc_getDistance < 700) exitWith {};
	if (!(life_copDuty OR life_medDuty) && [_unit,LIFE_SETTINGS(getText,"life_death_exception")] call CBA_fnc_getDistance < 1600) exitWith {};
	private _markerID = format ["%1_%2",steamid,round(random 9999)];
	life_death_markers pushBack [_markerID,getPos _unit];
	[getPlayerUID player,"life_death_markers",[life_death_markers, serverTime + 1200]] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
};
["all"] call SunriseClient_removeBuff;
[] call SunriseClient_hud_hide;
[] call SunriseClient_effects_Terminate;

cutText["","BLACK OUT",0];
1 fadeSound 0;
playMusic "DeathMusic";

[_unit,"medicStatus"] call SunriseClient_system_clearGlobalVar;
[_unit,"lifeState","DEAD"] call CBA_fnc_setVarNet;

life_medicstatus = -1;
life_medicstatusby = "";

disableSerialization;
if (!isNull (findDisplay 49)) then {(findDisplay 49) closeDisplay 0} else {closeDialog 0};

["Death_Screen_V2"] call SunriseClient_gui_DestroyRscLayer;
[_unit] spawn SunriseClient_system_respawnScreen;
