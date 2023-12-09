/*

	Filename: 	SunriseClient_dlv_varToStr.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _var = param [0,"",[""]];
if (EQUAL(_var,"")) exitWith {""};

switch (_var) do {
	case "depo_kavala": {"Кавала"};
	case "depo_alps": {"Ореокастро"};
	case "depo_north": {"Мази"};
	case "depo_east": {"Молос"};
};