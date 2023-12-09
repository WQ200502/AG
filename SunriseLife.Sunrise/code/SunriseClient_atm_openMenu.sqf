/*
	
	Filename: 	SunriseClient_atm_openMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_rob_time > time) exitWith {[localize "STR_Shop_ATMRobbed","error"] call SunriseClient_gui_bottomNotification};
disableSerialization;
if !(createDialog "SunriseDialogAtm") exitWith {};

private _display = findDisplay 2700;
private _text = _display displayCtrl 2701;
private _units = _display displayCtrl 2703;
private _gangBank = _display displayCtrl 2705;

_text ctrlSetStructuredText parseText format["<t size='1.5' color='%1'><img size='1.7' image='\sunrise_pack\icons\bank.paa'/> $%2<br/><img size='1.7' image='\sunrise_pack\icons\cash.paa'/> $%3</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000'],[BANK] call SunriseClient_system_numberText,[CASH] call SunriseClient_system_numberText];

lbClear _units;
{	
	if (LSALIVE(_x) && {GVAR_RNAME(_x) != ""}) then {
		_units lbAdd format["%1",GVAR_RNAME(_x)];
		_units lbSetData [(lbSize _units)-1,str(_x)];	
	};
} forEach (playableUnits - [player]);


if (isNil {(grpPlayer GVAR "gang_bank")}) then {
	_gangBank ctrlEnable false;
} else {
	private _ownerID = grpPlayer GVAR ["gang_owner",""];
	if (EQUAL(_ownerID,steamid)) then {
		_gangBank ctrlEnable true;
	} else {
		_gangBank ctrlEnable false;
	};
};