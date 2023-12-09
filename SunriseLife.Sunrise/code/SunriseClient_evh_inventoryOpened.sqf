/*

	Filename: 	SunriseClient_evh_inventoryOpened.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_unit","_container","_secondaryContainer"];
private _isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if (EQUAL(_isPack,1)) exitWith {
	[localize "STR_MISC_Backpack","error"] call SunriseClient_gui_BottomNotification;
	true;
};

if (_container isKindOf "Man") exitWith {
	[localize "STR_NOTF_NoLootingPerson","error"] call SunriseClient_gui_BottomNotification;
	true;
};

if ([_container] call SunriseClient_system_isVehicleKind && {!(_container in life_vehicles) && {EQUAL((locked _container),2)}} ) exitWith {
	[localize "STR_MISC_VehInventory","error"] call SunriseClient_gui_BottomNotification;
	"Container BLOCK" call SunriseClient_system_log;
	true;
};

if ([_secondaryContainer] call SunriseClient_system_isVehicleKind && {!(_secondaryContainer in life_vehicles) && {EQUAL((locked _secondaryContainer),2)}} ) exitWith {
	[localize "STR_MISC_VehInventory","error"] call SunriseClient_gui_BottomNotification;
	"SecondaryContainer BLOCK" call SunriseClient_system_log;
	true;
};

if (life_action_inUse OR ([] call SunriseClient_system_isInputBlocked)) exitWith {
	["Дождитесь окончания действия","error"] call SunriseClient_gui_BottomNotification;
	true;
};

if ([_container] call SunriseClient_system_isContainerInUse) exitWith {
	["Уже кем-то открыто", "error"] call SunriseClient_gui_BottomNotification;
	true;
};

playSound "zipper";
life_currentContainer = _container;
life_ContainerOpened = true;
[life_currentContainer,"openedByUnit",steamid] call CBA_fnc_setVarNet;

life_currentContainer spawn {
	sleep 0.5;
	while {!isNull _this} do {
		if (isNil {_this GVAR "openedByUnit"}) exitWith {closeDialog 0};
		if (_this GVAR ["openedByUnit",""] != steamid) exitWith {[["dupe",[format["Возможный дюп OpenedByUnit - %1 но STEAMID - %2",_this GVAR ["openedByUnit",""],steamid]]],"customLog"] call SunriseClient_system_hcExec; closeDialog 0};
		uiSleep 0.03;
	};
};

{
	if ((isPlayer _x && _x != player) && (alive _x)) then {
		if ((backpackContainer player) isEqualTo (backpackContainer _x)) then {
			removeBackpack player;
			[["dupe",[format["%1 (%2) backpack dupe with %3 (%4)",GVAR_RNAME(player),steamid,GVAR_RNAME(_x),getPlayerUID _x]]],"customLog"] call SunriseClient_system_hcExec;
		};
	};
} forEach nearestObjects [player, ["O_medic_F","C_man_1","B_medic_F","I_medic_F"], 20];

false;