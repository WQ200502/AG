/*

	Filename: 	SunriseClient_hud_theme.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
switch (life_gui_theme) do {
	case "black" : {
		life_gui_theme_color = [0,0,0,1];
		life_gui_theme_r = "\sunrise_gui\data\gui_r_black.paa";
		life_gui_folder = "black";
	};
	case "white_solid" : {
		life_gui_theme_color = [1,1,1,1];
		life_gui_theme_r = "\sunrise_gui\data\gui_r_white_solid.paa";
		life_gui_folder = "white";
	};
	case "white_red" : {
		life_gui_theme_color = [1,1,1,1];
		life_gui_theme_r = "\sunrise_gui\data\gui_r_red_fool.paa";
		life_gui_folder = "white";
	};
	default {
		life_gui_theme_color = [1,1,1,1];
		life_gui_theme_r = "\sunrise_gui\data\gui_r_white.paa";
		life_gui_folder = "white";
	};
};