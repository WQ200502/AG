/*

	Filename: 	SunriseClient_system_plateColor.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _plate = param [0,"",[""]];
private _plateArray = _plate splitString "";
private _ret = format ["<t color='#FFD700'>%1%2</t><t color='#ff6600'>%3%4%5</t><t color='#FFD700'>%6%7</t>",_plateArray select 0, _plateArray select 1, _plateArray select 2, _plateArray select 3, _plateArray select 4, _plateArray select 5,_plateArray select 6,_plateArray select 7];
_ret;