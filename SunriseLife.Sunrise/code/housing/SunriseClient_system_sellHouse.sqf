/*

	Filename: 	SunriseClient_system_sellHouse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];

if (isNull _house) exitWith {};
if !(_house isKindOf "House_F") exitWith {};
if (isNil {_house GVAR "house_owner"}) exitWith {};
//if !(EQUAL(life_haveCredit,[])) exitWith {hint "Вы не можете продать недвижимость, так как у вас есть активный кредит."};

closeDialog 0;

if !(isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) exitWith {};
private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
private _sellPrice = round(_price/3);

private _action = [
	format[localize "STR_House_SellHouseMSG",[_sellPrice] call SunriseClient_system_numberText,_price],
	localize "STR_pInAct_SellHouse",
	localize "STR_Global_Sell",
	localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	["Отправка запроса о продаже на сервер","info"] call SunriseClient_gui_bottomNotification;

	[[_house,_sellPrice,player,steamid],"sellHouse","SYS",false] call SunriseClient_system_hcExec;
};
