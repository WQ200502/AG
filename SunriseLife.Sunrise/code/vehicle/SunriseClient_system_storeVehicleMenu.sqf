/*
	
	Filename: 	SunriseClient_system_storeVehicleMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _ishouse = param [0,false,[false,objNull]];
private _fromAction = param [3,["",""],[]];
private _point = if (typeName _ishouse isEqualTo "OBJECT") then {_ishouse} else {cursorObject};

private _nearVehicles = nearestObjects[getPosATL _point,["LandVehicle","Air","Ship"],25];
if (_nearVehicles isEqualTo []) exitWith {["Поблизости нет техники. Подъедьте поближе!","error"] call SunriseClient_gui_bottomNotification};

disableSerialization;
if !(createDialog "SunriseDialogVehicleSelect") exitWith {};

_fromAction params [
	["_sp","",[""]],
	["_typeV","",[""]]
];

private _control = (findDisplay 58000) displayCtrl 5802;
private _button = (findDisplay 58000) displayCtrl 5804;
_button ctrlSetText "Убрать машину";
_button buttonSetAction format ["[call compile lbData[5802,lbCurSel (5802)],'%1','%2',%3] call SunriseClient_system_storeVehicle",_sp,_typeV,_point isEqualTo cursorObject];
lbclear _control;
{	
	_vehData = _x getVariable ["vehicle_info_owners",[]];
	if !(_vehData isEqualTo []) then {
		if (getPlayerUID player isEqualTo _vehData#0#0) then {
			_var = format["lb_car_%1",_forEachIndex];
			_control lbAdd format["%1 (#%2)",getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),_x getVariable ["dbInfo",["",""]] select 1];
			_control lbSetData [(lbSize _control)-1,_var];
			_control lbSetPicture [(lbSize _control)-1,getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture")];
			missionNamespace setVariable [_var,_x];
		};
	};				
} foreach _nearVehicles;
_control lbSetCurSel 0;