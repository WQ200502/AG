/*

	Filename: 	SunriseClient_system_wantedList.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	["_wantedUnits",[],[[]]],
	["_jailedUnits",[],[[]]]
];
life_wanted_cache = _wantedUnits;
private _list = CONTROL(2400,2401);
lbClear _list;

{
	_list lbAdd format ["%1", _x select 1];
	_list lbSetData [(lbSize _list)-1,str(_x)];
} foreach _wantedUnits;

ctrlSetText [2404,format ["Заключенных в тюрьме: %1",count _jailedUnits]];

if (EQUAL((lbSize _list),0)) then {
	_list lbAdd "Список пуст";
};

_list lbSetCurSel 0;