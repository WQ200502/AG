/*

	Filename: 	SunriseClient_eln_returnCar.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (isNull life_jail_truck) exitWith {["Машина потеряна или уничтожена", "error"] call SunriseClient_gui_bottomNotification};
private _spawnPoint = LIFE_SETTINGS(getText,"life_eln_office_car");
private _spawnPointPos = getMarkerPos _spawnPoint;
private _price = LIFE_SETTINGS(getNumber,"life_eln_car_price");

if (life_jail_truck distance _spawnPointPos > 25) exitWith {["Машина должна находиться рядом с офисом электрика", "error"] call SunriseClient_gui_bottomNotification};
deleteVehicle life_jail_truck;
["atm","add",_price] call SunriseClient_system_myCash;
[format["Вам вернули $%1 за возврат техники",_price], "done"] call SunriseClient_gui_bottomNotification;