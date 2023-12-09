/*

	Filename: 	SunriseClient_jobs_rentTimer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !(params [
	["_vehicle",objNull,[objNull]],
	["_timer_name","",[""]]
]) exitWith {};

disableSerialization;
private _timer = [_timer_name] call SunriseClient_system_createTimer;
private _price = LIFE_SETTINGS(getNumber,"life_cs_price");
private _start_time = time;
[{
	params ["_args","_handle"];
	_args#0 ctrlSetText format ["Время аренды: %1",[(time - _args#3),"HH:MM"] call BIS_fnc_secondsToString];
	_vehicle = _args#2;
	_cost = if (objectParent player isEqualTo _vehicle) then {_args select 1} else {(_args select 1) / 2}; 

	if (_cost > BANK) exitWith {
		["У вас закончились деньги на банковском счете, аренда завершена","error"] call SunriseClient_gui_bottomNotification;
		[_handle] call CBA_fnc_removePerFrameHandler;
		[_args#4] call SunriseClient_gui_DestroyRscLayer;
		_vehicle setVelocity[0, 0, 0];
		[_vehicle] remoteExecCall ["SunriseServer_carsharing_stop",2];
	};
	if (!(alive _vehicle) OR isNull _vehicle) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;[_args#4] call SunriseClient_gui_DestroyRscLayer};
	
	["atm","take",_cost] call SunriseClient_system_myCash;
	//systemChat format["С вас списано $%1 за аренду машины", _cost];	
	
	["info","",format ["С вас списано $%1 за аренду машины",_cost]] call SunriseClient_message;
},60,[_timer,_price,_vehicle,_start_time,_timer_name]] call CBA_fnc_addPerFrameHandler;