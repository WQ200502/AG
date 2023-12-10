/*

	Filename:   SunriseServer_system_wantedKnockedByCop.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
if !(params [
	["_cop",objNull,[objNull]]
]) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptName,_this]] call SunriseServer_system_customLog;};


[{["CrimeKilled"] remoteExec ["SunriseClient_experience_addExp",_this]}, _cop, random [120,240,120]] call CBA_fnc_waitAndExecute;