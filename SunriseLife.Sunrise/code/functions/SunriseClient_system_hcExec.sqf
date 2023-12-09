/*

	Filename: 	SunriseClient_system_hcExec.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_vars",[],[[]]],
	["_func","",[""]],
	["_tag","SYS",[""]],
	["_call",true,[false]]
];

if (EQUAL(_func,"")) exitWith {"hcExec - function is empty" call SunriseClient_system_log};

_tag = switch (_tag) do { 
	case "SYS" : {"system"}; 
	case "DB" : {"database"}; 
	default {""}; 
};

if (EQUAL(_tag,"")) exitWith {"hcExec - tag is empty" call SunriseClient_system_log};

private _target = [RSERV,HC_Life] select life_HC_isActive;
private _function = format ["SunriseServer_%1_%2",_tag,_func];

if (_call) then {
	_vars remoteExecCall [_function,_target];
	diag_log format ["EXEC CALL: %1 - %2 - %3",_function,_target,_vars];	
} else {
	_vars remoteExec [_function,_target];
	diag_log format ["EXEC: %1 - %2 - %3",_function,_target,_vars];	
};