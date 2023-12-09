/*

	Filename: 	SunriseClient_system_increase.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

switch (FETCH_CONST(life_donator)) do {
	case 1: {round(_this * 1.05)};
	case 2: {round(_this * 1.07)};
	case 3: {round(_this * 1.10)};
	case 4: {round(_this * 1.15)};
	default {_this};
};