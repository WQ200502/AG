/*

	Filename: 	SunriseClient_system_getplayeritems.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team

*/
#include "..\script_macros.hpp"
private _items = [];

if !(EQUAL(PUNIFORM,"")) then {
	_items pushBack PUNIFORM;
	_items = _items + PUNIFORM_ITEMS;
};

if !(EQUAL(PVEST,"")) then {
	_items pushBack PVEST;
	_items = _items + PVEST_ITEMS;
};

if !(EQUAL(PBACKPACK,"")) then {
	_items pushBack PBACKPACK;
	_items = _items + PBACKPACK_ITEMS;
};

_items pushBack PGOOGLES;
_items pushBack PHEADGEAR;
_items = _items + P_ASSIGNED;

if !(EQUAL(RIFLE,"")) then {
	_items pushBack RIFLE;
	_items = _items + RIFLE_ITEMS;
	if ((player ammo (RIFLE)) > 0) then {
		_items pushBack ((primaryWeaponMagazine player) select 0);
	};
};

if !(EQUAL(LAUNCHER,"")) then {
	_items pushBack LAUNCHER;
	_items = _items + LAUNCHER_ITEMS;
	if ((player ammo (LAUNCHER)) > 0) then {
		_items pushBack ((secondaryWeaponMagazine player) select 0);
	};
};

if !(EQUAL(PISTOL,"")) then {
	_items pushBack PISTOL;
	_items = _items + PISTOL_ITEMS;
	if ((player ammo (PISTOL)) > 0) then {
		_items pushBack ((handgunMagazine player) select 0);
	};
};

private _itemsFinal = [];
private _listed = [];
private ["_item","_itemCount"];

{
	if !(EQUAL(_x,"")) then {
		if !(_x in _listed) then {
			_item = _x;
			_listed pushBack _item;
			_itemCount = {_x == _item} count _items;
			_itemsFinal pushBack [_item,_itemCount];
		};
	};	
} forEach _items;

_itemsFinal;