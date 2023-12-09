/*

	Filename: 	SunriseClient_experience_clientSendUpdateToServer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
scriptName "fn_clientSendUpdateToServer";
#define __filename "fn_clientSendUpdateToServer.sqf"

params [
	["_which", -1, [0]],
	["_action", "", [""]]
];

if (_which isEqualTo -1) exitWith {};

private _toSend = switch (_which) do {
	case 0: {[life_currentExpLevel,life_currentExp,life_currentPerkPoints,_action]};
	case 1: {[life_currentPerkPoints,life_currentExpPerks]};
};

[[_which, _toSend, getPlayerUID player],"updateExp"] call SunriseClient_system_hcExec;