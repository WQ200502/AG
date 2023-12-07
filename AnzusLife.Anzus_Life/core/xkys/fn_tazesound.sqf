/*
	
	Filename: 	fn_animSync.sqf
	Project: 	YDZY Life!
	Author:		SAYREX

*/

if (isNull _unit) exitWith {};

if (_isSwitchMove) then {_unit switchMove _anim};
if (_isPlayMove) then {_unit playMove _anim};