/*
	
	Filename: 	SunriseClient_system_vehicleShopColorSliderPosChanged.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _slider_r = sliderPosition CONTROL(8400,8404);
private _slider_g = sliderPosition CONTROL(8400,8405);
private _slider_b = sliderPosition CONTROL(8400,8406);

private _text_r = CONTROL(8400,8407);
private _text_g = CONTROL(8400,8408);
private _text_b = CONTROL(8400,8409);

_text_r ctrlSetText str(linearConversion [0,1,_slider_r,0,255]);
_text_g ctrlSetText str(linearConversion [0,1,_slider_g,0,255]);
_text_b ctrlSetText str(linearConversion [0,1,_slider_b,0,255]);

ShopBoxVehicle setObjectTexture [0,format["#(rgb,8,8,3)color(%1,%2,%3,1,co)",_slider_r,_slider_g,_slider_b]];