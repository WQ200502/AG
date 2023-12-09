/*

	Filename: 	SunriseClient_system_getDeathAnimation.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
private _animationState = animationState _unit;

if (EQUAL(_animationState,"ainjpfalmstpsnonwnondf_carried_dead")) exitWith {"Unconscious"};
if (EQUAL(_animationState,"actspknlmstpsnonwnondnon_treatinginjured_nikitindead")) exitWith {"Unconscious"};
if (EQUAL(typeof (vehicle _unit),"ExtremoHospitalBed")) exitWith {"hospitalbed_anim"};

_unit call CBA_fnc_getUnitDeathAnim