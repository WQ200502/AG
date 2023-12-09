/*
	
	Filename: 	SunriseClient_system_vehicleServiceColorKeyDown.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _slider_r = CONTROL(8400,8404);
private _slider_g = CONTROL(8400,8405);
private _slider_b = CONTROL(8400,8406);

private _text_r = (parseNumber ctrlText CONTROL(8400,8407));
if (_text_r < 0 OR _text_r > 255) exitWith {};
private _text_g = (parseNumber ctrlText CONTROL(8400,8408));
if (_text_g < 0 OR _text_g > 255) exitWith {};
private _text_b = (parseNumber ctrlText CONTROL(8400,8409));
if (_text_b < 0 OR _text_b > 255) exitWith {};

_text_r = (linearConversion [0,255,_text_r,0,1]);
_text_g = (linearConversion [0,255,_text_g,0,1]);
_text_b = (linearConversion [0,255,_text_b,0,1]);

_slider_r sliderSetPosition _text_r;
_slider_g sliderSetPosition _text_g;
_slider_b sliderSetPosition _text_b;

ShopBoxVehicle setObjectTexture [0,format["#(rgb,8,8,3)color(%1,%2,%3,1,co)",_text_r,_text_g,_text_b]];