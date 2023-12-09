/*

	Filename: 	SunriseClient_system_vehicleShopBuy.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		

*/
#include "..\..\script_macros.hpp"
private _rent = param [0,true,[true]];
if (EQUAL((lbCurSel 2300),-1)) exitWith {[localize "STR_Shop_Veh_DidntPick","error"] call SunriseClient_gui_bottomNotification};

private _conditions = M_CONFIG(getText,"LifeCfgVehShops",life_veh_shop select 0,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {[M_CONFIG(getText,"LifeCfgVehShops",life_veh_shop select 0,"conditionsMessage"),"error"] call SunriseClient_gui_bottomNotification};

private _classValue = CONTROL_VALUE(2300);
if (EQUAL(_classValue,0)) exitWith {["Этот транспорт вам недоступен","error"] call SunriseClient_gui_bottomNotification};

private _className = CONTROL_DATA(2300);

private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price") * M_CONFIG(getNumber,"LifeCfgVehShops",(life_veh_shop select 0),"multiplier");
if (_rent) then {_basePrice = round(_basePrice * 0.5)};
	
private _box = CONTROL_VALUE(2317);
private _boxPrice = (_basePrice * LIFE_SETTINGS(getNumber,"life_boxPrice")) * _box;

if (IS_VIP) then {_basePrice = [_basePrice] call SunriseClient_system_discount};
if (IS_VIP) then {_boxPrice = [_boxPrice] call SunriseClient_system_discount};
if (IS_VIP) then {_basePrice = [_basePrice] call SunriseClient_system_discount};

_basePrice = _basePrice + _boxPrice;
if (CASH < _basePrice) exitWith {[format[localize "STR_Shop_Veh_NotEnough",[_basePrice - CASH] call SunriseClient_system_numberText],"error"] call SunriseClient_gui_bottomNotification};

private _color = CONTROL_DATA(2304);
private _material = CONTROL_DATA(2305);
private _custom_color = format["#(rgb,8,8,3)color(%1,%2,%3,1,co)",sliderPosition CONTROL(2300,2311),sliderPosition CONTROL(2300,2312),sliderPosition CONTROL(2300,2313)];

private _classParents = [(configfile >> "CfgVehicles" >> _className),true] call BIS_fnc_returnParents;
if (server_ddos_air && {"Air" in _classParents}) exitWith {["На острове наблюдаются магнитные бури. Воздушная техника временно недоступна","error"] call SunriseClient_gui_bottomNotification};

private _spawnPoints = life_veh_shop select 1;
private _spawnPoint = "";

if (_spawnPoints isEqualType []) then {
	{
		if (nearestObjects[(getMarkerPos _x),["LandVehicle","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _x};
	} foreach _spawnPoints;
} else {
	if (nearestObjects[(getMarkerPos _spawnPoints),["LandVehicle","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
};

if (EQUAL(_spawnPoint,"")) exitWith {[localize "STR_Shop_Veh_Block","error"] call SunriseClient_gui_bottomNotification};

private _sp = getMarkerPos _spawnPoint;
private _vehicle = createVehicle [_className,[0,0,999], [], 0, "NONE"];
private _vehicleLimit = call SunriseClient_system_vehicleLimit;
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos _sp;

player reveal _vehicle;

life_vehicles pushBack _vehicle;
[steamid,_vehicle,1] remoteExecCall ["SunriseServer_system_keyManagement",RSERV];

_vehicle SVAR ["vehicle_info_owners",[[steamid,GVAR_RNAME(player)]],true];
_vehicle SVAR ["insPrice",_basePrice,true];

[_vehicle] call SunriseClient_system_vehSetupRadio;
[_vehicle] call SunriseClient_system_clearVehicleAmmo;
[_vehicle] call SunriseClient_system_clearVehicleSensors;
[_vehicle] remoteExec ["SunriseClient_system_vehicleActions",-2,_vehicle];

if (_rent) then {
	["cash","take",_basePrice,"VehicleRent"] call SunriseClient_system_myCash;
	titleText[format["Вы взяли в аренду %1 за $%2",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call SunriseClient_system_numberText],"PLAIN"];
	[["vehicle",format["%1 (%2) rent %3 for $%4",GVAR_RNAME(player),steamid,getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_basePrice] call SunriseClient_system_numberText]],"customLog"] call SunriseClient_system_hcExec;
	if !(EQUAL(_color,"")) then {[_vehicle,_color,true,_custom_color] call SunriseClient_system_colorVehicle};
	if !(EQUAL(_material,"")) then {[_vehicle,_material] call SunriseClient_system_materialVehicle};
	if !(EQUAL(_box,0)) then {[_vehicle,[_box,false]] call SunriseClient_adac_InitUpgrades};
	if ([typeof _vehicle] call SunriseClient_system_havePlate) then {[_vehicle] call SunriseClient_system_setPlate};
} else {
	[_vehicle,_color,_custom_color,_material,_box,_basePrice,life_veh_shop select 0,player,_vehicleLimit] remoteExecCall ["SunriseServer_system_vehicleCreate",RSERV];
	//titleText[localize "STR_NOTF_SendingData","PLAIN"];
};

[_vehicle] spawn SunriseClient_system_vehicleAnimate;

_vehicle lock 2;
_vehicle disableTIEquipment true;
_vehicle enableRopeAttach false;
_vehicle allowDamage true;

closeDialog 0;