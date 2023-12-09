/*

	Filename: 	SunriseClient_system_onVehicleEngine.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _vehicle = _this select 0;
if (!(_vehicle in life_vehicles) AND isEngineOn _vehicle AND (driver _vehicle) isEqualTo player) exitWith {
	_vehicle engineOn false;
	if (time - life_hint_timer > 3) then {
		["У вас нет ключей от машины чтобы завести ее!", "error"] call SunriseClient_gui_BottomNotification;
		life_hint_timer = time;
	};
};