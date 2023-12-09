/*

	Filename: 	SunriseClient_system_vehTakeItem.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _storeall = param [0,false,[true]];
disableSerialization;
if (isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {[localize "STR_MISC_VehDoesntExist","error"] call SunriseClient_gui_bottomNotification;};
if (LSNOTALIVE(player)) exitwith {closeDialog 0;};
if (EQUAL((lbCurSel 3502),-1)) exitWith {[localize "STR_Global_NoSelection","error"] call SunriseClient_gui_bottomNotification;};

private _ctrl = CONTROL_DATA(3502);
private _num = ctrlText 3505;
if (!([_num] call SunriseClient_system_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat","error"] call SunriseClient_gui_bottomNotification;};

_num = parseNumber(_num);
if (_num < 1) exitWith {[localize "STR_MISC_Under1","error"] call SunriseClient_gui_bottomNotification;};

private _index = [_ctrl,((life_trunk_vehicle GVAR ["Trunk",[[],0]]) select 0)] call SunriseClient_system_index;
if (EQUAL(_index,-1)) exitWith {};

private _data = (life_trunk_vehicle GVAR ["Trunk",[[],0]]) select 0;
private _value = _data select _index select 1;
if (_num > _value) exitWith {[localize "STR_MISC_NotEnough","error"] call SunriseClient_gui_bottomNotification;};
if (_storeall) then {_num = _value};

_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call SunriseClient_system_calWeightDiff;
if (EQUAL(_num,0)) exitWith {[localize "STR_NOTF_InvFull","error"] call SunriseClient_gui_bottomNotification};

if (EQUAL(_ctrl,"money") OR EQUAL(_ctrl,"dmoney")) then {
	if (EQUAL(_num,_value)) then {
		_data set[_index,-1];
		_data = _data - [-1];
	} else {
		_data set[_index,[_ctrl,(_value - _num)]];
	};

	if (EQUAL(_ctrl,"money")) then {
		["cash","add",_num,"vehTakeItem"] call SunriseClient_system_myCash;
	} else {
		if (life_copDuty OR life_medDuty) then {
			["cash","add",_num,"vehTakeItem"] call SunriseClient_system_myCash;
		} else {
			["dcash","add",_num,"vehTakeItem"] call SunriseClient_system_myCash;
		};
	};
	
	private _vehTotalWeight = 0;
	{
		_itemWeight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
		_vehTotalWeight = _vehTotalWeight + _itemWeight;	  
	} forEach _data;
	
	[life_trunk_vehicle,"Trunk",[_data,_vehTotalWeight]] call CBA_fnc_setVarNet;
	[life_trunk_vehicle] call SunriseClient_system_vehInventory;
} else {
	if ([true,_ctrl,_num] call SunriseClient_system_handleInv) then {
		if (EQUAL(_num,_value)) then {
			_data set[_index,-1];
			_data = _data - [-1];
		} else {
			_data set[_index,[_ctrl,(_value - _num)]];
		};

		private _vehTotalWeight = 0;
		{
			_itemWeight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
			_vehTotalWeight = _vehTotalWeight + _itemWeight;
		} forEach _data;

		[life_trunk_vehicle,"Trunk",[_data,_vehTotalWeight]] call CBA_fnc_setVarNet;
		[life_trunk_vehicle] call SunriseClient_system_vehInventory;
	} else {
		[localize "STR_NOTF_InvFull","error"] call SunriseClient_gui_bottomNotification;
	};
};