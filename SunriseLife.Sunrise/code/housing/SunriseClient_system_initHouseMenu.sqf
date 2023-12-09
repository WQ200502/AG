/*

	Filename: 	SunriseClient_system_initHouseMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house OR life_medDuty OR dialog) exitWith {}; //Bad target

if ((nearestObject [[9684.1,8922.2,0],"Land_Dome_Big_F"]) isEqualTo _house OR (nearestObject [[9684.1,8922.2,0],"Land_Research_house_V1_F"]) isEqualTo _house) exitWith {
	[_house] spawn SunriseClient_system_houseBankMenu;
};

if (player distance _house > 12) exitWith {};
if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) exitWith {};

if (!isNil {_house GVAR "house_owner"} OR (!isNil {_house GVAR "house_forSell"})) then {
	[_house] spawn SunriseClient_system_houseMenu;
} else {
	//systemChat "У дома не прописан владелец. Отправка запроса в базу данных...";
	
	["info","",format ["У дома не прописан владелец. Отправка запроса в базу данных..."],true] call SunriseClient_message;
	[[_house,player],"reqHouseInfo","SYS",false] call SunriseClient_system_hcExec;
};