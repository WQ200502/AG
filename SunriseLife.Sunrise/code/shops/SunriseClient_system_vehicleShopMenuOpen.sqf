/*
	
	Filename: 	SunriseClient_system_vehicleShopMenuOpen.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		

*/
#include "..\..\script_macros.hpp"
if (server_restartSoon) exitWith {["Надвигается буря. Все магазины закрыты.","error"] call SunriseClient_gui_bottomNotification};
	
params [
	["_shop","",[""]],	
	["_spawnPoints","",["",[]]],
	["_shopFlag","",[""]],
	["_shopTitle","",[""]],
	["_disableBuy",false,[true]],
	["_amount",-1,[-1]]
];

if !(isClass(missionConfigFile >> "LifeCfgVehShops" >> _shop)) exitWith {};

private _conditions = M_CONFIG(getText,"LifeCfgVehShops",_shop,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgVehShops",_shop,"conditionsMessage")];
};

disableSerialization;
createDialog "SunriseDialogVehicleShopV2";
waitUntil {!isNull (findDisplay 2300)};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy];
private _control = CONTROL(2300,2300);
lbClear _control;

ctrlSetText [2301,_shopTitle];
ctrlSetText [601,format["Наличность: $%1       ",[CASH] call SunriseClient_system_numberText]];

if (_disableBuy) then {ctrlEnable [2309,false]};
if (life_copDuty) then {ctrlEnable [2310,false]};

//disable lists
//ctrlEnable [2311,false];
ctrlEnable [2317,false];

private _multiplier = M_CONFIG(getNumber,"LifeCfgVehShops",_shop,"multiplier");
private ["_vehicleInfo","_basePrice"];
{	
	if (isClass (missionConfigFile >> "LifeCfgVehicles" >> _x select 0)) then {
		_basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_x select 0,"price");
		if (_basePrice > 0) then {
			_vehicleInfo = [_x select 0] call SunriseClient_system_fetchVehInfo;
			_control lbAdd format["%1",(_vehicleInfo select 3)];
			_control lbSetData [(lbSize _control)-1,_x select 0];
			_basePrice = _basePrice * _multiplier;
			if (FETCH_CONST(life_donator) > 0) then {_basePrice = [_basePrice] call SunriseClient_system_discount};
			_control lbSetTextRight [(lbSize _control)-1, format["  $%1",[_basePrice] call SunriseClient_system_numberText]];
			if ([_x select 1] call SunriseClient_system_conditionsCheck) then {								
				_control lbSetValue [(lbSize _control)-1,1];
			} else {
				_control lbSetPictureRight [(lbSize _control)-1, "\sunrise_pack\icons\messages\error.paa"];
				_control lbSetValue [(lbSize _control)-1,0];
			};
		};
	};
} foreach (M_CONFIG(getArray,"LifeCfgVehShops",_shop,"vehicles"));

call SunriseClient_system_shopBoxCreate;

(findDisplay 2300) displayAddEventHandler ["MouseButtonDown","if ((_this select 1) isEqualTo 1) then {life_rbm = true}"];
(findDisplay 2300) displayAddEventHandler ["MouseButtonUp","if ((_this select 1) isEqualTo 1) then {life_rbm = false}"];
(findDisplay 2300) displayAddEventHandler ["MouseMoving", "_this call SunriseClient_system_shopBoxCameraRotate"];
(findDisplay 2300) displayAddEventHandler ["MouseZChanged", "_this call SunriseClient_system_shopBoxCameraZoom"];

_control lbSetCurSel 0;

[{isNull (findDisplay 2300)}, {call SunriseClient_system_shopBoxDestroy}] call CBA_fnc_waitUntilAndExecute;