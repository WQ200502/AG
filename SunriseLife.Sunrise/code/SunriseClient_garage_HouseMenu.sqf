/*

	Filename: 	SunriseClient_garage_HouseMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_house",ObjNull,[ObjNull]],
	["_type","",[""]]
];

if (isNull _house) exitWith {};

private _garageSpawnPos = M_CONFIG2(getArray,"LifeCfgHousing",worldName,typeOf _house,"garageSpawnPos");
private _garageSpawnDir = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"garageSpawnDir");

if (EQUAL(_garageSpawnPos,[])) exitWith {};

life_garage_sp_name = "none";
life_garage_type = _type;
life_garage_sp = [(_house modelToWorld _garageSpawnPos),(getDir _house)-_garageSpawnDir];
life_garage_isHouse = true;

[[getPlayerUID player,_type,player],"getVehicles","SYS",false] call SunriseClient_system_hcExec;

disableSerialization;
createDialog "SunriseDialogImpound";
waitUntil {!isNull (findDisplay 2800)};
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];
ctrlShow[2803,false];
ctrlShow[2812,false];
ctrlShow[2813,false];
ctrlShow[2814,false];