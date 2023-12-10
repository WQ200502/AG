/*

	Filename:   SunriseServer_system_vehicleCreate.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
params [
	["_vehicle",[objNull],[objNull]],
	["_color","default",[""]],
	["_custom_color","",[""]],
	["_material","default",[""]],
	["_box",0,[0]],
	["_basePrice",0,[0]],
	["_shop","",[""]],
	["_unit",objNull,[objNull]],
	["_vehicleLimit",0,[0]]
];
private _uid = getPlayerUID _unit;
//Error checks
if (_uid isEqualTo "" || isNull _vehicle) exitWith {
	["error",format ["|vehicleCreate| PARAMS=%1|%2",_this,_uid]] call SunriseServer_system_customLog;
};
if (!alive _vehicle) exitWith {};
if (format["getPlayerVehicleCount:%1",_uid] call SunriseServer_database_selectSingleField >= _vehicleLimit) exitWith {deleteVehicle _vehicle;[false] remoteExecCall ["SunriseClient_system_vehicleShopBuyDone",_unit]};
private _type = switch (true) do {
	case (_vehicle isKindOf "Car"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};
	case (_vehicle isKindOf "Ship"): {"Ship"};
};

private _numToLetter = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"];
private _plate = [selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter] joinString "";
private _plateCheckTries = 0;
while {format["isPlateExists:%1" + _plate] call SunriseServer_database_selectSingleField} do {
	private _plate = [selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter,selectRandom _numToLetter] joinString "";
	_plateCheckTries = _plateCheckTries + 1;
	format["Plate %1 is not unique. Try n. %2",_plate,_plateCheckTries] call SunriseServer_system_log;
	if (_plateCheckTries > 9) exitWith {};
};
if (_plateCheckTries > 9) exitWith {deleteVehicle _vehicle;[false] remoteExecCall ["SunriseClient_system_vehicleShopBuyDone",_unit]};

if (_color isEqualTo "") then {_color = "default"};
if (_material isEqualTo "") then {_material = "default"};

private _id = format ["insertVehicle:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11",typeOf _vehicle,getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),_type,_uid,_plate,_color,_custom_color,_material,_box,worldName,_basePrice] call SunriseServer_database_insertSingle;
_vehicle setVariable ["dbInfo",[_id,_plate],true];

[false,_shop,1] call SunriseServer_system_handleShops;

[true,_vehicle,_plate,_basePrice,_color,_custom_color,_material,_box] remoteExecCall ["SunriseClient_system_vehicleShopBuyDone",_unit];