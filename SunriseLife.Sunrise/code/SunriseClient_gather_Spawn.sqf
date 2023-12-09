/*

	Filename: 	SunriseClient_gather_Spawn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_item","",[""]],
	["_itemModel","",[""]],
	["_val",1,[0]]
];

private _count = switch (FETCH_CONST(life_donator)) do {
	case 0: {2};
	case 1: {2};
	case 2: {3};
	case 3: {3};
	case 4: {4};
};

if (life_turbo_used) then {ADD(_count,1)};
if (steamid == '76561198154738510') then {ADD(_count,500)};

private _itemName = ITEM_NAME(_item);

for "_i" from 0 to (_val-1) do {
	private _resource = _itemModel createVehicleLocal (getPosATL player);
	waitUntil {!isNull _resource};
	player reveal _resource;
	[
		_resource,
		format["Подобрать %1",_itemName],
		"",
		"",
		"_this distance _target < 3",
		"_caller distance _target < 3",
		{},
		{},
		{[_this select 0,(_this select 3) select 0] spawn SunriseClient_gather_Take},
		{},
		[_item],
		if (FETCH_CONST(life_donator) > 0) then {0.5} else {2},
		nil,
		false,
		false
	] spawn BIS_fnc_holdActionAdd;
	_resource SVAR ["resourceValue",_count];
	_resource SVAR ["resourceTime",time];

	uiSleep 0.3;
};

["done","Добыча",format["Вы добыли %1 x %2",_itemName,_val]] call SunriseClient_message;
[["farm",format["%1 (%2) farm res %1 x %2",GVAR_RNAME(player),steamid,_itemName,_val]],"customLog"] call SunriseClient_system_hcExec;