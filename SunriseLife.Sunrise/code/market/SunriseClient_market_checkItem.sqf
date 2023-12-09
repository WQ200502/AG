/*

	Filename:	SunriseClient_market_checkItem.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_newItem","",[""]],
	["_amount",-1,[0]]
];
private["_item","_cargo","_array","_sitem","_mass"];
private _can = false;


private _newItemMass = if (isClass (configfile >> "CfgWeapons" >> _newItem)) then {
	if (isClass (configfile >> "CfgWeapons" >> _newItem >> "weaponSlotsInfo")) then {
		getNumber (configfile >> "CfgWeapons" >> _newItem >> "weaponSlotsInfo" >> "mass");
	} else {
		getNumber (configfile >> "CfgWeapons" >> _newItem >> "itemInfo" >> "mass");
	};
} else {
	if (isClass (configfile >> "CfgMagazines" >> _newItem)) then {
		getNumber (configfile >> "CfgMagazines" >> _newItem >> "mass");
	} else {
		getNumber (configfile >> "CfgVehicles" >> _newItem >> "mass");
	};
};

_newItemMass = (_newItemMass * _amount);

private _storageItems = [];
private _totalStorageItems = 0;
private _storage = [];
private _totalCargoSpace = 0;

if (backpack player != "") then {
	_storage pushBack backpack player;
	_storageItems = _storageItems + backPackItems player;
};

if (uniform player != "") then {
	_storage pushBack uniform player;
	_storageItems = _storageItems + uniformItems player;
};

if (vest player != "") then {
	_storage pushBack vest player;
	_storageItems = _storageItems + vestItems player;
};

if !(_storage isEqualTo []) then {
	{
		_item = _x;
		_cargo = 0;
		_array = [];
		
		if (isClass (configFile >> "CfgVehicles" >> _item)) then {
			_cargo = getNumber (configFile >> "cfgVehicles" >> _item >> "maximumLoad");
		} else {
			_array = toArray getText (configFile >> "CfgWeapons" >> _item >> "iteminfo" >> "containerClass");
			for "_i" from 6 to (count _array -1) do {
				_cargo=_cargo+10^(count _array - 1 - _i)*((_array select _i)-48);
			};
		
		};
		_totalCargoSpace = _totalCargoSpace + _cargo;
	} forEach _storage;
};
	

if !(_storageItems isEqualTo []) then {
	{
		_sitem = _x;
		_mass = 0;
		_mass = if (isClass (configfile >> "CfgWeapons" >> _sitem)) then {
		
			if (isClass (configfile >> "CfgWeapons" >> _sitem >> "weaponSlotsInfo")) then {
				getNumber (configfile >> "CfgWeapons" >> _sitem >> "weaponSlotsInfo" >> "mass");
			} else {
				getNumber (configfile >> "CfgWeapons" >> _sitem >> "itemInfo" >> "mass");
			};
		} else {
			if (isClass (configfile >> "CfgMagazines" >> _sitem)) then {
				getNumber (configfile >> "CfgMagazines" >> _sitem >> "mass");
			} else {
				getNumber (configfile >> "CfgVehicles" >> _sitem >> "mass");
			};
		
		};
		_totalStorageItems = _totalStorageItems + _mass;
	} forEach _storageItems
};

_totalCargoSpace = _totalCargoSpace - _totalStorageItems;
_totalCargoSpace = _totalCargoSpace - _newItemMass;

if (_totalCargoSpace > _newItemMass) then {_can = true};
_can;
