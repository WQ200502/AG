/*

	Filename: 	SunriseClient_system_vehicleOwners.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _data = param [0,[],[[]]];
private _return = "";
{
	_return = _return + format["%1<br/>",_x select 1];
} foreach _data;
_return;