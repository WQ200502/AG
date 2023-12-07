/*

	Filename: 	fn_clearGlobalVar.sqf
	Project: 	YDZY Life!
	Author:		SAYREX
	VKontakte:	http://vk.com/zbk_life

*/
if (isNull _object) exitWith {};
if (EQUAL(_var,"")) exitWith {};

if (!isNil {_object GVAR _var}) then {
	_object SVAR [_var,nil,true];
	format["ClearGlobalVar - %1 isNil",_var] call fn_tazesound4;
};