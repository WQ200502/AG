/*

	Filename: 	SunriseClient_system_buyLicense.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 55126),-1)) exitWith {hint localize "STR_Global_NoSelection"};
private _type = CONTROL_DATA(55126);

if (!isClass (missionConfigFile >> "LifeCfgLicenses" >> _type)) exitWith {closeDialog 0}; //Bad entry?

private _price = M_CONFIG(getNumber,"LifeCfgLicenses",_type,"price");
if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
if (CASH < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call SunriseClient_system_numberText,/*_license select 1*/"лицензии"];};

["cash","take",_price,"buyLicense"] call SunriseClient_system_myCash;
[format[localize "STR_NOTF_B_1",localize M_CONFIG(getText,"LifeCfgLicenses",_type,"displayName"),[_price] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;

life_licenses pushBackUnique _type;
[getPlayerUID player,"life_licenses",life_licenses] remoteExecCall ["SunriseServer_database_updatePartial",2];
[] spawn SunriseClient_system_licenseShop;