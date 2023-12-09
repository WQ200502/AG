/*

	Filename: 	SunriseClient_system_openPropertyMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 4370)) then {
	if !(createDialog "SunriseDialogPropertyMenu") exitWith {};
};
CONTROL(4370,2705) ctrlEnable false;
CONTROL(4370,2704) ctrlEnable false;
CONTROL(4370,2706) ctrlEnable false;
CONTROL(4370,2708) ctrlEnable false;
CONTROL(4370,2709) ctrlEnable false;

private _houseList = CONTROL(4370,2702);
{	
	_house = nearestObject [_x select 0,_x select 1];
	if (isNull _house) exitWith {hint format["(%1)\n\nПроблема с домом. Сообщите об этом администрации!",_x]};
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");	
	
	_houseList lbAdd format["%1 (#%2)",_houseName,round ((_x select 0) select 0)];
	_houseList lbSetData [(lbSize _houseList)-1,str(_forEachIndex)];
	
} foreach life_houses;
_houseList lbSetCurSel 0;


CONTROL(4370,2710) ctrlSetStructuredText parseText format [
	"<t color='%1' size='0.85'>Добро пожаловать в меню управления недвижимостью. В нём вы можете управлять своим имуществом.<br/>
	Также вы можете оплатить услуги ЖКХ с помощью своего банковского счета<br/>
	Если вы не будете оплачивать услуги в срок - ваш дом будет отдан государству, а вещи уничтожены.<br/></t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
	
	
_display = findDisplay 4370;

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

