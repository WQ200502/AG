/*

	Filename: 	SunriseClient_markers_menuShow.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
waitUntil {visibleMap};
showChat false;
private ["_title","_checkbox","_state","_markersArray"];
{
	_title = CONTROL(12,getNumber(_x >> "titleID"));
	_checkbox = CONTROL(12,getNumber(_x >> "checkboxID"));

	_markersArray = getText(_x >> "markersArray");
	if (LIFE_MARKERWORLD(getArray,worldName,_markersArray) isEqualTo []) then {
		_title ctrlShow false;
		_checkbox ctrlShow false;
	} else {
		_title ctrlSetText (getText(_x >> "titleTXT"));
		_checkbox cbSetChecked (GVAR_PRNS [format["%1",configName _x],true]);
		if (life_mapFirstTimeOpen) then {
			_state = parseNumber (cbChecked _checkbox);
			[_checkbox,_state] call SunriseClient_markers_changeAlpha;
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgMapCheckBoxes"));

waitUntil {uiSleep 0.3; !visibleMap};
//showChat true;