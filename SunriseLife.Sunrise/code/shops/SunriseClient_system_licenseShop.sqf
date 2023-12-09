/*
	
	Filename: 	SunriseClient_system_licenseShop.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5546)) then {
	createDialog "SunriseDialogLicenseShop";
	waitUntil {!isNull (findDisplay 5546)};
};

private _listbox = CONTROL(5546,55126);
private _mylic = CONTROL(5546,55131);
lbClear _listbox;
lbClear _mylic;

ctrlSetText [601,format["Наличность: $%1       ",[CASH] call SunriseClient_system_numberText]];

private "_price";
{
	if !(configName _X in life_licenses) then {
		_price = getNumber(_x >> "price");
		if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
		_listbox lbAdd format["%1 ($%2)",localize (getText(_x >> "displayName")),[_price] call SunriseClient_system_numberText];
		_listbox lbSetData [(lbSize _listbox) - 1,configName _x];
	} else {
		_mylic lbAdd format["%1",localize (getText(_x >> "displayName"))];
		_mylic lbSetData [(lbSize _mylic) - 1,configName _x];
	};
} foreach ("(getNumber(_x >> 'buyable') isEqualTo 1)" configClasses (missionConfigFile >> "LifeCfgLicenses"));