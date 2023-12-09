/*

	Filename: 	SunriseClient_system_chopShopSell.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
closeDialog 0;
disableSerialization;
private _control = CONTROL(39400,39402);
private _vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];

if (isNull _vehicle) exitWith {["Не найдена техника","error"] call SunriseClient_gui_bottomNotification};
if (_vehicle getVariable ["dbInfo",[]] isEqualTo []) exitWith {["У техники нет номеров. Ее нельзя перебить.","error"] call SunriseClient_gui_bottomNotification};
private _vehicleSide = _vehicle GVAR ["tf_side",sideUnknown];
if (_vehicleSide isEqualTo east) exitWith {["Нельзя продавать технику EMS","error"] call SunriseClient_gui_bottomNotification};

private _nearCops = (playableUnits - [player]) findIf {player distance _x < 1000 && {_x getVariable ["copDuty",false]}};
if (_nearCops != -1) exitWith {["Дружище, у тебя копы на хвосте! Избавься от них, иначе я не успею продать машину!","error"] call SunriseClient_gui_bottomNotification;};

if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle)) exitWith {["У техники нет стоимости и серийного номера. Ее нельзя перебить или продать","error"] call SunriseClient_gui_bottomNotification};
private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"price");
if (_basePrice <= 0) exitWith {["У техники нет стоимости и серийного номера. Ее нельзя перебить или продать","error"] call SunriseClient_gui_bottomNotification};

private _price = round (_basePrice*0.3);

[localize "STR_Shop_ChopShopSelling","info"] call SunriseClient_gui_bottomNotification;
call SunriseClient_actions_inUse;
[player,_vehicle,_price] remoteExecCall ["SunriseServer_system_chopShopSell",RSERV];