/*

	Filename: 	SunriseClient_system_onVehicleFire.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _vehicle = _this select 0;
private _curTime = _vehicle GVAR ["donatVehLastFire",0];
if (time - _curTime > 60) then {
	_vehicle SVAR ["donatVehLastFire",time,true];	
};