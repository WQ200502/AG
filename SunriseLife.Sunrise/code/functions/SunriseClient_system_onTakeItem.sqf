/*

	Filename: 	SunriseClient_system_onTakeItem.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_container",ObjNull,[ObjNull]],
	["_item","",[""]]
];

if (isNull _unit OR EQUAL(_item,"")) exitWith {};

if (EQUAL(_item,"EXT_FakePrimaryWeapon")) then {
	[_item] call SunriseClient_system_removeItem;
};

if (_item in LIFE_SETTINGS(getArray,"life_cheatItems")) exitWith {
	[steamid,0,"Cheat Item","CheatItem"] remoteExecCall ["SunriseServer_system_rcon",RSERV];
};

if !([_item] call SunriseClient_system_canUseItem) then {
	[_item] call SunriseClient_system_removeItem;
	["error","",format["Предмет сломался"]] call SunriseClient_message;
};

private _scope = primaryWeaponItems player select 2;
if !(_scope isEqualTo "") then {
	if !([_scope] call SunriseClient_system_canUseItem) then {
		[_scope] call SunriseClient_system_removeItemFromWeapon;
		["error","",format["Прицел сломался"]] call SunriseClient_message;
	};
};

if (_item in LIFE_SETTINGS(getArray,"life_gatherTools")) then {
	if (EQUAL((secondaryWeaponMagazine player),[])) then {
		player addSecondaryWeaponItem "sunrise_Magazine_Swing";
	};
};


playSound "click";
[] call SunriseClient_system_saveGear;