/*
	
	Filename: 	SunriseClient_system_buyHouse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house) exitWith {};
if !(_house isKindOf "House_F") exitWith {};
if (_house GVAR["house_owned",false]) exitWith {};
if (!isNil {_house GVAR "house_sold"}) exitWith {["error","",format[localize "STR_House_Sell_Process"]] call SunriseClient_message};
if ([player] call SunriseClient_system_isSafeZone AND !(FETCH_CONST(life_donator) > 0)) exitWith {["error","",format["Только джентльмены могут покупать недвижимость в зеленой зоне"]] call SunriseClient_message};

private _housesLimit = if (FETCH_CONST(life_donator) > 0) then {
	LIFE_SETTINGS(getNumber,"life_houseLimitDonat")
} else {
	LIFE_SETTINGS(getNumber,"life_houseLimit")
};

if (life_houses_count >= _housesLimit) exitWith {["error","",format[localize "STR_House_Max_House"]] call SunriseClient_message};

closeDialog 0;

if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) exitWith {["error","",format["Здание не продается"]] call SunriseClient_message};
private _conditions = M_CONFIG2(getText,"LifeCfgHousing",worldName,typeOf _house,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {["error","",format["Этот дом нельзя купить"]] call SunriseClient_message};

private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");

private _action = [
	format[localize "STR_House_BuyMSG",[_price] call SunriseClient_system_numberText,_numberCrates],
	localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (BANK < _price) exitWith {["error","",format[localize "STR_House_NotEnough"]] call SunriseClient_message};
	["info","",format["Отправка запроса о покупке на сервер..."]] call SunriseClient_message;	
	[[_house,player],"checkHouse","SYS",false] call SunriseClient_system_hcExec;	
};