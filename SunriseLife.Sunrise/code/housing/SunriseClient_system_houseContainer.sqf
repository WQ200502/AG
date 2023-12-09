/*

	Filename: 	SunriseClient_system_houseContainer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
//_house,_housePos,_houseClass,houses.trunk, houses.inventory, houses.slots
params [	
	["_trunk",[],[[]]],
	["_inventory",[],[[]]],
	["_slots",0,[0]],
	["_house",objNull,[objNull]],
	["_housePos",[],[[]]],
	["_houseClass","",[""]]
];

private _isHouse = nearestObject [_housePos,_houseClass];
if (isNull _isHouse) exitWith {};

if !(EQUAL(_house,_isHouse)) exitWith {hint "Дома не совпадают..."};

private _position = [_house] call SunriseClient_system_getBuildingPositions;
if (EQUAL(_position,[])) exitWith {};

_position = _position select ((count _position) - 1);
private _box = _house GVAR ["house_box",objNull];

if (isNull _box) then {
	_box = createVehicle ["Land_LuggageHeap_03_F",_position,[],0,"CAN_COLLIDE"];
	waitUntil {!isNull _box};
};

if !(EQUAL((_trunk select 0),[])) then {[_box,"Trunk",_trunk] call CBA_fnc_setVarNet};
[_box,"house_box_inventory",_inventory] call CBA_fnc_setVarNet;
[_box,"house_box_slots",_slots] call CBA_fnc_setVarNet;
[_box,"house_box_inHouse",_house] call CBA_fnc_setVarNet;

[_house,"house_box",_box] call CBA_fnc_setVarNet;

[_house,"locked"] call SunriseClient_system_clearGlobalVar;

[_box,_inventory] call SunriseClient_system_houseContainerCheck;
[_box] call SunriseClient_system_trunkCheck;

[_box] remoteExecCall ["SunriseClient_system_containerActions",RCLIENT,_box];

//titleText[localize "STR_House_StorageUnlock","PLAIN"];
[localize "STR_House_StorageUnlock"] spawn SunriseClient_gui_Notification