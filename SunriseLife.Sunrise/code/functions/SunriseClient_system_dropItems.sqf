/*

	Filename: 	SunriseClient_system_dropItems.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
uiSleep (random 5);

private _box = createVehicle["Box_Wps_F", getPosATL _unit, [], 0, "NONE"];
waitUntil {!isNull _box};

if (!(uniform _unit isEqualTo "")) then {
	{
		[_x, _box] call SunriseClient_system_addItemToBox;
	} forEach(uniformItems _unit);

	[uniform _unit, _box] call SunriseClient_system_addItemToBox;
};

if (!(vest _unit isEqualTo "")) then {
	{
		[_x, _box] call SunriseClient_system_addItemToBox;
	} forEach(vestItems _unit);

	[vest _unit, _box] call SunriseClient_system_addItemToBox;
};

if (!(backpack _unit isEqualTo "")) then {
	{
		[_x, _box] call SunriseClient_system_addItemToBox;
	} forEach(backpackItems _unit);

	[backpack _unit, _box] call SunriseClient_system_addItemToBox;
};

[goggles _unit, _box] call SunriseClient_system_addItemToBox;
[headGear _unit, _box] call SunriseClient_system_addItemToBox;

{
	if !(_x isEqualTo "") then {
		[_x, _box] call SunriseClient_system_addItemToBox;
	};
} forEach(assigneditems _unit);

if (!(primaryWeapon _unit isEqualTo "")) then {
	if (count(primaryWeaponMagazine _unit) > 0) then {
		[((primaryWeaponMagazine _unit) select 0), _box] call SunriseClient_system_addItemToBox;
	};
	if (count(primaryWeaponItems _unit) > 0) then {
		{
			[_x, _box] call SunriseClient_system_addItemToBox;
		}
		forEach(primaryWeaponItems _unit);
	};
	[primaryWeapon _unit, _box] call SunriseClient_system_addItemToBox;
};

if (!(handgunWeapon _unit isEqualTo "")) then {
	if (count(handgunMagazine _unit) > 0) then {
		[((handgunMagazine _unit) select 0), _box] call SunriseClient_system_addItemToBox;
	};

	if (count(handgunItems _unit) > 0) then {
		{
			[_x, _box] call SunriseClient_system_addItemToBox;
		} forEach(handgunItems _unit);
	};
	[handgunWeapon _unit, _box] call SunriseClient_system_addItemToBox;
};

if (!(secondaryWeapon _unit isEqualTo "")) then {
	if (count(secondaryWeaponMagazine _unit) > 0) then {
		[((secondaryWeaponMagazine _unit) select 0), _box] call SunriseClient_system_addItemToBox;
	};
	[secondaryWeapon _unit, _box] call SunriseClient_system_addItemToBox;
};
private _containers = nearestObjects[getPosATL _unit,["WeaponHolderSimulated"],10];
if !(EQUAL(_containers,[])) then {
	{
		{
			if !(EQUAL((_x select 0),"")) then {_box addWeaponCargoGlobal [(_x select 0),1]};
			if !(EQUAL((_x select 1),"")) then {_box addItemCargoGlobal [(_x select 1),1]};
			if !(EQUAL((_x select 2),"")) then {_box addItemCargoGlobal [(_x select 2),1]};
			if !(EQUAL((_x select 3),"")) then {_box addItemCargoGlobal [(_x select 3),1]};
			if !(EQUAL((_x select 4),[])) then {_box addMagazineCargoGlobal [((_x select 4) select 0),1]};
			if !(EQUAL((_x select 5),"")) then {_box addItemCargoGlobal [(_x select 5),1]};
		} forEach weaponsItems _x;
		
		deleteVehicle _x;
	} foreach _containers;	
};

private _virtItems = [];
private["_value", "_item", "_itemName"]; {
	_item = configName _x;
	_value = missionNamespace getVariable[format["life_inv_%1", getText(missionConfigFile >> "LifeCfgVirtualItems" >> _item >> "variable")], 0];
	_itemName = format["life_inv_%1", getText(missionConfigFile >> "LifeCfgVirtualItems" >> _item >> "variable")];
	if (_value > 0) then {
		_virtItems pushBack[_item, _value];
		missionNamespace setVariable[_itemName, 0];
	};
} forEach ("true" configClasses(missionConfigFile >> "LifeCfgVirtualItems"));

if (CASH > 0) then {
	_virtItems pushBack ["money",CASH];
	["cash","drop",CASH,"dropMoneyDeath"] call SunriseClient_system_myCash;
};

if (DCASH > 0) then {
	_virtItems pushBack ["dmoney",DCASH];
	["dcash","drop",DCASH,"dropIllegalMoneyDeath"] call SunriseClient_system_myCash;
};

[_box, "Trunk", [_virtItems, 0]] call CBA_fnc_setVarNet;

call SunriseClient_system_saveGear;