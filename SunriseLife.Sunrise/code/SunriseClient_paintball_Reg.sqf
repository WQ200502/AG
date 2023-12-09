/*

	Filename: 	SunriseClient_paintball_Reg.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (player GVAR ["inPBfight",false]) exitWith {hint "Вы уже зарегистрированы как участник"};
private _action = [
	"Хотите принять участие в пейнтбольном состязании?",
	"Пейнтбол",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	player SVAR ["inPBfight",true,true];
	if !(cameraView in ["INTERNAL","GUNNER"])  then {
		player switchCamera "INTERNAL";		
	};
	private _PBzone = _this select 3;
	hint "Не покидайте зеленый круг, иначе вы будете считаться проигравшим";	
	["in",GVAR_RNAME(player)] remoteExecCall ["SunriseClient_paintball_Message",RCLIENT];
	[_PBzone,getPosATL player] spawn {
		while {true} do {
			if (call SunriseClient_system_isInterrupted) exitWith {				
				[player,"inPBfight"] call SunriseClient_system_clearGlobalVar;
			};
			if (player distance getMarkerPos (_this select 0) > 260 OR !(player GVAR ["inPBfight",false])) exitWith {
				[player,"inPBfight"] call SunriseClient_system_clearGlobalVar;
				if (NOTINVEH(player)) then {
					player setPosATL (_this select 1);
				};
				hint "Вы более не участник сражения";				
				["out",GVAR_RNAME(player)] remoteExecCall ["SunriseClient_paintball_Message",RCLIENT];
			};
			uiSleep 2;
		};
	};
};