/*

	Filename: 	SunriseClient_system_smartphone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_type",0,[0]],
	["_data",0,["",[],0]],
	["_usecash",false,[false]]
];
disableSerialization;
waitUntil {!isNull findDisplay 88888};

private _display = findDisplay 88888;
private _cPlayerList = _display displayCtrl 88881;
private _cMessageList = _display displayCtrl 88882;
private _cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format[localize "STR_SMARTPHONE_MESSAGETITLE"];

ctrlEnable[887892,false];

switch (_type) do {
	case 0: {
		lbClear _cPlayerList;
		{
			if (alive _x && {LSALIVE(_x)} && {_x != player} && {GVAR_RNAME(_x) != ""}) then {
				_cPlayerList lbAdd format["%1",GVAR_RNAME(_x)];
				_cPlayerList lbSetColor [(lbSize _cPlayerList)-1,[1,1,1,1]];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;
		
		private _messages = +life_messages;
		reverse _messages;
		{
			_msg = (_x select 2) select [0,80];
			_cMessageList lnbAddRow[_x select 1,format["%1...",_msg]];
			_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_x)];
		} forEach _messages;
		ctrlEnable[887892,false];
	};

	case 2: {
		ctrlEnable[887892,true];
		life_smartphoneTarget = call compile format["%1",CONTROL_DATA(88881)];
	};

	case 3: {
		lbClear _cMessageList;
		life_messages = [];
	};

	case 4: {
		_isPhone = [] call SunriseClient_system_canUsePhone;
		if (_isPhone) then {
			_cantUse = player GVAR ["tf_unable_to_use_radio",false];
			if (_cantUse) exitWith {["Вы не можете пользоваться телефоном со связанными руками","error"] call SunriseClient_gui_bottomNotification};
			createDialog "SunriseDialogSmartphoneTargetMessage";
			ctrlSetText[88886, format["Сообщение для: %1",GVAR_RNAME(life_smartphoneTarget)]];
			ctrlShow[1600,call life_isAdmin];
		} else {
			[localize "STR_SMARTPHONE_NoPhone","error"] call SunriseClient_gui_bottomNotification;
		};
	};

	case 5: {
		_searching = toLower (ctrlText 888818);
		if (life_lastSearch isEqualTo _searching) exitWith {};
		life_lastSearch = _searching;
		lbClear _cPlayerList;

		{
			if ((toLower (_x getVariable ["realname",""])) find _searching > -1 && {alive _x} && {LSALIVE(_x)} && {_x != player} && {GVAR_RNAME(_x) != ""}) then {
				_cPlayerList lbAdd format["%1",GVAR_RNAME(_x)];
				_cPlayerList lbSetColor [(lbSize _cPlayerList)-1,[1,1,1,1]];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;
	};
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