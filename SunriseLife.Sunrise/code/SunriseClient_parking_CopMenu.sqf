/*

	Filename: 	SunriseClient_parking_CopMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _veh = param [0,ObjNull,[ObjNull]];
if (isNull _veh) exitWith {};
if !([_veh] call SunriseClient_system_isVehicleKind) exitWith {};
if (!alive _veh) exitWith {};

disableSerialization;
if (!isNull (findDisplay 37400)) then {closeDialog 0};
createDialog "SunriseDialogParkingCop";
waitUntil {!isNull (findDisplay 5500)};

private _title = CONTROL(5500,5501);
_title ctrlSetText format[localize "STR_PARKING_Title",(getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName"))];

private _maximum = CONTROL(5500,5504);
_maximum ctrlSetText format["Максимум: $%1",[M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _veh,"price")*0.5] call SunriseClient_system_numberText];

life_vInact_curTarget = _veh;