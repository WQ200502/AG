/*
	
	Filename: 	SunriseClient_system_vehicleShopColorKeyDown.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _slider_r = CONTROL(2300,2311);
private _slider_g = CONTROL(2300,2312);
private _slider_b = CONTROL(2300,2313);

private _text_r = (parseNumber ctrlText CONTROL(2300,2314));
if (_text_r < 0 OR _text_r > 255) exitWith {};
private _text_g = (parseNumber ctrlText CONTROL(2300,2315));
if (_text_g < 0 OR _text_g > 255) exitWith {};
private _text_b = (parseNumber ctrlText CONTROL(2300,2316));
if (_text_b < 0 OR _text_b > 255) exitWith {};

_text_r = (linearConversion [0,255,_text_r,0,1]);
_text_g = (linearConversion [0,255,_text_g,0,1]);
_text_b = (linearConversion [0,255,_text_b,0,1]);

_slider_r sliderSetPosition _text_r;
_slider_g sliderSetPosition _text_g;
_slider_b sliderSetPosition _text_b;

ShopBoxVehicle setObjectTexture [0,format["#(rgb,8,8,3)color(%1,%2,%3,1,co)",_text_r,_text_g,_text_b]];