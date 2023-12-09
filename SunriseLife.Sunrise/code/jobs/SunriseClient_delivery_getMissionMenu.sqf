/*
	
	Filename: 	SunriseClient_dlv_getMissionMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_depo = param [0,ObjNull,[ObjNull]];
if (life_action_inUse) exitWith {};

if (player distance life_dlv_vehicle > 25) exitWith {["Проверьте, чтобы ваш грузовик был рядом и повторите попытку","error"] call SunriseClient_gui_bottomNotification};
private _cargoDeliver = life_dlv_vehicle GVAR ["cargoDeliver",[]];
if !(_cargoDeliver isEqualTo []) exitWith {["Вы уже взяли заказ на доставку","error"] call SunriseClient_gui_bottomNotification};

disableSerialization;
if (isNull (findDisplay 4300)) then {
	if !(createDialog "SunriseDialogDeliver") exitWith {};
};

private _title = CONTROL(4300,4301);
private _control = CONTROL(4300,4302);


_title ctrlSetText format['Депо "%1"',[str(life_depo)] call SunriseClient_dlv_varToStr];

private _depos = ["depo_kavala","depo_alps","depo_north","depo_east"] - [str(life_depo)];
private _picture = getText(configFile >> "CfgVehicles" >> typeOf life_dlv_vehicle >> "picture");
lbclear _control;
{	
	_toTitle = [_x] call SunriseClient_dlv_varToStr;		
	_price = [str(life_depo),_x,life_dlv_vehicle] call SunriseClient_dlv_price;
	
	_control lbAdd format['Доставка в депо "%1"',_toTitle];
	_control lbSetData [(lbSize _control)-1,_x];
	_control lbSetPicture [(lbSize _control)-1,_picture];			
	_control lbSetTextRight [(lbSize _control)-1, format["Оплата: $%1",[_price] call SunriseClient_system_numberText]];							
} foreach _depos;