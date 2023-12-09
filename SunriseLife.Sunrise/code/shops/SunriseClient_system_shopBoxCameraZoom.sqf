/*

	Filename: 	SunriseClient_system_shopBoxCameraZoom.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_display","_scroll"];

if (isNull ShopBoxVehicle) exitWith {};

if (life_rbm) then {
	if (_scroll > 0) then {
		ShopBoxRadius = ShopBoxRadius - ShopBoxRadStep;
		if (ShopBoxRadius < 1) then {ShopBoxRadius = 1};
		ShopBoxCameraCord = ShopBoxVehicle getPos [ShopBoxRadius,ShopBoxAngle];
		ShopBoxCameraCord set [2, ShopBoxAltitude];
		ShopBoxCamera camPreparePos ShopBoxCameraCord;
		ShopBoxCamera camCommitPrepared ShopBoxSpeed;
	};
	if (_scroll < 0) then {
		ShopBoxRadius = ShopBoxRadius + ShopBoxRadStep;
		if (ShopBoxRadius > ShopBoxRadiusMax) then {ShopBoxRadius = ShopBoxRadiusMax};
		ShopBoxCameraCord = ShopBoxVehicle getPos [ShopBoxRadius,ShopBoxAngle];
		ShopBoxCameraCord set [2, ShopBoxAltitude];
		ShopBoxCamera camPreparePos ShopBoxCameraCord;
		ShopBoxCamera camCommitPrepared ShopBoxSpeed;
	};
};