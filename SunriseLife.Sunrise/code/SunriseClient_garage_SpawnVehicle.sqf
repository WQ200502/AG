/*

	Filename: 	SunriseClient_garage_SpawnVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_className","",[""]],
	["_color","",[""]],
	["_custom_color","",[""]],
	["_material","",[""]],
	["_sp",[],[[],""]],
	["_dir",0,[0]],
	["_fuel",0,[0]],
	["_vTrunk",[],[[]]],
	["_vCargo",[],[[]]],
	["_dbInfo",[],[[]]],
	["_boxes",0,[0]],
	["_nitro",false,[true]],
	["_insPrice",0,[0]]
];

if (EQUAL(_sp,"")) exitWith {};

private _vehicle = createVehicle [_className,_sp,[],0,"NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setPos _sp;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setDir _dir;
_vehicle setDamage 0;
_vehicle setFuel _fuel;

if !(EQUAL((_vTrunk select 0),[])) then {[_vehicle,"Trunk",_vTrunk] call CBA_fnc_setVarNet};
[_vehicle,"dbInfo",_dbInfo] call CBA_fnc_setVarNet;
[_vehicle,"vehicle_info_owners",[[steamid,GVAR_RNAME(player)]]] call CBA_fnc_setVarNet;
[_vehicle,"insPrice",_insPrice] call CBA_fnc_setVarNet;

player reveal _vehicle;
life_vehicles pushBack _vehicle;

[steamid,_vehicle,1] remoteExecCall ["SunriseServer_system_keyManagement",RSERV];
if !(EQUAL(_color,"")) then {[_vehicle,_color,true,_custom_color] call SunriseClient_system_colorVehicle};
if !(EQUAL(_material,"")) then {[_vehicle,_material] call SunriseClient_system_materialVehicle};
if ([typeof _vehicle] call SunriseClient_system_havePlate) then {[_vehicle] call SunriseClient_system_setPlate};

[_vehicle] call SunriseClient_system_vehSetupRadio;
[_vehicle] call SunriseClient_system_trunkCheck;
[_vehicle] call SunriseClient_system_clearVehicleAmmo;
[_vehicle] call SunriseClient_system_clearVehicleTrunk;
[_vehicle] call SunriseClient_system_clearVehicleSensors;

[_vehicle] remoteExec ["SunriseClient_system_vehicleActions",-2,_vehicle];

private ["_weaponCount","_magazineCount","_itemCount","_backpackCount","_itemData"];
{
		if (EQUAL(_x,[])) exitWith {};
		_x params ["_weapons","_magazines","_items","_backpacks"];

		clearWeaponCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;

		//Оружие в тачку
		{
			_itemData = [_x] call SunriseClient_system_itemDetails;
			if !(EQUAL(_itemData,[])) then {
				_weaponCount = (_weapons select 1) select _forEachIndex;
				_vehicle addWeaponCargoGlobal [_x,_weaponCount];
			};
		} foreach (_weapons select 0);

		//Магазины в тачку
		{
			_itemData = [_x] call SunriseClient_system_itemDetails;
			if !(EQUAL(_itemData,[])) then {
				_magazineCount = (_magazines select 1) select _forEachIndex;
				_vehicle addMagazineCargoGlobal [_x,_magazineCount];
			};
		} foreach (_magazines select 0);

		//Барахло в тачку
		{
			_itemData = [_x] call SunriseClient_system_itemDetails;
			if !(EQUAL(_itemData,[])) then {
				_itemCount = (_items select 1) select _forEachIndex;
				_vehicle addItemCargoGlobal [_x,_itemCount];
			};
		} foreach (_items select 0);

		//Рюкзаки в тачку
		{
			_itemData = [_x] call SunriseClient_system_itemDetails;
			if !(EQUAL(_itemData,[])) then {
				_backpackCount = (_backpacks select 1) select _forEachIndex;
				_vehicle addBackpackCargoGlobal [_x,_backpackCount];
			};
		} foreach (_backpacks select 0);
} foreach _vCargo;

[_vehicle] spawn SunriseClient_system_vehicleAnimate;
[_vehicle,[_boxes,_nitro]] call SunriseClient_adac_InitUpgrades;

_vehicle lock 2;
_vehicle disableTIEquipment true;
_vehicle enableRopeAttach false;
_vehicle allowDamage true;

/*_vehicle spawn {
	uiSleep 3;
	_this allowDamage true;
	uiSleep 5 * 60;
	private _nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
	if (_this in _nearVehicles]) then {[_this,nil,nil,] call SunriseClient_system_storeVehicle;};
};*/

["info","Информация","Ваша техника готова."] call SunriseClient_message;