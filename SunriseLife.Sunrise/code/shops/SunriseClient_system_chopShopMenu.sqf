/*

	Filename: 	SunriseClient_system_chopShopMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {[localize "STR_NOTF_ActionInProc","error"] call SunriseClient_gui_bottomNotification};
private _cop_min_illegal = [] call SunriseClient_system_copsForIllegal;
if ((count units life_copGroup) < _cop_min_illegal) exitWith {[format[localize "STR_ChopShop_NeedCops",_cop_min_illegal],"error"] call SunriseClient_gui_bottomNotification};

life_chopShop = _this select 3;

private _nearVehicles = nearestObjects [getMarkerPos life_chopShop,["LandVehicle","Truck","Air"],25];
if (EQUAL(_nearVehicles,[])) exitWith {[localize "STR_Shop_NoVehNear","error"] call SunriseClient_gui_bottomNotification};

disableSerialization;
if !(createDialog "SunriseDialogChopShop") exitWith {[localize "STR_Shop_ChopShopError","error"] call SunriseClient_gui_bottomNotification};

private _control = CONTROL(39400,39402);

private "_className";
{
	if (alive _x) then {
		if (EQUAL(crew _x,[]) && (_x in life_vehicles)) then {
			_var = format["lb_car_%1",_forEachIndex];
			_className = typeOf _x;
			_control lbAdd getText(configFile >> "CfgVehicles" >> _className >> "displayName");
			_control lbSetData [(lbSize _control)-1,_var];
			_control lbSetPicture [(lbSize _control)-1,(getText(configFile >> "CfgVehicles" >> _className >> "picture"))];		
			missionNamespace setVariable [_var,_x];		
		};
	};
} foreach _nearVehicles;