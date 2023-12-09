/*

	Filename: 	SunriseClient_system_initHouses.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_houses = param [0,[],[[]]];
if (EQUAL(life_houses,[])) exitWith {["info","",format ["У вас нет недвижимости"],true] call SunriseClient_message};

//systemChat "Загрузка недвижимости...";
["info","",format ["Загрузка недвижимости..."],true] call SunriseClient_message;
life_houses_count = count life_houses;

private["_house","_houseName","_numOfDoors","_marker","_markerID"];
{	
	_house = nearestObject [_x select 0,_x select 1];
	if (isNull _house) exitWith {hint format["(%1) Проблема с домом. Сообщите об этом администрации!",_x]};

	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		
	_house SVAR ["house_owner",[steamid,profileName],true];
	_house SVAR ["locked",true,true];
	[_house,"house_forSell"] call SunriseClient_system_clearGlobalVar;
	
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house animate [format["door_%1_rot",_i],0];
		_house SVAR [format["bis_disabled_Door_%1",_i],1,true];		
	};
	
	_markerID = round ((_x select 0) select 0);
	_marker = createMarkerLocal [format["house_%1",_markerID],_x select 0];
	_marker setMarkerTextLocal format["%1 (#%2)",_houseName, _markerID];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";

	life_vehicles pushBack _house;
	
} foreach life_houses;

//systemChat format ["Загрузка недвижимости на острове завершена. Объектов во владении: %1",life_houses_count];

["info","",format ["Загрузка недвижимости на острове завершена. Объектов во владении: %1",life_houses_count],true] call SunriseClient_message;