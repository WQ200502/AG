/*

	Filename: 	SunriseClient_system_vehicleShopBoxLBChange.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		
	
*/
#include "..\..\script_macros.hpp"
private _className = CONTROL_DATA(2300);
private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price") * M_CONFIG(getNumber,"LifeCfgVehShops",(life_veh_shop select 0),"multiplier");
//
private _box = CONTROL_VALUE(2317);
private _boxPrice = (_basePrice * LIFE_SETTINGS(getNumber,"life_boxPrice")) * _box;

if (FETCH_CONST(life_donator) > 0) then {_boxPrice = [_boxPrice] call SunriseClient_system_discount};
if (FETCH_CONST(life_donator) > 0) then {_basePrice = [_basePrice] call SunriseClient_system_discount};

_basePrice = _basePrice + _boxPrice;
/*
(CONTROL(2300,2304)) ctrlSetStructuredText parseText format["<t size = '1.15' font='PuristaMedium' align='center' color='#00ff00'>+$%1 за контейнеры</t>",[_boxPrice] call SunriseClient_system_numberText];
(CONTROL(2300,2309)) ctrlSetStructuredText parseText format["<t size = '1.15' font='PuristaMedium' align='center' color='#00ff00'>$%1</t>",[_basePrice] call SunriseClient_system_numberText];
(CONTROL(2300,2310)) ctrlSetStructuredText parseText format["<t size = '1.15' font='PuristaMedium' align='center' color='#00ff00'>$%1</t>",[round(_basePrice * 0.2)] call SunriseClient_system_numberText];*/