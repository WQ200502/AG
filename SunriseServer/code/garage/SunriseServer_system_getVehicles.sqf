/*

	Filename:   SunriseServer_system_getVehicles.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
if !(params [
	["_pid","",[""]],
	["_type","",[""]],
	["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|getVehicles| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _query = switch (_type) do {
	case "Car": {format ["getVehicles:%1:%2",_pid,_type]};
	case "Air": {format ["getVehicles:%1:%2",_pid,_type]};
	case "Ship": {format ["getVehicles:%1:%2",_pid,_type]};
	case "Transfer": {format ["getVehiclesTransfer:%1:%2",_pid,worldName]};
	case "Parking": {format ["getVehiclesParking:%1",_pid]};
	default {""};
};
private _queryResult = _query call SunriseServer_database_selectFull;
switch (_type) do { 
	case "Parking" : {[_queryResult] remoteExec ["SunriseClient_parking_MenuRet",_unit]}; 
	case "Transfer" : {[_queryResult] remoteExec ["SunriseClient_system_vehTransferMenu",_unit]}; 
	default {[_queryResult] remoteExec ["SunriseClient_garage_Menu",_unit]}; 
};