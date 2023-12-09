/*

	Filename: 	SunriseClient_carsharing_openMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 7200)) then {
	if !(createDialog "SunriseDialogCarsharingMenu") exitWith {};
};

_display = findDisplay 7200;

private _cs_refreshed = profileNamespace getVariable ["cs_refreshed",0];
private _positions_array = profileNamespace getVariable ["cs_cars",[]];
if ((time - _cs_refreshed) > 300 OR (time - _cs_refreshed) < -300 OR _cs_refreshed isEqualTo []) then {
	profileNamespace setVariable ["cs_refreshed",time];
	_positions_array = [];
	private _nearestLoc = nearestLocations [player, ["NameCity","NameVillage", "NameCityCapital"], 1500] select 0;
	if (isNil "_nearestLoc") exitWith {};
	private _loc_distance = player distance (getpos _nearestLoc);
	private _tries = 0;
	while {count _positions_array < 10 AND _tries < 20} do {
		private _car_position = [[[getPos _nearestLoc, _loc_distance]],["water"],{isOnRoad _this AND (count(nearestObjects[_this,["LandVehicle","Ship","Air"],20]) isEqualTo 0)}] call BIS_fnc_randomPos;
		if !(_car_position isEqualTo [0,0]) then {_positions_array pushBack _car_position};
		_tries = _tries + 1;
	};
	_positions_array apply {[_x select 0, _x select 1, 0]};
	profileNamespace setVariable ["cs_cars",_positions_array];
	//systemChat "Данные о доступных машинах обновлены";
	["info","","Данные о доступных машинах обновлены"] call SunriseClient_message;
};
{
	_marker = createMarkerLocal [format["%1_cs",_forEachIndex], _x];
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerTypeLocal "c_car";
} forEach _positions_array;

_marker = createMarkerLocal [format["%1_marker",player],visiblePosition player];
_marker setMarkerColorLocal "ColorCivilian";
_marker setMarkerTypeLocal "Mil_dot";
_marker setMarkerTextLocal format["%1", GVAR_RNAME(player)];

private _rentBtn = CONTROL(7200,7004);
private _stoprentBtn = CONTROL(7200,7001);
private _rulesText = CONTROL(7200,7003);

if (life_cs_renting) then {_rentBtn ctrlEnable false;} else {_stoprentBtn ctrlEnable false;};
_basePrice = LIFE_SETTINGS(getNumber,"life_cs_price");

_rulesText ctrlSetStructuredText parseText format["
<t size='1'><t color='#FFFFFF'>Здесь вы можете арендовать машину которая находится рядом с вами.<br/>
Цена за бронь - <t color='#00FF00'>$%1</t>, цена за минуту аренды - <t color='#00FF00'>$%2</t>, деньги будут списываться с вашего банковского счета.<br/>
Машину необходимо оставлять на дороге в радиусе зон паркинга без повреждений, иначе на вас будет наложен штраф или предупреждения, если у вас нет денег.",[_basePrice * 10] call SunriseClient_system_numberText,[_basePrice] call SunriseClient_system_numberText];

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
