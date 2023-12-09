/*
	
	Filename: 	SunriseClient_factory_vehicleProcess.sqf
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
if (_resource isEqualTo "") exitWith {hint "Ошибка в действии, обратитесь к администрации"};
if (_vehicle getVariable ["factory_use",false]) exitWith {["error","",format["Это транспортное средство уже на переработке"]] call SunriseClient_message};
if ([_vehicle] call SunriseClient_system_isTrunkInUse) exitWith {["error","",format[localize "STR_MISC_VehInvUse"]] call SunriseClient_message};

private _resourceProcessed = getText(missionConfigFile >> "LifeCfgFactoriesProcessing" >> _resource >> "processedItem");
if (_resourceProcessed isEqualTo "") exitWith {hint "Ошибка в конфиге перерабатываемых, обратитесь к администрации"};

(_vehicle getVariable ["Trunk",[[],0]]) params ["_items","_space"];
private _resource_index = [_resource,_items] call SunriseClient_system_index;
if (_resource_index isEqualTo -1) exitWith {["error","",format["В технике нет перерабатываемого ресурса"]] call SunriseClient_message};

disableSerialization;
["life_progress","PLAIN"] call SunriseClient_gui_CreateRscLayer;
private _ui = uiNamespace getVariable "life_progress"; 
private _p_bar = _ui displayCtrl 38201; 
private _p_text = _ui displayCtrl 38202; 
_p_text ctrlSetStructuredText parseText "<t size='1' align='center' shadow='2'>Ждем переработки ресурсов из техники...</t>";	

private _sleep_time = 2 * perk_experienced;

[_resource,_resourceProcessed,_vehicle,_object,player,perk_expert,_sleep_time] remoteExec ["SunriseServer_factory_vehicleProcess",2];

waitUntil {uiSleep 0.5; !(_vehicle getVariable ["factory_use",false])};

["life_progress"] call SunriseClient_gui_DestroyRscLayer;