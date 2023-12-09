/*

	Filename: 	SunriseClient_pad_openMain.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (LSNOTALIVE(player)) exitWith {}; //Prevent them from opening this for exploits while dead.

createDialog "SunriseDialogPadMain";
waitUntil {!isNull (findDisplay 2000)};
_display = findDisplay 2000;

private _licenses = CONTROL(2000,7208);
private _near_money = CONTROL(2000,7205);
private _notifications_list = CONTROL(2000,7211);
private _vehicles_list = CONTROL(2000,7213);
private _near_vehicles = CONTROL(2000,7214);
private _mstatus = CONTROL(2000,7203);
private _expoints = CONTROL(2000,7218);
private _struct = "";

lbClear _licenses;
lbClear _near_money;
lbClear _notifications_list;
lbClear _vehicles_list;
lbClear _near_vehicles;

private _buttons = [
	[2010,2011], [2012,2013], [2014,2015], [2016,2017], [2018,2019], [2020,2021],

	[2022,2023], [2024,2025], [2026,2027], [2028,2029], [2030,2031], [2032,2033],

	[2034,2035], [2036,2037], [2038,2039], [2040,2041], [2042,2043], [2044,2045]
];

{
	ctrlShow [_x select 0,false];
	ctrlShow [_x select 1,false];
} forEach _buttons;

private _notifications = +life_notifications;
reverse _notifications;
_notifications resize 50;
{
	if (isNil "_x") exitWith {};
	_x params ["_time","_type","_text"];
	private _index = _notifications_list lbAdd format["[%1] %2",_time,_text];
	_notifications_list lbSetPicture [_index,format["\sunrise_pack\icons\messages\%1.paa",_type]];
} forEach _notifications;

////////////////////////////////////
{
	if (!isNull _x && alive _x) then {
		private _text = "";
		if (!isNil {_x GVAR "Life_VEH_color"}) then {
			_color = _x GVAR ["Life_VEH_color",""];
			if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) then {
				_text = format[" (%1)",M_CONFIG(getText,"LifeCfgVehTextures",_color,"displayName")];
			};			
		};
				
		private _pic = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "picture");
		_vehicles_list lbAdd format["%1%3 - [Расстояние: %2m]",getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"),round(player distance _x),_text];
		if (_pic != "pictureStaticObject") then {_vehicles_list lbSetPicture [(lbSize _vehicles_list)-1,_pic];};
		_vehicles_list lbSetData [(lbSize _vehicles_list)-1,str(_forEachIndex)];
	};
} forEach life_vehicles;

{
	if (!isNull _x && alive _x) then {	
		private _pic = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "picture");
		_vehicles_list lbAdd format["%1 - [ВЗЛОМАН] - [Расстояние: %2m]",getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"),round(player distance _x)];
		if (_pic != "pictureStaticObject") then {_vehicles_list lbSetPicture [(lbSize _vehicles_list)-1,_pic]};
		_vehicles_list lbSetData [(lbSize _vehicles_list)-1,""];
	};
} forEach life_tempHouses;

if (((lbSize _vehicles_list)-1) isEqualTo -1) then
{
	_vehicles_list lbAdd "У вас нет ключей";
	_vehicles_list lbSetData [(lbSize _vehicles_list)-1,str(ObjNull)];
};
////////////////////////////

{
	_licenses lbAdd format["%1",localize (getText(missionConfigFile >> "LifeCfgLicenses" >> _X >> "displayName"))];	
} forEach life_licenses;

private _near_units = [];
{ 
	if (player distance _x < 10) then {
		_near_units pushBack _x;
	};
} foreach (playableUnits - [player]);

private "_indexInIds";
{
	_indexInIds = [(getPlayerUID _x),life_ids] call SunriseClient_system_index;
	if (!isNull _x && alive _x && player distance _x < 10 && {GVAR_RNAME(_x) != ""} && {!(EQUAL(_indexInIds,-1)) OR (_x in (units grpPlayer))}) then {
		_near_money lbAdd (GVAR_RNAME(_x));
		_near_money lbSetData [(lbSize _near_money)-1,str(_x)];		
		_near_vehicles lbAdd (GVAR_RNAME(_x));
		_near_vehicles lbSetData [(lbSize _near_vehicles)-1,str(_x)];

	};
} foreach _near_units;

if (DCASH > 0) then {
	_mstatus ctrlSetStructuredText parseText format["<img size='0.9' image='\sunrise_pad\icons\icon-money-dcash.paa'/> <t size='0.85'>$%1</t><br/><img size='0.9' image='\sunrise_pad\icons\icon-money-cash.paa'/> <t size='0.85'>$%2</t><br/><img size='0.9' image='\sunrise_pad\icons\icon-money-bank.paa'/> <t size='0.85px'>$%3</t>",[DCASH] call SunriseClient_system_numberText, [CASH] call SunriseClient_system_numberText, [BANK] call SunriseClient_system_numberText];
} else {
	_mstatus ctrlSetStructuredText parseText format["<img size='1' image='\sunrise_pad\icons\icon-money-cash.paa'/> <t size='0.85'>$%1</t><br/><img size='0.9' image='\sunrise_pad\icons\icon-money-bank.paa'/> <t size='0.85px'>$%2</t>",[CASH] call SunriseClient_system_numberText, [BANK] call SunriseClient_system_numberText];
};

if (FETCH_CONST(life_donator) > 0) then {
	_expoints ctrlSetStructuredText parseText format["<img size='1' image='\sunrise_pad\icons\icon-vip.paa'/> <t size='0.85px'>" + localize "STR_PM_CurVipLvl" + "</t>",FETCH_CONST(life_donator)];
};

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