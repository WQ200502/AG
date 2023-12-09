/*
	
	Filename: 	SunriseClient_factory_vehicleLoad.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team	
	Steam:		Sunrise Team

	
*/
params [
	["_resource", "", [""]],
	["_vehicle", objNull, [objNull]],
	["_object", objNull, [objNull]]
];

closeDialog 0;

if (isNull _vehicle) exitWith {};
if (_resource isEqualTo "") exitWith {["error","","Ошибка в действии, обратитесь к администрации"] call SunriseClient_message};
if (_vehicle getVariable ["factory_use",false]) exitWith {["error","","Это транспортное средство уже на погрузке"] call SunriseClient_message};
if ([_vehicle] call SunriseClient_system_isTrunkInUse) exitWith {["error","",format[localize "STR_MISC_VehInvUse"]] call SunriseClient_message};
if (_resource isEqualTo "oil" AND typeOf _vehicle != "av_tanker") exitWith {["error","","Нефть можно загружать только на танкер!"] call SunriseClient_message};
if (_resource isEqualTo "wood" AND _vehicle isKindOf "Air") exitWith {["error","","Дерево можно загружать только на наземную технику!"] call SunriseClient_message};

[_vehicle] call SunriseClient_system_vehicleWeight params ["_weight","_weightUsed"];
private _adding_max = floor ((_weight - _weightUsed) / getNumber(missionConfigFile >> "LifeCfgVirtualItems" >> _resource >> "weight"));
if (_adding_max < 1) exitWith {["error","",format["Техника заполнена!"]] call SunriseClient_message};

disableSerialization;
["life_progress","PLAIN"] call SunriseClient_gui_CreateRscLayer;
private _ui = uiNamespace getVariable "life_progress"; 
private _p_bar = _ui displayCtrl 38201; 
private _p_text = _ui displayCtrl 38202; 
_p_text ctrlSetStructuredText parseText "<t size='1' align='center' shadow='2'>Ждем погрузки ресурсов в технику...</t>";	

private _sleep_time = 2 * perk_dogsbody;

[_resource,_vehicle,_object,player,_sleep_time] remoteExec ["SunriseServer_factory_vehicleLoad",2];

waitUntil {uiSleep 0.5; !(_vehicle getVariable ["factory_use",false])};

life_job_startTime = time;
["life_progress"] call SunriseClient_gui_DestroyRscLayer;