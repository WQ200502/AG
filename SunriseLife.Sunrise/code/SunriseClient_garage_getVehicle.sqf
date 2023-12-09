/*

	Filename: 	SunriseClient_garage_getVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 2802),-1)) exitWith {["STR_Global_NoSelection","error"] call SunriseClient_gui_bottomNotification};
private _dataArr = CONTROL_DATA(2802);
private _dataArr = call compile format["%1",_dataArr];
private _vehicle = _dataArr select 0;
private _vid = CONTROL_VALUE(2802);

if (isNil "_vehicle") exitWith {["STR_Garage_Selection_Error","error"] call SunriseClient_gui_bottomNotification};

if (_vehicle in (LIFE_SETTINGS(getArray,"life_vShop_trucks")) && {life_garage_isHouse}) exitWith {["Грузовой транспорт нельзя достать из частного гаража.","error"] call SunriseClient_gui_bottomNotification};
private _classParents = [(configfile >> "CfgVehicles" >> _vehicle),true] call BIS_fnc_returnParents;
if (server_ddos_air && {"Air" in _classParents}) exitWith {["На острове наблюдаются магнитные бури. Воздушная техника временно недоступна","error"] call SunriseClient_gui_bottomNotification};

private _basePrice = _dataArr select 5;
private _retrievePrice = if (EQUAL(_basePrice,0) OR life_copDuty OR life_medDuty OR life_garage_isHouse) then {500} else {round (_basePrice * 0.02)};

if (BANK < _retrievePrice) exitWith {[format[(localize "STR_Garage_CashError"),[_retrievePrice] call SunriseClient_system_numberText],"error"] call SunriseClient_gui_bottomNotification};

if (life_garage_sp isEqualType []) then {
	[[_vid,steamid,life_garage_sp select 0,player,_retrievePrice,life_garage_sp select 1,life_garage_sp_name],"spawnVehicle","SYS",false] call SunriseClient_system_hcExec;
} else {
	[[_vid,steamid,(getMarkerPos life_garage_sp),player,_retrievePrice,markerDir life_garage_sp,life_garage_sp_name],"spawnVehicle","SYS",false] call SunriseClient_system_hcExec;
};

closeDialog 0;
["info","",format[localize "STR_Garage_SpawningVeh"]] call SunriseClient_message;
["atm","take",_retrievePrice,"retrieveVehicle"] call SunriseClient_system_myCash;