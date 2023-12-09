/*
	
	Filename: 	SunriseClient_system_wantedMenuSearch.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;

_searching = toLower (ctrlText 24012);
private _list = CONTROL(2400,2401);
lbClear _list;

{	
	if (toLower (_x select 1) find _searching > -1) then {
		_list lbAdd format ["%1", _x select 1];
		_list lbSetData [(lbSize _list)-1,str(_x)];
	};
} foreach life_wanted_cache;


if (EQUAL((lbSize _list),0)) then {
	_list lbAdd "Ничего не найдено";
};

_list lbSetCurSel 0;