/*

	Filename: 	SunriseClient_adac_Setup.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


	Формат [["boxes",3],["nitro"]]

*/
#include "..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]],
	["_mode","",[""]],
	["_config","",[""]]
];

if (!isClass (missionConfigFile >> "LifeCfgAdac" >> typeof _vehicle)) exitWith {hint "Для этой техники нет настроек"};

private _trunk = _vehicle GVAR ["Trunk",[[],0]];

if (EQUAL(_mode,"boxes") && (M_CONFIG(getNumber,"LifeCfgAdac",typeOf _vehicle,"boxes") isEqualTo 0)) exitWith {hint localize "STR_ADAC_VehBoxDisable"};
if (EQUAL(_mode,"nitro") && (M_CONFIG(getNumber,"LifeCfgAdac",typeOf _vehicle,"nitro") isEqualTo 0)) exitWith {hint localize "STR_ADAC_VehNitroDisable"};
if !(EQUAL((_trunk select 0),[])) exitWith {hint localize "STR_ADAC_VehTrunkNotEmpty"};

private _doUpgrade = false;

switch (_mode) do {
	case "boxes": {
		switch (_config) do {
			case "add": {
				private _currentBoxes = _vehicle GVAR ["adacBoxes",0];
				if ((_currentBoxes + 1) > M_CONFIG(getNumber,"LifeCfgAdac",typeOf _vehicle,"boxes")) exitWith {hint localize "STR_ADAC_VehBoxMaxed"};
				if !(["srl_adacBox"] call SunriseClient_system_removeItem) exitWith {hint localize "STR_ADAC_VehItemNeed"};
				_vehicle SVAR ["adacBoxes",_currentBoxes + 1,true];
				[localize "STR_ADAC_VehBoxDone", "done"] call SunriseClient_gui_BottomNotification;
				_doUpgrade = true;
			};
			case "del": {
				private _currentBoxes = _vehicle GVAR ["adacBoxes",0];
				if (EQUAL(_currentBoxes,0)) exitWith {hint localize "STR_ADAC_VehNoBox"};
				if (_currentBoxes <= 1) then {					
					[_vehicle,"adacBoxes"] call SunriseClient_system_clearGlobalVar;
				} else {
					_vehicle SVAR ["adacBoxes",_currentBoxes - 1,true];
				};
				[localize "STR_ADAC_VehBoxRemoved", "done"] call SunriseClient_gui_BottomNotification;
				_doUpgrade = true;
			};
		};
	};

	case "nitro": {
		switch (_config) do {
			case "add": {
				if (!isNil {_vehicle GVAR "adacNitroUsed"}) exitWith {hint localize "STR_ADAC_VehNitroAlready"};
				if !(["srl_adacNitro"] call SunriseClient_system_removeItem) exitWith {hint localize "STR_ADAC_VehItemNeed"};
				_vehicle SVAR ["adacNitroUsed",0,true];
				[localize "STR_ADAC_VehNitroDone", "done"] call SunriseClient_gui_BottomNotification;
				_doUpgrade = true;
			};
			case "del": {
				if (isNil {_vehicle GVAR "adacNitroUsed"}) exitWith {hint localize "STR_ADAC_VehNitroAlready"};				
				[_vehicle,"adacNitroUsed"] call SunriseClient_system_clearGlobalVar;
				[localize "STR_ADAC_VehNitroRemoved", "done"] call SunriseClient_gui_BottomNotification;
				_doUpgrade = true;
			};
		};
	};
};

if (_doUpgrade) then {	
	[_vehicle,"Trunk"] call SunriseClient_system_clearGlobalVar;
	private _currentConfig = [_vehicle GVAR ["adacBoxes",0],!(isNil {_vehicle GVAR "adacNitroUsed"})];
	[_vehicle,_currentConfig] call SunriseClient_adac_InitUpgrades;
	[_vehicle,_currentConfig] remoteExecCall ["SunriseServer_system_vehicleAdacUpdate",RSERV];
	[_vehicle] spawn SunriseClient_adac_Menu;
};