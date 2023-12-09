/*
	
	Filename: 	SunriseClient_system_chopShopOwn.sqf
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

if (life_action_inUse) exitWith {["Вы заняты","error"] call SunriseClient_gui_bottomNotification};
if (isNull _vehicle) exitWith {};
if (_vehicle getVariable ["dbInfo",[]] isEqualTo []) exitWith {["У техники нет номеров. Ее нельзя перебить.","error"] call SunriseClient_gui_bottomNotification};
if (["B_mas_HMMWV",(typeOf _vehicle)] call BIS_fnc_inString) exitWith {["Перебивка военной техники невозможна","error"] call SunriseClient_gui_bottomNotification};
if (typeOf _vehicle in LIFE_SETTINGS(getArray,"life_doNotChop")) exitWith {["Ты знаешь, я даже за большие деньги не буду связываться с этой техникой. Могу только пустить на лом, чтобы побыстрее избавиться!","error"] call SunriseClient_gui_bottomNotification};
if (typeOf _vehicle in LIFE_SETTINGS(getArray,"life_OnlyVipVehicles") && FETCH_CONST(life_donator) isEqualTo 0) exitWith {["Эти раритетные авто совсем недавно завезли на остров, поэтому необходимых для перебивки деталей нет. Но всегда можно продать эту малышку на лом...","error"] call SunriseClient_gui_bottomNotification};
if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle)) exitWith {["У техники нет стоимости и серийного номера. Ее нельзя перебить.","error"] call SunriseClient_gui_bottomNotification};

private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"price");
if (_basePrice <= 0) exitWith {["У техники нет стоимости и серийного номера. Ее нельзя перебить.","error"] call SunriseClient_gui_bottomNotification};

private _vehicleSide = _vehicle GVAR["tf_side",sideUnknown];
private _price = [round (_basePrice * 1.15),round (_basePrice * 5)] select ((_vehicle GVAR ["tf_side",sideUnknown]) isEqualTo west);
if (IS_VIP) then {_price = [_price] call SunriseClient_system_discount};

if (CASH < _price) exitWith {["У вас недостаточно наличности, необходимой для перебивки номеров этого транспорта","error"] call SunriseClient_gui_bottomNotification};
	
private _nearCops = (playableUnits - [player]) findIf {player distance _x < 1000 && {_x getVariable ["copDuty",false]}};
if (_nearCops != -1) exitWith {["Дружище, у тебя копы на хвосте! Избавься от них, иначе я не успею перебить номера на движке!","error"] call SunriseClient_gui_bottomNotification};

[format["Перебиваем %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")],60,{!(isNull objectParent player) OR player distance (getMarkerPos life_chopShop) > 10}] call SunriseClient_system_progressBarSimple;
if (call SunriseClient_system_isInterrupted OR !(NOTINVEH(player)) OR player distance (getMarkerPos life_chopShop) > 10) exitWith {[localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification;};
if (CASH < _price) exitWith {["У вас недостаточно наличности, необходимой для перебивки номеров этого авто","error"] call SunriseClient_gui_bottomNotification;};

call SunriseClient_actions_inUse;
["VehicleChopShopped"] spawn SunriseClient_experience_addExp;
[player,_vehicle,_price,call SunriseClient_system_vehicleLimit] remoteExecCall ["SunriseServer_system_chopShopOwn",RSERV];