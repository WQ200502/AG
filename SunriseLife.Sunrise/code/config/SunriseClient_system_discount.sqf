/*

	Filename: 	SunriseClient_system_discount.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _price = param [0,0,[0]];

switch (FETCH_CONST(life_donator)) do {
	case 1: {round(_price * 0.95)}; //5%
	case 2: {round(_price * 0.90)}; //10% etc
	case 3: {round(_price * 0.80)};
	case 4: {round(_price * 0.70)};
	default {_price};
};