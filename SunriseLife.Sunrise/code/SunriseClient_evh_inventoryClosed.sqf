/*

	Filename: 	SunriseClient_evh_inventoryClosed.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_unit","_container"];
if (isNull _container) exitWith {}; //MEH

if (typeOf _container == "Box_Wps_F") then {
	if (((magazineCargo _container) isEqualTo []) && ((WeaponCargo _container) isEqualTo []) &&	((itemCargo _container) isEqualTo [])) then {
		private _data = _container GVAR ["Trunk",[[],0]];
		if ((_data select 0) isEqualTo []) then {
			deleteVehicle _container;
		};		
	};
};

[life_currentContainer,"openedByUnit"] call SunriseClient_system_clearGlobalVar;
life_currentContainer = objNull;
life_ContainerOpened = false;

{
	if ((isPlayer _x && _x != player) && (alive _x)) then {
		if ((backpackContainer player) isEqualTo (backpackContainer _x)) then {
			removeBackpack player;
			[["dupe",[format["%1 (%2) backpack dupe with %3 (%4)",GVAR_RNAME(player),steamid,GVAR_RNAME(_x),getPlayerUID _x]]],"customLog"] call SunriseClient_system_hcExec;
		};
	};
} forEach nearestObjects [player, ["O_medic_F","C_man_1","B_medic_F","I_medic_F"], 20];

[] call SunriseClient_system_saveGear;
[] call SunriseClient_fast_hudWeaponUpdate;