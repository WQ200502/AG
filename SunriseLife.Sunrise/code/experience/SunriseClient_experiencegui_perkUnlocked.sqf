/*

	Filename: 	SunriseClient_experiencegui_perkUnlocked.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
scriptName "function_perkUnlocked";
#define __filename "function_perkUnlocked.sqf"

try {
	private _config = param [0, configNull, [configNull]];
	if (isNull _config) exitWith {};

	"PerkUnlocked" cutRsc ["PerkUnlocked", "PLAIN"];
	_titleDisplay = uiNamespace getVariable ["PerkUnlocked", displayNull];
	_ctrlStrucText = _titleDisplay displayCtrl 0;
	if (isNull _titleDisplay) throw "Title display could not be found";

	private _displayName = getText (_config >> "displayName");

	_ctrlStrucText ctrlSetStructuredText parseText format ["<t size='1' align='center' shadow='2'><t color='#A2FD5A' size='2.3'>%1</t><br /><t color='#FFFFFF' size='1.5'>ОТКРЫТ</t></t>", _displayName];
} catch {
	[format ["[%1] %2", __filename, _exception]] call BIS_fnc_error;
};