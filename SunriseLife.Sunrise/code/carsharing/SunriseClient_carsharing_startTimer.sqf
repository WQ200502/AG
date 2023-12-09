/*

	Filename:	SunriseClient_carsharing_startTimer.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _timer = ["carsharing"] call SunriseClient_system_createTimer;

private _markerName = format["%1_cs",getPlayerUID player];
private _marker = createMarkerLocal [_markerName, getPos life_cs_vehicle];
_marker setMarkerColorLocal "ColorOrange";
_marker setMarkerTypeLocal "c_car";
_marker setMarkerTextLocal "Арендуемый автомобиль";
private _price = LIFE_SETTINGS(getNumber,"life_cs_price");

[{
	params ["_args","_handle"];
	_args#0 ctrlSetText format ["Время аренды: %1",[(time - life_cs_start),"HH:MM"] call BIS_fnc_secondsToString];
	_args#1 setMarkerPosLocal getPos life_cs_vehicle;
	
	_cost = if (objectParent player isEqualTo life_cs_vehicle) then {_args select 2} else {(_args select 2) / 2}; 

	if (_cost > BANK) exitWith {["error","","У вас закончились деньги на банковском счете, аренда завершена"] call SunriseClient_message;[_handle] call CBA_fnc_removePerFrameHandler;[] call SunriseClient_carsharing_stop};
	if (!(alive life_cs_vehicle) OR isNull life_cs_vehicle) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;[] call SunriseClient_carsharing_stop};
	
	["atm","take",_cost] call SunriseClient_system_myCash;
	["info","",format["С вас списано $%1 за аренду машины", _cost]] call SunriseClient_message;
},60,[_timer,_marker,_price]] call CBA_fnc_addPerFrameHandler;