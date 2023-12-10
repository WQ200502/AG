/*

	Filename: 	SunriseServer_system_recupKeyForHC.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params[
	["_uid","",[""]],
	["_side",sideUnknown,[civilian]]
];
if (_uid isEqualTo "") exitWith {}; //NULL
_keyArr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
[_keyArr] remoteExecCall ["HC_fnc_receivekeyofServer",HC_Life];
