/*
	
	Filename: 	SunriseClient_system_repairDoor.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _building = param [0,ObjNull,[ObjNull]];
if (isNull _building) exitWith {};
if !(_building isKindOf "House_F") exitWith {["error","","Вы должны смотреть на дверь!"] call SunriseClient_message};
private _doors = 1;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

private _door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
	if (player distance _worldSpace < 5) exitWith {_door = _i;};
};
if (EQUAL(_door,0)) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if ((_building GVAR [format["bis_disabled_Door_%1",_door],0]) isEqualTo 1) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};


closeDialog 0;
private _time = switch (typeOf _building) do {
	case "Land_Dome_Big_F": {30};
	case "Land_Research_house_V1_F": {50};	
	default {5}
};

[localize "STR_Cop_RepairingDoor",75,"","",true,{}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};

_building animate [format["door_%1_rot",_door],0];
_building SVAR [format["bis_disabled_Door_%1",_door],1,true]; //Unlock the door.
