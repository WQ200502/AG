/*

	Filename: 	SunriseClient_warzones_openBox.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"]};

private _box = param [0,objNull,[objNull]];
if (!isNil {_box GVAR "takedBy"}) exitWith {titleText["Уже кем-то открывается","PLAIN"]};
[_box,"takedBy",player] call CBA_fnc_setVarNet;

titleText["Открываем... Ждите...","PLAIN"];
uiSleep (random 3);

if !((_box GVAR ["takedBy",objNull]) isEqualTo player) exitWith {"WarZoneOpenBox - dupe?" call SunriseClient_system_log};
if (_box GVAR ["priceTaked",false]) exitWith {"WarZoneOpenBox - Price Already Taked" call SunriseClient_system_log};

private _gangPoints = grpPlayer GVAR ["gang_warpoints",0];
[grpPlayer,"gang_warpoints",(_gangPoints + 1)] call CBA_fnc_setVarNet;

["priceTaked",grpPlayer GVAR "gang_name"] remoteExecCall ["SunriseClient_warzones_message",-2];

[_box,player,grpPlayer] remoteExecCall ["SunriseServer_system_updateGangWarPoints",RSERV];