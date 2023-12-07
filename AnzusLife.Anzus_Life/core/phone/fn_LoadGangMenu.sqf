#include "..\..\script_macros.hpp"
private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];

if (isNull _display) exitWith {};

private _group = group player;
private _groupName = _group getVariable ["gang_name",""];

if (_groupName isEqualto "") exitWith {
	["AnzusLife_gangCreate"] spawn ANZUS_fnc_changeMenu;
	waitUntil {AnzusLife_Phone_CurrentlyOpen == "AnzusLife_gangCreate"};
	private _structuredTextCtrl = _display displayCtrl 160004;
	private _gangNameCtrl = _display displayCtrl 160003;
	
	private _gangSettings = MAIN_SETTINGS("GameSettings","Gangs");
	private _gangPrice = getNumber(_gangSettings >> "gang_price");

	private _struct = "";
	private _string2 = format["您可以使用此应用创建帮派,使用下面提供的框选择帮派名称, $%1 在您的银行中可以用来创建帮派.", ([_gangPrice] call ANZUS_fnc_numberText)];
	private _scaleFactorCtrlH = (getResolution select 1) / 1080;
	private _scaleFactorCtrlW = (getResolution select 0) / 1920;
	private _pW = (pixelW * 5) * _scaleFactorCtrlW;
	private _pH = (pixelH * 5) * _scaleFactorCtrlH;
	_struct = _struct + format ["<t align='center' font='RobotoCondensedLight' color='#4C4C4C' shadow='0' size='%1'>你不在帮派中!</t>", (_pH * 120)];
	_struct = _struct + "<br/>";
	_struct = _struct + format ["<t align='center' font='RobotoCondensedLight' color='#4C4C4C' shadow='0' size='%2'>%1</t>",_string2, (_pH * 100)];

	_structuredTextCtrl ctrlSetStructuredText parseText format["<t>%1</t>",_struct];
};

[] spawn ANZUS_fnc_gangOpen;