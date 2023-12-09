/*

	Filename: 	SunriseClient_system_settingsMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;

if (isNull (findDisplay 2900)) then {
	if !(createDialog "SunriseDialogSettings") exitWith {hint "Something went wrong, the menu won't open?"};
};

private _display = findDisplay 2900;

ctrlSetText[2902, format["%1", life_viewDistanceFoot]];
ctrlSetText[2912, format["%1", life_viewDistanceCar]];
ctrlSetText[2922, format["%1", life_viewDistanceAir]];

//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ (_display displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,life_viewDistanceFoot],[2911,life_viewDistanceCar],[2921,life_viewDistanceAir]];

private _tags = _display displayCtrl 2970;
private _grass = _display displayCtrl 2972;
private _hud = _display displayCtrl 2979;
private _trader = _display displayCtrl 2976;
private _fps = _display displayCtrl 2980;
private _compass = _display displayCtrl 2981;
private _wHud = _display displayCtrl 2924;
private _saveBind = _display displayCtrl 2923;

private _colorSelect = _display displayCtrl 2973;
private _passSelect = _display displayCtrl 2977;
private _titleSelect = _display displayCtrl 2978;

if (life_tagson) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "ON";
	_tags buttonSetAction "[LIFE_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; life_tagson = false; [] call SunriseClient_system_settingsMenu; [getPlayerUID player,'life_tagson',life_tagson] remoteExecCall ['SunriseServer_database_updatePlayerIndCfg',2];";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "OFF";
	_tags buttonSetAction "LIFE_ID_PlayerTags = [""LIFE_PlayerTags"",""onEachFrame"",""SunriseClient_system_playerTags""] call BIS_fnc_addStackedEventHandler; life_tagson = true; [] call SunriseClient_system_settingsMenu; [getPlayerUID player,'life_tagson',life_tagson] remoteExecCall ['SunriseServer_database_updatePlayerIndCfg',2];";
};

if (EQUAL(life_grassIndex,25)) then {
	_grass ctrlSetTextColor [0,1,0,1];
	_grass ctrlSetText "ON";
	_grass buttonSetAction "life_grassIndex = 50; setterrainGrid life_grassIndex; [] call SunriseClient_system_settingsMenu;";
} else {
	_grass ctrlSetTextColor [1,0,0,1];
	_grass ctrlSetText "OFF";
	_grass buttonSetAction "life_grassIndex = 25; setterrainGrid life_grassIndex; [] call SunriseClient_system_settingsMenu;";
};

if (life_showHUD) then {
	_hud ctrlSetTextColor [0,1,0,1];
	_hud ctrlSetText "ON";
	_hud buttonSetAction "life_showHUD = false; [] call SunriseClient_hud_hide; [] call SunriseClient_system_settingsMenu;";
} else {
	_hud ctrlSetTextColor [1,0,0,1];
	_hud ctrlSetText "OFF";
	_hud buttonSetAction "life_showHUD = true; [] call SunriseClient_hud_init; [] call SunriseClient_system_settingsMenu;";
};

if (life_showFPS) then {
	_fps ctrlSetTextColor [0,1,0,1];
	_fps ctrlSetText "ON";
	_fps buttonSetAction "life_showFPS = false; [] call SunriseClient_system_settingsMenu;";
} else {
	_fps ctrlSetTextColor [1,0,0,1];
	_fps ctrlSetText "OFF";
	_fps buttonSetAction "life_showFPS = true; [] call SunriseClient_system_settingsMenu;";
};

if (life_showWeaponHud) then {
	_wHud ctrlSetTextColor [0,1,0,1];
	_wHud ctrlSetText "ON";
	_wHud buttonSetAction "life_showWeaponHud = false; [] call SunriseClient_system_settingsMenu; [false] call SunriseClient_fast_hudWeaponHide;";
} else {
	_wHud ctrlSetTextColor [1,0,0,1];
	_wHud ctrlSetText "OFF";
	_wHud buttonSetAction "life_showWeaponHud = true; [] call SunriseClient_system_settingsMenu; [true] call SunriseClient_fast_hudWeaponHide;";
};

if (life_saveBind) then {
	_saveBind ctrlSetTextColor [0,1,0,1];
	_saveBind ctrlSetText "ON";
	_saveBind buttonSetAction "life_saveBind = false; [] call SunriseClient_system_settingsMenu;";
} else {
	_saveBind ctrlSetTextColor [1,0,0,1];
	_saveBind ctrlSetText "OFF";
	_saveBind buttonSetAction "life_saveBind = true; [] call SunriseClient_system_settingsMenu;";
};

/*if (life_showCam) then {
	_cam ctrlSetTextColor [0,1,0,1];
	_cam ctrlSetText "ON";
	_cam buttonSetAction "life_showCam = false; [] call SunriseClient_system_settingsMenu; [getPlayerUID player,'life_showCam',life_showCam] remoteExecCall ['SunriseServer_database_updatePlayerIndCfg',2];";
} else {
	_cam ctrlSetTextColor [1,0,0,1];
	_cam ctrlSetText "OFF";
	_cam buttonSetAction "life_showCam = true; [] call SunriseClient_system_settingsMenu; [getPlayerUID player,'life_showCam',life_showCam] remoteExecCall ['SunriseServer_database_updatePlayerIndCfg',2];";
};

if (life_showCompass) then {
	_compass ctrlSetTextColor [0,1,0,1];
	_compass ctrlSetText "ON";
	_compass buttonSetAction "[LIFE_ID_Compass,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; life_showCompass = false; [] call SunriseClient_system_settingsMenu; [getPlayerUID player,'life_showCompass',life_showCompass] remoteExecCall ['SunriseServer_database_updatePlayerIndCfg',2];";
} else {
	_compass ctrlSetTextColor [1,0,0,1];
	_compass ctrlSetText "OFF";
	_compass buttonSetAction "LIFE_ID_Compass = [""LIFE_Compass"",""onEachFrame"",""SunriseClient_system_compass""] call BIS_fnc_addStackedEventHandler; life_showCompass = true; [] call SunriseClient_system_settingsMenu; [getPlayerUID player,'life_showCompass',life_showCompass] remoteExecCall ['SunriseServer_database_updatePlayerIndCfg',2];";
};*/

