/*

	Filename: 	SunriseClient_effects_Sick.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
LIFE_HANDLE_SICK = [{
	if !(life_sickness) exitWith {[_this#1] call CBA_fnc_removePerFrameHandler;LIFE_HANDLE_SICK = -1};
	player say3D (selectRandom ["sick_cough_0", "sick_cough_1", "sick_cough_2"]);
	player setFatigue 1;
	addcamShake [15,5,8];
	//systemChat "Вы болеете и чувствуете слабость во всем теле...";
	
	["info","",format ["Вы болеете и чувствуете слабость во всем теле..."],true] call SunriseClient_message;	
},30] call CBA_fnc_addPerFrameHandler;