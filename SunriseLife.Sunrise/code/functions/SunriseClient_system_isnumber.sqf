/*

	Filename: 	SunriseClient_system_isnumber.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _value = _this select 0;
private _valid = ["0","1","2","3","4","5","6","7","8","9"];
private _array = _value splitString "";

(_array findIf {!(_x in _valid)}) isEqualTo -1