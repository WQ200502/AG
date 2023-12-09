/*

	Filename: 	SunriseClient_animation_kneelWork.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (!(ISANIMSTATE("ainvpknlmstpsnonwnondnon_medic_1")) && NOTINVEH(player)) then {
	["ainvpknlmstpsnonwnondnon_medic_1"] call SunriseClient_system_animDo;
};