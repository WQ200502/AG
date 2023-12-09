/*

	Filename: 	SunriseClient_gangs_Init.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private["_group"];

//systemChat "Инициализация группы...";
["info","",format ["Инициализация группы..."],true] call SunriseClient_message;
if (EQUAL(life_gangData,[])) exitWith {
	//systemChat "У вас нет группы";
	["info","",format ["У вас нет группы"],true] call SunriseClient_message;
	[false] call SunriseClient_gangs_ClearLicense;
};
switch (true) do { 
	case life_copDuty: {
		[player] join life_copGroup;
		player setVariable ["copDuty",true,true];
		[player,"copLevel",life_coplevel] call CBA_fnc_setVarNet;
		_group = life_copGroup;
	}; 
	case life_medDuty: {
		[player] join life_medGroup;
		player setVariable ["medDuty",true,true];
		[player,"medrank",life_medlevel] call CBA_fnc_setVarNet;
		_group = life_medGroup;
	}; 
	default {
		{
			_groupName = _x GVAR "gang_name";
			if (!isNil "_groupName") then {
				_groupOwner = _x GVAR["gang_owner",""];
				_groupID = _x GVAR "gang_id";
				if (EQUAL(_groupOwner,"") OR isNil "_groupID") exitWith {};
				if (EQUAL((life_gangData select 0),_groupID) && (EQUAL((life_gangData select 1),_groupOwner))) exitWith {_group = _x};
			};
		} foreach allGroups;
		
		if (!isNil "_group") then {
			[player] join _group;
		} else {
			[player] join (createGroup civilian);
			_group = grpPlayer;
			_group SVAR ["gang_id",(life_gangData select 0),true];
			_group SVAR ["gang_owner",(life_gangData select 1),true];
			if !(EQUAL((life_gangData select 2),"-1")) then {[_group,"gang_deputy",life_gangData select 2] call CBA_fnc_setVarNet};
			_group SVAR ["gang_name",(life_gangData select 3),true];
			_group SVAR ["gang_membersCount",(life_gangData select 4),true];
			_group SVAR ["gang_maxMembers",(life_gangData select 5),true];
			_group SVAR ["gang_bank",(life_gangData select 6),true];
			if !(EQUAL((life_gangData select 7),[])) then {[_group,"gang_info",life_gangData select 7] call CBA_fnc_setVarNet};
			if !(EQUAL((life_gangData select 8),"-1")) then {
				[_group,"gang_license",life_gangData select 8] call CBA_fnc_setVarNet;
				if !(EQUAL((life_gangData select 9),0)) then {[_group,"gang_warpoints",life_gangData select 9] call CBA_fnc_setVarNet};
			} else {
				[false] call SunriseClient_gangs_ClearLicense;
			};
		};
	}; 
};
if ((_group getVariable ["gang_owner",""]) isEqualTo (getPlayerUID player) AND !(leader _group isEqualTo player)) then {
	[player,_group] remoteExecCall ["SunriseClient_gangs_NewLeaderClient",_group];
};
//systemChat format ["Инициализация группы завершена. Вы состоите в группе %1",_group GVAR ["gang_name",""]];

["info","",format ["Инициализация группы завершена. Вы состоите в группе %1",_group GVAR ["gang_name",""],true]] call SunriseClient_message;