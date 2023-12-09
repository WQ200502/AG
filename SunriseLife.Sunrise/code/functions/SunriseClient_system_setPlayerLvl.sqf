/*

	Filename: 	SunriseClient_system_setPlayerLvl.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_leader",ObjNull,[ObjNull]],
	["_mode",0,[0]]
];
private _error = false;
private _msg = "";

switch (_mode) do {
	case 0: {
		switch (true) do {
			case (life_copDuty): {
				if (EQUAL(life_coplevel,1)) then {
					_error = true;
					_msg = "Уровень не может быть меньше 1";
				} else {
					life_coplevel = life_coplevel - 1;
					player SVAR ["copLevel",life_coplevel,true];
					_msg = format["Уровень %1 понижен до %2",GVAR_RNAME(player),life_coplevel];
				};
			};
			case (life_medDuty): {
				if (EQUAL(life_medlevel,1)) then {
					_error = true;
					_msg = "Уровень не может быть меньше 1";
				} else {
					life_medlevel = life_medlevel - 1;
					player SVAR ["medrank",life_medlevel,true];
					_msg = format["Уровень %1 понижен до %2",GVAR_RNAME(player),life_medlevel];
				};
			};
			default {
				if (EQUAL(life_civlevel,1)) then {
					_error = true;
					_msg = "Уровень не может быть меньше 1";
				} else {
					life_civlevel = life_civlevel - 1;
					player SVAR ["lvl",life_civlevel,true];
					_msg = format["Уровень %1 понижен до %2",GVAR_RNAME(player),life_civlevel];
				};
			};
		};
	};

	case 1: {
		switch (true) do {
			case (life_copDuty): {
				if (life_coplevel > 18) then {
					_error = true;
					_msg = "Уровень не может быть выше 19";
				} else {
					life_coplevel = life_coplevel + 1;
					player SVAR["copLevel",life_coplevel,true];
					_msg = format["Уровень %1 повышен до %2",GVAR_RNAME(player),life_coplevel];
				};
			};
			case (life_medDuty): {
				if (life_medlevel > 4) then {
					_error = true;
					_msg = "Уровень не может быть выше 5";
				} else {
					life_medlevel = life_medlevel + 1;
					player SVAR["medrank",life_medlevel,true];
					_msg = format["Уровень %1 повышен до %2",GVAR_RNAME(player),life_medlevel];
				};
			};
			default {
				if (life_civlevel > 4) then {
					_error = true;
					_msg = "Уровень не может быть выше 5 (Старшие офицеры назначаются через администрацию Макс. 4 человека)";
				} else {
					life_civlevel = life_civlevel + 1;
					player SVAR ["lvl",life_civlevel,true];
					_msg = format["Уровень %1 повышен до %2",GVAR_RNAME(player),life_civlevel];
				};
			};
		};
	};
};

if !(_error) then {
	switch (true) do {
		case (life_copDuty): {[getPlayerUID player,"life_coplevel",life_coplevel] remoteExecCall ["SunriseServer_database_updatePartial",2]};
		case (life_medDuty): {[getPlayerUID player,"life_medlevel",life_medlevel] remoteExecCall ["SunriseServer_database_updatePartial",2]};
		default {[getPlayerUID player,"life_civlevel",life_civlevel] remoteExecCall ["SunriseServer_database_updatePartial",2]};
	};
	[] call SunriseClient_system_setTag;
};

[1,_msg] remoteExecCall ["SunriseClient_system_broadcast",_leader];
[] remoteExec ["SunriseClient_gangs_Menu",_leader];