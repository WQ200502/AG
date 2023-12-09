/*
	
	Filename: 	SunriseClient_system_animSync.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[Objnull]],
	["_anim","",[""]],
	["_isSwitchMove",true,[true]],
	["_isPlayMove",true,[true]],
	["_isPlayMoveNowNow",false,[false]],
	["_isPlayActionNow",false,[false]]
];

if(isNull _unit) exitWith {};

if(_isSwitchMove) then {_unit switchMove _anim};
if(_isPlayMove) then {_unit playMove _anim};
if(_isPlayMoveNowNow) then {_unit playMoveNow _anim};
if(_isPlayActionNow) then {_unit playActionNow _anim};
