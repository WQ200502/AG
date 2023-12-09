/*
	
	Filename: 	SunriseClient_system_sellHouseDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
    ["_house",ObjNull,[ObjNull]],
    ["_price",0,[0]]
];
if (isNull _house) exitWith {hint "Ошибка. Обратитесь к администратору."};

[_house,"locked"] call SunriseClient_system_clearGlobalVar;
private _markerID = round ((getPosATL _house) select 0);
deleteMarkerLocal format["house_%1",_markerID];

private _index = life_vehicles find _house;
if !(_index isEqualTo -1) then {
	life_vehicles set[_index,-1];
	life_vehicles = life_vehicles - [-1];
};
////houses.pos, houses.classname
{   
	if ((_x select 0) isEqualTo ([_house] call SunriseClient_system_getHousePos)) then {
		life_houses set[_forEachIndex,-1];	
	};
} forEach life_houses;
life_houses = life_houses - [-1];
life_houses_count = life_houses_count - 1;
	
private _numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house SVAR[format["bis_disabled_Door_%1",_i],0,true];
};

private _house_box = _house GVAR ["house_box",objNull];
if (!isNull _house_box) then {
	deleteVehicle _house_box;
};

[_house,"house_owner"] call SunriseClient_system_clearGlobalVar;
[_house,"house_sold"] call SunriseClient_system_clearGlobalVar;

_house SVAR ["house_forSell",true,true];

["atm","add",_price,"sellHouse"] call SunriseClient_system_myCash;	
[format["Дом успешно продан за $%1!",[_price] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;

[["house",format["%1 (%2) sold %3 MarkerID(%4) for $%5",GVAR_RNAME(player),steamid,(typeOf _house),_markerID,[_price] call SunriseClient_system_numberText]],"customLog"] call SunriseClient_system_hcExec;