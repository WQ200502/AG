/*

	Filename: 	SunriseClient_system_shopBoxCameraRotate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_display","_xCoord","_yCoord"];

if (isNull ShopBoxVehicle) exitWith {};

if (life_rbm) then {
	if (_xCoord > 0.25) then {
		if (ShopBoxAngle < 360) then {
			ShopBoxAngle = ShopBoxAngle + ShopBoxAngleStep;
		} else {ShopBoxAngle = 0};
		ShopBoxCameraCord = ShopBoxVehicle getPos [ShopBoxRadius,ShopBoxAngle];
		ShopBoxCameraCord set [2, ShopBoxAltitude];
		ShopBoxCamera camPreparePos ShopBoxCameraCord;
		ShopBoxCamera camCommitPrepared ShopBoxSpeed;
	};
	if (_xCoord < -0.25) then {
		if (ShopBoxAngle > 0) then {
			ShopBoxAngle = ShopBoxAngle - ShopBoxAngleStep;
		} else {ShopBoxAngle = 360};
		ShopBoxCameraCord = ShopBoxVehicle getPos [ShopBoxRadius,ShopBoxAngle];
		ShopBoxCameraCord set [2, ShopBoxAltitude];
		ShopBoxCamera camPreparePos ShopBoxCameraCord;
		ShopBoxCamera camCommitPrepared ShopBoxSpeed;
	};
	if (_yCoord > 0.3) then {
		if (ShopBoxAltitude < 307) then {
			ShopBoxAltitude = ShopBoxAltitude + ShopBoxAltitudeStep;
			ShopBoxCameraCord set [2, ShopBoxAltitude];
			ShopBoxCamera camPreparePos ShopBoxCameraCord;
			ShopBoxCamera camCommitPrepared ShopBoxSpeed;
		};
	};
	if (_yCoord < -0.3) then {
		if (ShopBoxAltitude > 301) then {
			ShopBoxAltitude = ShopBoxAltitude - ShopBoxAltitudeStep;
			ShopBoxCameraCord set [2, ShopBoxAltitude];
			ShopBoxCamera camPreparePos ShopBoxCameraCord;
			ShopBoxCamera camCommitPrepared ShopBoxSpeed;
		};
	};
};