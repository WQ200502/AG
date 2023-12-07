/*
	Filename: 	fn_hcExec.sqf
	Project: 	YDZY Life!
	Author:		SAYREX
*/

if (EQUAL(_func,"")) exitWith {"hcExec - function is empty" call fn_log};

if (EQUAL(_tag,"")) exitWith {"hcExec - tag is empty" call fn_log};

private ["_function","_target"];
switch (true) do { 
	case (life_HC_isActive) : {
		_function = format ["ExtremoHeadless_system_%1",_func];
		_target = HC_Life;
	}; 
	default {
		_function = format ["%1_fnc_%2",_tag,_func];
		_target = RSERV;
	}; 
};

if (isNil "_function" OR isNil "_target") exitWith {"hcExec - function is nil OR target isNil" call fn_log};

if (_call) then {
	_vars remoteExecCall [_function,_target];
	diag_log format ["EXEC CALL: %1 - %2 - %3",_function,_target,_vars];	
} else {
	_vars remoteExec [_function,_target];
	//diag_log format ["EXEC: %1 - %2 - %3",_function,_target,_vars];	
};