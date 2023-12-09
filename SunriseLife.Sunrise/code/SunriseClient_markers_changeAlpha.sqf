/*

	Filename: 	SunriseClient_markers_changeAlpha.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_checkBox","_state"];

private _checkBoxName = ctrlClassName _checkBox;
if (!isClass (missionConfigFile >> "LifeCfgMapCheckBoxes" >> _checkBoxName)) exitWith {};

private _markersClass = M_CONFIG(getText,"LifeCfgMapCheckBoxes",_checkBoxName,"markersArray");
{
	_x setMarkerAlphaLocal _state;
} forEach LIFE_MARKERWORLD(getArray,worldName,_markersClass);


SVAR_PRNS [format["%1",_checkBoxName],(cbChecked _checkBox)];