/*
	
	Filename: 	SunriseClient_system_buyHouseDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !(params [
    ["_house",objNull,[objNull]],
	["_housePos",[],[[]]]
]) exitWith {["error",format ["|SunriseClient_system_buyHouseDone| PARAMS=%1",_this]] call SunriseServer_system_customLog};
private _house_class = typeOf _house;

if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> _house_class)) exitWith {hint "Здание не продается"};

private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,_house_class,"price");
if (BANK < _price) exitWith {hint format [localize "STR_House_NotEnough"]};

[[steamid,_house,player],"addHouse","SYS",false] call SunriseClient_system_hcExec;

_house SVAR ["house_owner",[steamid,GVAR_RNAME(player)],true];
_house SVAR ["locked",true,true];
[_house,"house_forSell"] call SunriseClient_system_clearGlobalVar;

["atm","take",_price,"buyHouse"] call SunriseClient_system_myCash;
life_tmp_tax = life_tmp_tax + _price;	
life_vehicles pushBack _house;

//houses.pos, houses.classname
life_houses pushBack [_housePos,_house_class];
life_houses_count = life_houses_count + 1;

private _houseName = FETCH_CONFIG2(getText,"CfgVehicles",_house_class,"displayName");
private _markerID = round (_housePos select 0);
private _marker = createMarkerLocal [format["house_%1",_markerID],_housePos];
_marker setMarkerTextLocal format["%1 (#%2)",_houseName,_markerID];
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTypeLocal "loc_Lighthouse";
private _numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",_house_class,"numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house SVAR[format["bis_disabled_Door_%1",_i],1,true];
};
["done","",format["Поздравляем! Вы купили дом!"]] call SunriseClient_message;
["HousePurchased"] spawn SunriseClient_experience_addExp;
[["house",format["%1 (%2) bought %3 MarkerID(%4) for $%5",GVAR_RNAME(player),steamid,(_house_class),_markerID,[_price] call SunriseClient_system_numberText]],"customLog"] call SunriseClient_system_hcExec;