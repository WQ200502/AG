/*

	Filename:	SunriseClient_carsharing_order.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

if !("driver" in life_licenses) exitWith {["error","","У вас нет водительских прав"] call SunriseClient_message};
if (life_is_arrested) exitWith {["error","","Вы в тюрьме"] call SunriseClient_message};
if (life_cs_renting) exitWith {["error","","Вы уже арендуете автомобиль"] call SunriseClient_message};
if (time - life_cs_timer < 300) exitWith {["error","","你最近租了一辆车，等等"] call SunriseClient_message};
life_cs_timer = time;

private _pos_selected = life_cs_posSelected;
if (_pos_selected isEqualTo [0,0]) exitWith {["error","","Вы не выбрали автомобиль"] call SunriseClient_message};
private _vehicle = createVehicle [LIFE_SETTINGS(getText,"life_cs_car"),_pos_selected, [], 0, "NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
player reveal _vehicle;

private _nearRoads = _vehicle nearRoads 15; 
if (count _nearRoads > 0) then 
{ 
	_road = _nearRoads select 0; 
	_roadConnectedTo = roadsConnectedTo _road; 
	_connectedRoad = _roadConnectedTo select 0; 
	_v_dir = _road getDir _connectedRoad; 
	_vehicle setDir _v_dir;
};

life_vehicles pushBack _vehicle;
[steamid,_vehicle,1] remoteExecCall ["SunriseServer_system_keyManagement",RSERV];

_vehicle SVAR ["vehicle_info_owners",[[steamid,GVAR_RNAME(player)]],true];
[_vehicle,"vehicle_limits","carsharing"] call CBA_fnc_setVarNet;

[_vehicle] call SunriseClient_system_vehSetupRadio;
[_vehicle] call SunriseClient_system_clearVehicleAmmo;
[_vehicle] call SunriseClient_system_clearVehicleSensors;
[_vehicle] remoteExec ["SunriseClient_system_vehicleActions",-2,_vehicle];
_basePrice = LIFE_SETTINGS(getNumber,"life_cs_price") * 10;
["atm","take",_basePrice,"VehicleRent"] call SunriseClient_system_myCash;
["done","",format["Вы взяли в аренду %1 за $%2",getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName"),[_basePrice] call SunriseClient_system_numberText]] call SunriseClient_message;
[["vehicle",format["%1 (%2) started rent %3 for $%4",GVAR_RNAME(player),steamid,typeOf _vehicle,[_basePrice] call SunriseClient_system_numberText]],"customLog"] call SunriseClient_system_hcExec;
[_vehicle] spawn SunriseClient_system_vehicleAnimate;
[_vehicle,[]] call SunriseClient_adac_InitUpgrades;

_vehicle lock 2;
_vehicle disableTIEquipment true;
_vehicle enableRopeAttach false;
_vehicle allowDamage true;

life_cs_start = time;
life_cs_vehicle = _vehicle;
life_cs_renting = true;

private _positions_array = profileNamespace getVariable ["cs_cars",[]];
profileNamespace setVariable ["cs_cars",_positions_array - [life_cs_posSelected]];

[] call SunriseClient_carsharing_startTimer;

private _taskName = format["BUS_TSPW_%1",steamid];
[_taskName,player,["Садитесь в машину, пока вы не в машине, с вас будет сниматься лишь половина стоимости","Сесть в машину","walk"],life_cs_vehicle,"ASSIGNED",nil,true,false,"",true] call BIS_fnc_setTask;

"Carsharing - Spawn Car Task waiting..." call SunriseClient_system_log;

waitUntil {uiSleep 1; (objectParent player isEqualTo life_cs_vehicle) OR !alive life_cs_vehicle OR isNull life_cs_vehicle};

switch (true) do {
	case (!alive life_cs_vehicle or isNull life_cs_vehicle) : {[_taskName,"FAILED",true] spawn BIS_fnc_taskSetState};
	case (objectParent player isEqualTo life_cs_vehicle) : {[_taskName,"SUCCEEDED",true] spawn BIS_fnc_taskSetState};
};

uiSleep 1;

[_taskName] call BIS_fnc_deleteTask;