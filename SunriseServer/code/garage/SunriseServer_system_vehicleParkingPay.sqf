/*

	Filename: 	SunriseServer_system_vehicleParkingPay.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
	["_vid","",[0]],
	["_unit",ObjNull,[ObjNull]]
];

format ["vehicleParkingPay:%1",_vid] call SunriseServer_database_fireAndForget;
["Вы заплатили за эвакуацию техники, заберите ее на штрафстоянке","done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];