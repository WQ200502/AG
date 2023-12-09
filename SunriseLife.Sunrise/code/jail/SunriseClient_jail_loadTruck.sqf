/*

	Filename: 	SunriseClient_jail_loadTruck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_vehicle", objNull, [objNull]],
	["_object", objNull, [objNull]]
];

closeDialog 0;
private _p_uid = getPlayerUID player;
private _v_act = _vehicle getVariable ["factory_use",""];

if (isNull _vehicle) exitWith {};
if !((_v_act isEqualTo "") OR (_v_act isEqualTo _p_uid AND !life_fct_vehAct)) exitWith {hint "На одной машине можно начать погрузку только один раз"};

_vehicle setVariable ["factory_use",_p_uid,true];
life_fct_vehAct = true;
disableSerialization;
["life_progress","PLAIN"] call SunriseClient_gui_CreateRscLayer;
private _ui = uiNamespace getVariable "life_progress"; 
private _p_bar = _ui displayCtrl 38201; 
private _p_text = _ui displayCtrl 38202; 
_p_text ctrlSetStructuredText parseText "<t size='1' align='center' shadow='2'>Загружаем технику</t>";	

private _added = _vehicle getVariable ["JailTrunk",0];
while {true} do {
	if (!alive _vehicle OR isNull _vehicle) exitWith {};
	if (_vehicle distance _object > 25) exitWith {hint "Техника находится не на точке погрузки, подъедьте ближе"};


	if (_added > 5) exitWith {titleText["Техника загружена","PLAIN"];};
	_added = _added + 1;
	
	_p_bar progressSetPosition (_added/5);

	[_vehicle,"JailTrunk",_added] call CBA_fnc_setVarNet;

	uiSleep 2;
};
["life_progress"] call SunriseClient_gui_DestroyRscLayer;
[_vehicle,"factory_use"] call SunriseClient_system_clearGlobalVar;
life_fct_vehAct = false;