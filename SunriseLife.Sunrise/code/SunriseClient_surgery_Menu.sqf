/*
	
	Filename: 	SunriseClient_surgery_Menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (server_restartSoon) exitWith {hint "Надвигается буря..."};

disableSerialization;
createDialog "SunriseDialogSurgery";
waitUntil {!isNull (findDisplay 5400)};

call SunriseClient_surgery_BoxCreate;

_list = CONTROL(5400,5402);
lbClear _list;

{
	if (isNumber (configfile >> "CfgFaces" >> "Man_A3" >> (configName _x) >> "disabled")) then {
		if (EQUAL((getNumber (_x >> "disabled")),0)) then {
			if (configName _x in ["Leona_Face","",""] AND life_isGirl) then {
				_list lbAdd format["%1",getText (_x >> "displayname")];
				_list lbSetData [(lbSize _list)-1,configName _x];
				_list lbSetTextRight [(lbSize _list)-1, format["  $%1", [50000] call SunriseClient_system_numberText]];
			};
		};
	};
} forEach ("true" configClasses (configfile >> "CfgFaces" >> "Man_A3"));

[{isNull (findDisplay 5400)}, {call SunriseClient_surgery_BoxDestroy}] call CBA_fnc_waitUntilAndExecute;