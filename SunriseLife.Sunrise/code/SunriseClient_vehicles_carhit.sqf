/*
	
	Filename: 	SunriseClient_vehicles_carhit.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_source",Objnull,[Objnull]]
];

if (isNull _unit OR isNull _source) exitWith {};
if (life_hit_by_car) exitWith {};

if (!isNull life_DraggedBody) then {[] call SunriseClient_system_dropDeadBody};

private _driverName = getPlayerUID (driver _source);
private _message = format [localize "STR_NOTF_CarHit",_driverName];

if (!life_hit_by_car && LSALIVE(player)) then {
	life_hit_by_car = true;
	titleText [_message,"PLAIN"];
	//systemchat _message;
	["info","",format ["%1",_message],true] call SunriseClient_message;
	uiSleep 3;
	life_hit_by_car = false;
};