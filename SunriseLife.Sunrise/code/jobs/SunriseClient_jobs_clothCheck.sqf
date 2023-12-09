/*

	Filename: 	SunriseClient_jobs_clothCheck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
switch (_this) do { 
	case "eco_ws" : {EQUAL(PUNIFORM,"U_C_Scientist") && EQUAL(PHEADGEAR,"H_mas_rus_woolhat_ht_w")}; 
	case "eco_gs" : {EQUAL(PUNIFORM,"U_C_Scientist") && EQUAL(PHEADGEAR,"H_mas_rus_woolhat_ht_w")}; 
	case "dhl" : {EQUAL(PUNIFORM,"sunrise_dhl_Employee") && EQUAL(PHEADGEAR,"sunrise_dhl_Cap") && EQUAL(CURWEAPON,"")}; 
	case "eln" : {EQUAL(PUNIFORM,"U_C_Poor_1") && EQUAL(PHEADGEAR,"H_Booniehat_tan")}; 
	case "bus" : {EQUAL(PUNIFORM,"U_Marshal") && EQUAL(PHEADGEAR,"H_StrawHat_dark")}; 
	default {true}; 
};