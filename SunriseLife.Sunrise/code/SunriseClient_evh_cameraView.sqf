/*

	Filename: 	SunriseClient_evh_cameraView.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_playerUnit", "_newCameraMode"];
if (life_inwarzone OR (_playerUnit GVAR ["inPBfight",false])) then {
	if !(_newCameraMode in ["INTERNAL","GUNNER"])  then {
		_playerUnit switchCamera "INTERNAL";
		["Вы находитесь в зоне боевых действий! Вид от третьего лица недоступен!","error"] call SunriseClient_gui_bottomNotification;
	};
};