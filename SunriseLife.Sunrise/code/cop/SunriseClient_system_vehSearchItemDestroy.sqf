/*

	Filename: 	SunriseClient_system_vehSearchItemDestroy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 8102),-1)) exitWith {};

call SunriseClient_actions_inUse;

private _data = call (compile CONTROL_DATA(8102));
if (_data isEqualTo "") exitWith {life_action_inUse = false};
_data params ["_type","_item","_amount"];

private _index = CONTROL_VALUE(8102);
private _container = if (_index == -1) then {life_vInact_curTarget} else {((everyContainer life_vInact_curTarget) select _index) select 1};

switch (_type) do { 
	case "virt" : {[false,_item,_amount,life_vInact_curTarget] call SunriseClient_system_handleVehInv};//virt
	case "item" : {[_container,_item,_amount,true] call CBA_fnc_removeItemCargo;};
	case "mag" : {[_container,_item,_amount] call CBA_fnc_removeMagazineCargo;};
	case "weap" : {[_container,_item,_amount,true] call CBA_fnc_removeWeaponCargo;};
	case "back" : {[_container,_item,_amount,true] call CBA_fnc_removeBackpackCargo;};
	default {["error","","Это нельзя унитожить"] call SunriseClient_message};
};
[] call SunriseClient_system_vehInvSearchUpdate;
[player,life_vInact_curTarget getVariable ["vehicle_info_owners",""] select 0,_item,_amount] remoteExecCall ["SunriseServer_system_logSearch",2];
life_action_inUse = false;