/*

	Filename: 	SunriseClient_gangs_ClientKick.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(params [
	["_leader",ObjNull,[ObjNull]],
	["_group",grpNull,[grpNull]]
]) exitWith {};

if (_group GVAR ["gang_deputy","-1"] isEqualTo steamid) then {
	[_group,"gang_deputy"] call SunriseClient_system_clearGlobalVar;
	[[4,_group,steamid],"updateGang"] call SunriseClient_system_hcExec;
};

switch (true) do { 
	case life_copDuty : {		
		life_coplevel = 0;
		[player] remoteExecCall ["SunriseServer_system_copLeaveDuty",2];

		player setVariable ["copDuty",false,true];
		life_copDuty = false;
		
		[player,"copLevel",0] call CBA_fnc_setVarNet;
	}; 
	case life_medDuty : {
		life_medlevel = 0;
		[player] remoteExecCall ["SunriseServer_system_medLeaveDuty",2];

		player setVariable ["medDuty",false,true];
		life_medDuty = false;
		
		[player,"medrank",0] call CBA_fnc_setVarNet;
	}; 
	default {[[5,_group,steamid],"updateGang"] call SunriseClient_system_hcExec;}; 
};

[player] joinSilent (createGroup civilian);
[] call SunriseClient_gangs_ClearLicense;
[] remoteExec ["SunriseClient_gangs_Menu",_leader];
["Вы были исключены из банды","info"] call SunriseClient_gui_bottomNotification;