/*
	
	Filename: 	SunriseClient_system_vehicleShopColorSliderPosChanged.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		

*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _slider_r = sliderPosition CONTROL(2300,2311);
private _slider_g = sliderPosition CONTROL(2300,2312);
private _slider_b = sliderPosition CONTROL(2300,2313);

private _text_r = CONTROL(2300,2314);
private _text_g = CONTROL(2300,2315);
private _text_b = CONTROL(2300,2316);

_text_r ctrlSetText str(linearConversion [0,1,_slider_r,0,255]);
_text_g ctrlSetText str(linearConversion [0,1,_slider_g,0,255]);
_text_b ctrlSetText str(linearConversion [0,1,_slider_b,0,255]);

ShopBoxVehicle setObjectTexture [0,format["#(rgb,8,8,3)color(%1,%2,%3,1,co)",_slider_r,_slider_g,_slider_b]];