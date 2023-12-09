/*

	Filename: 	SunriseClient_system_getPlayerItems.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _player = param [0,player,[objNull]];
private _items = [];

if (uniform _player != "") then {
	_items pushBack uniform _player;
	_items = _items + (uniformItems _player);
};

if (vest _player != "") then {
	_items pushBack vest _player;
	_items = _items + (vestItems _player);
};

if (backpack _player != "") then {
	_items pushBack backpack _player;
	_items = _items + (backPackItems _player);
};

_items pushBack goggles _player;
_items pushBack headgear _player;
_items = _items + assignedITems _player;

if (primaryWeapon _player != "") then {
	_items pushBack primaryWeapon _player;
	_items = _items + primaryWeaponItems _player;
	if ((_player ammo (primaryWeapon _player)) > 0) then {
		_items pushBack ((primaryWeaponMagazine _player) select 0);
	};
};

if (secondaryWeapon _player != "") then {
	_items pushBack secondaryWeapon _player;
	_items = _items + secondaryWeaponItems _player;
	if ((_player ammo (secondaryWeapon _player)) > 0) then {
		_items pushBack ((secondaryWeaponMagazine _player) select 0);
	};
};

if (handgunWeapon _player != "") then {
	_items pushBack handgunWeapon _player;
	_items = _items + handgunItems _player;
	if ((_player ammo (handgunWeapon _player)) > 0) then {
		_items pushBack ((handgunMagazine _player) select 0);
	};
};

private _itemsFinal = [];
private _listed = [];
private ["_item","_itemCount"];
{
	if (!(_x in _listed) && _x != "") then {
		_item = _x;
		_listed pushBack _item;
		_itemCount = {_x isEqualTo _item} count _items;
		_itemsFinal pushBack [_item,_itemCount];
	};
} forEach _items;

_itemsFinal;