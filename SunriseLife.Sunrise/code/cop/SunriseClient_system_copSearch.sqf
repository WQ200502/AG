/*
	
	Filename: 	SunriseClient_system_copSearch.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_action_inUse = false;
params [
	["_civ",Objnull,[Objnull]],
	["_p_virt_gear",[],[[]]],
	["_dcash",0,[0]]
];

if (isNull _civ) exitWith {};
createDialog "SunriseDialogSearch";
disableSerialization;

private _gear_list = CONTROL(8000,8002);
lbClear _gear_list;

ctrlSetText [8001,format["Обыск гражданина %1", GVAR_RNAME(_civ)]];

_gear_list lbAdd format["Грязные деньги - $%1",[_dcash] call SunriseClient_system_numberText];
_gear_list lbSetData [(lbSize _gear_list)-1,str ["dcash",_dcash]];
_gear_list lbSetValue [(lbSize _gear_list)-1,3];

_gear_list lbAdd "--------- Виртуальные вещи ---------";
{	
	_x params ["_name","_value"];
	_gear_list lbAdd format["%1x %2",_value,ITEM_NAME(_name)];
	_gear_list lbSetData [(lbSize _gear_list)-1,str [_name,_value]];
	_gear_list lbSetValue [(lbSize _gear_list)-1,1];
	_gear_list lbSetPicture [(lbSize _gear_list)-1,ITEM_ICON(_name)]; 
} foreach _p_virt_gear;

private _p_gear = [_civ] call SunriseClient_system_getPlayerItems;
_gear_list lbAdd "--------- Физические вещи ---------";
{
	_itemInfo = [_x select 0] call SunriseClient_system_itemDetails;
	if !(EQUAL(_itemInfo,[])) then {
		if (_x select 1 > 1) then {
			_gear_list lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		} else {
			_gear_list lbAdd format["%1",_itemInfo select 1];
		};
		_gear_list lbSetData[(lbSize _gear_list)-1,str [_itemInfo select 0,_x select 1]];
		_gear_list lbSetValue [(lbSize _gear_list)-1,2];
		_gear_list lbSetPicture[(lbSize _gear_list)-1,_itemInfo select 2];
	};
} foreach _p_gear;

if (EQUAL((lbSize _gear_list),0)) then {
	_gear_list lbAdd "Нет предметов";
};
