/*

	Filename: 	SunriseClient_system_timeDiscount.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

switch (FETCH_CONST(life_donator)) do {
	case 1: {round(_this * 0.9)};
	case 2: {round(_this * 0.8)};
	case 3: {round(_this * 0.7)};
	case 4: {round(_this * 0.6)};
	default {_this};
};