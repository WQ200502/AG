/*

	Filename: 	SunriseClient_gangs_Invite.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_name","",[""]],
	["_group",grpNull,[grpNull]],
	["_leader",ObjNull,[ObjNull]]
];

if (EQUAL(_name,"") OR isNull _group) exitWith {}; //Fail horn anyone?
if (!isNil {grpPlayer getVariable "gang_name"}) exitWith {hint "Вы уже в группировке"};

private _gangName = _group getVariable "gang_name";
private _action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	switch (_group) do { 
		case life_copGroup: {			
			life_coplevel = 1;
			[getPlayerUID player,"life_coplevel",life_coplevel] remoteExecCall ["SunriseServer_database_updatePartial",2];
		}; 
		case life_medGroup: {
			life_medlevel = 1;
			[getPlayerUID player,"life_medlevel",life_medlevel] remoteExecCall ["SunriseServer_database_updatePartial",2];
		}; 
		default {		
			[player] join _group;
			[[6,_group,steamid],"updateGang"] call SunriseClient_system_hcExec;
		};
	};
	["Вы приняли приглашение","done"] call SunriseClient_gui_bottomNotification;
	[format["%1 принял ваше приглашение",GVAR_RNAME(player)],"done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_leader];
	[] remoteExec ["SunriseClient_gangs_Menu",_leader];
} else {
	["Вы отменили приглашение","done"] call SunriseClient_gui_bottomNotification;
	[format["%1 отказался от приглашения",GVAR_RNAME(player)],"error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_leader];
};