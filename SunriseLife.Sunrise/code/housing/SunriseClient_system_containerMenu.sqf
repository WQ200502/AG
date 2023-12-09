/*
	
	Filename: 	SunriseClient_system_containerMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (dialog) exitWith {};
life_house_box = cursorObject;
if (isNull life_house_box OR (typeOf life_house_box != "Land_LuggageHeap_03_F")) exitWith {}; //Either a null or invalid vehicle type.
if (life_action_inUse OR life_is_processing) exitWith {["error","",format["Вы чем-то заняты"]] call SunriseClient_message};
if ([life_house_box] call SunriseClient_system_isTrunkInUse) exitWith {[localize "STR_MISC_VehInvUse","error"] call SunriseClient_gui_bottomNotification};

private _house = life_house_box GVAR ["house_box_inHouse",objNull];
if (isNull _house OR isNil {(_house GVAR "house_owner")}) exitWith {[localize "STR_House_Raid_NoOwner","error"] call SunriseClient_gui_bottomNotification};

private _uid = (_house GVAR "house_owner") select 0;
if !([_uid] call SunriseClient_system_isUIDActive) exitWith {[localize "STR_House_OwnerOffline","error"] call SunriseClient_gui_bottomNotification};

private _house_box_slots = life_house_box GVAR ["house_box_slots",0];
if (EQUAL(_house_box_slots,0)) exitWith {["У вас не добавлены слоты для хранения вещей","error"] call SunriseClient_gui_bottomNotification};
//////////////////////////////
private _connected = call SunriseClient_system_checkConnection;
if !(_connected) exitWith {["Кажется вы потеряли соединение с сервером.","error"] call SunriseClient_gui_bottomNotification};
//////////////////////////////
if !(createDialog "SunriseDialogContainer") exitWith {[localize "STR_MISC_DialogError","error"] call SunriseClient_gui_bottomNotification;}; //Couldn't create the menu?

[life_house_box,"trunk_inUseBy",steamid] call CBA_fnc_setVarNet;
player say3D "house_cont";

private _title = CONTROL(4100,4101);
private _houseEdit = CONTROL(4100,4105);
private _playerEdit = CONTROL(4100,4106);
private _filters = CONTROL(4100,4107);

private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");
private _houseName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _house,"displayName");

_title ctrlSetText format[(localize "STR_MISC_HouseStorage")+ " - %1 - Слоты: %2/%3",_houseName,_house_box_slots,_numberCrates];

_filters lbAdd "Все снаряжение";
_filters lbAdd "Амуниция";
_filters lbAdd "Оружие";
_filters lbAdd "Боеприпасы";
_filters lbAdd "Обвес";
_filters lbAdd "Предметы";

_filters lbSetCurSel 0;

life_veh_trunk_sync = +((life_house_box GVAR ["house_box_inventory",[[],0]]) select 0);


[{!(_this GVAR ["trunk_inUseBy",""] isEqualTo steamid) OR (isNull (findDisplay 4100))}, {
	if !(_this GVAR ["trunk_inUseBy",""] isEqualTo steamid) exitWith {
		[_this,"trunk_inUseBy"] call SunriseClient_system_clearGlobalVar;
		["Инвентарь уже используется другим игроком","error"] call SunriseClient_gui_bottomNotification;
		(findDisplay 4100) closeDisplay 0;
	};
	if (isNull (findDisplay 4100)) exitWith {
		[_this,"trunk_inUseBy"] call SunriseClient_system_clearGlobalVar;
		private _data = (_this GVAR ["house_box_inventory",[[],0]]) select 0;
		if !(EQUAL(life_veh_trunk_sync,_data)) then {
			life_veh_trunk_sync = [];

			[[_this,player],"updateHouseContainers"] call SunriseClient_system_hcExec;

			[] call SunriseClient_system_saveGear;
		};
	};
}, life_house_box] call CBA_fnc_waitUntilAndExecute;