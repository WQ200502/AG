/*

	Filename: 	SunriseServer_system_loadPrices.sqf
	Project: 	Sunrise Altis Life RPG

*/
private _GetPrices = "getServerPrices" call SunriseServer_database_selectFull;
private _sell_array = [];
private _illegal_items = [];

{
    if (_x select 1 > 0) then {
		_sell_array pushBack [_x select 0, _x select 1];
	};

	if (_x select 2) then {
		private _rew = if (_x select 1 <= 0) then {2} else {round((_x select 1) / 1.3)};
		_illegal_items pushBack [_x select 0, _rew];
	};
} forEach _GetPrices;

missionNamespace setVariable ["sell_array",_sell_array,true];
missionNamespace setVariable ["buy_array",[],true];
missionNamespace setVariable ["life_illegal_items",_illegal_items,true];
