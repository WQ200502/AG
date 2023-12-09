/*

	Filename: 	SunriseClient_system_medicStatus.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
params [
	["_medic",objNull,[objNull]],
	["_mode",0,[0]]
];
life_medicstatusby = GVAR_RNAME(_medic);
life_medicstatus = _mode;

[player,"medicStatus",life_medicstatus] call CBA_fnc_setVarNet;
[] remoteExecCall ["SunriseClient_system_medicMenu",_medic];

/*

Принято = 1

Перестрелка 2
Военное положение 3
 
Отказ = 0
Красная зона 4
Черный список 5
Розыск 6

*/