if (GVAR_PRNS ["PRNS_simpleTrader",false]) then {
	_trader ctrlSetTextColor [0,1,0,1];
	_trader ctrlSetText "ON";
	_trader buttonSetAction "profileNamespace setVariable [""PRNS_simpleTrader"",false]; [] call SunriseClient_system_settingsMenu;";
} else {
	_trader ctrlSetTextColor [1,0,0,1];
	_trader ctrlSetText "OFF";
	_trader buttonSetAction "profileNamespace setVariable [""PRNS_simpleTrader"",true]; [] call SunriseClient_system_settingsMenu;";
};
//выбор скинов для планшета
[] call SunriseClient_system_padSkinConfig;
lbClear _colorSelect;
{
	if ([getText(_x >> "conditions")] call SunriseClient_system_conditionsCheck) then {
		_colorSelect lbAdd format["%1",getText(_x >> "title")];
		_colorSelect lbSetData [(lbSize _colorSelect)-1,configName _x];

		if (EQUAL(life_myPadSkinID,configName _x)) then {
			_colorSelect lbSetCurSel ((lbSize _colorSelect)-1);
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPadSkins"));
if (lbSize _colorSelect < 2) then {_colorSelect ctrlEnable false};
	
//выбор паспортов
[] call SunriseClient_system_passportConfig;
lbClear _passSelect;
private _side = switch(true) do {
	case (life_copDuty): {"cop"};
	case (life_medDuty): {"med"};
	default {"civ"};
};

{
	if ([getText(_x >> "conditions")] call SunriseClient_system_conditionsCheck) then {
		_passSelect lbAdd format["%1",getText(_x >> "title")];
		_passSelect lbSetData [(lbSize _passSelect)-1,configName _x];

		if (EQUAL(life_myPassportID,configName _x)) then {
			_passSelect lbSetCurSel ((lbSize _passSelect)-1);
		};
	};
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "LifeCfgPassports"));
if (lbSize _passSelect < 2) then {_passSelect ctrlEnable false};
//выбор приписки
[] call SunriseClient_system_titleConfig;
lbClear _titleSelect;
{
	if ([getText(_x >> "conditions")] call SunriseClient_system_conditionsCheck) then {
		_titleSelect lbAdd format["%1",getText(_x >> "title")];
		_titleSelect lbSetData [(lbSize _titleSelect)-1,configName _x];

		if (EQUAL(life_myTitleID,configName _x)) then {
			_titleSelect lbSetCurSel ((lbSize _titleSelect)-1);
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgTitles"));
if (lbSize _titleSelect < 2) then {_titleSelect ctrlEnable false};

if (life_coplevel in [19]) then {
	CONTROL(2900,29781) ctrlShow true;
	CONTROL(2900,29782) ctrlShow true;
	CONTROL(2900,29783) ctrlShow true;
	CONTROL(2900,29784) ctrlShow true;
	CONTROL(2900,29785) ctrlShow true;
	CONTROL(2900,29786) ctrlShow true;
	(_display displayCtrl 29783) ctrlSetText (["Полицейский", "Гражданский"] select (player getVariable ["fakeside",false]));
};

private _buttons = [
	[2010,2011], [2012,2013], [2014,2015], [2016,2017], [2018,2019], [2020,2021],

	[2022,2023], [2024,2025], [2026,2027], [2028,2029], [2030,2031], [2032,2033],

	[2034,2035], [2036,2037], [2038,2039], [2040,2041], [2042,2043], [2044,2045]
];

{
	ctrlShow [_x select 0,false];
	ctrlShow [_x select 1,false];
} forEach _buttons;

private ["_imageID","_buttonID"];
private _index = 0;
{	
	if (isNull _display) exitWith {};
	if ([getText(_x >> "conditions")] call SunriseClient_system_conditionsCheck) then {
		_imageID = _display displayCtrl ((_buttons select _index) select 0);
		_buttonID = _display displayCtrl ((_buttons select _index) select 1);
	
		_imageID ctrlSetText getText(_x >> "image");
		_buttonID ctrlSetTooltip localize (getText(_x >> "tooltip"));
		_buttonID buttonSetAction getText(_x >> "action");
	
		_imageID ctrlShow true;
		_buttonID ctrlShow true;

		ADD(_index,1);
	};	
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPadIcons"));