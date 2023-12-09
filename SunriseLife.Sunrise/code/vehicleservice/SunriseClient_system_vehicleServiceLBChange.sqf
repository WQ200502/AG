/*
	
	Filename: 	SunriseClient_system_vehicleServiceLBChange.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _box = CONTROL_VALUE(8403);
private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf life_service_vehicle,"price");
private _boxPrice = (_basePrice * LIFE_SETTINGS(getNumber,"life_boxPrice")) * _box;
private _servicePrice = (_basePrice * LIFE_SETTINGS(getNumber,"life_servicePrice"));
private _nitroPrice = (_basePrice * LIFE_SETTINGS(getNumber,"life_nitroPrice"));

if (FETCH_CONST(life_donator) > 0) then {_boxPrice = [_boxPrice] call SunriseClient_system_discount};
if (FETCH_CONST(life_donator) > 0) then {_servicePrice = [_servicePrice] call SunriseClient_system_discount};
if (FETCH_CONST(life_donator) > 0) then {_nitroPrice = [_nitroPrice] call SunriseClient_system_discount};

private _text = "";
private _total = 0;
if (lbCurSel 8401 > 0 OR lbCurSel 8402 > 0) then {_text = _text + format["$%1 за покраску<br/>",[_servicePrice] call SunriseClient_system_numberText]; _total = _total + _servicePrice};
if (lbCurSel 8403 > 0) then {_text = _text + format["$%1 за контейнеры<br/>",[_boxPrice] call SunriseClient_system_numberText]; _total = _total + _boxPrice};
if (life_service_updateNitro) then {_text = _text + format["$%1 за нитро<br/>",[_nitroPrice] call SunriseClient_system_numberText]; _total = _total + _nitroPrice};
(CONTROL(8400,8410)) ctrlSetStructuredText parseText format["<t size = '0.85' font='PuristaMedium' color='#00ff00'>%1<t size = '1' font='PuristaBold' color='#00ff00'>Итого: $%2</t>", _text, [_total] call SunriseClient_system_numberText];