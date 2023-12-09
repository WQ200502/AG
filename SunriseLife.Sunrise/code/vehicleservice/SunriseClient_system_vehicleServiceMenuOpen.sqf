/*
	
	Filename: 	SunriseClient_system_vehicleServiceMenuOpen.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (server_restartSoon) exitWith {["Надвигается буря. Все магазины закрыты.","error"] call SunriseClient_gui_bottomNotification};
disableSerialization;
createDialog "SunriseDialogVehicleService";
waitUntil {!isNull (findDisplay 8400)};

private _vehicle = param [0,ObjNull,[ObjNull]];
life_service_vehicle = _vehicle;
life_service_nitro = !(isNil {life_service_vehicle GVAR "adacNitroUsed"});
life_service_updateNitro = false;

call SunriseClient_system_serviceBoxCreate;
[typeOf _vehicle,_vehicle getVariable "Life_VEH_color"] call SunriseClient_system_serviceBoxUpdate;

CONTROL(8400,8413) ctrlSetText (["Установить нитро","Убрать нитро"] select life_service_nitro);
if (M_CONFIG(getNumber,"LifeCfgVehicles",typeof _vehicle,"nitro") isEqualTo 0) then {CONTROL(8400,8413) ctrlShow false};

private _colorCtrl = CONTROL(8400,8401);
lbClear _colorCtrl;
_colorCtrl lbAdd "Не менять";
_colorCtrl lbSetData [(lbSize _colorCtrl)-1,_vehicle getVariable ["Life_VEH_color",""]];
{
	if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _x select 0)) then {
		if ("civ" in (_x select 1)) then {
			_colorCtrl lbAdd format["%1",M_CONFIG(getText,"LifeCfgVehTextures",_x select 0,"displayName")];
			_colorCtrl lbSetData [(lbSize _colorCtrl)-1,_x select 0];
			_colorCtrl lbSetPicture [(lbSize _colorCtrl)-1,(M_CONFIG(getArray,"LifeCfgVehTextures",_x select 0,"texture")) select 0];
			if !([_x select 2] call SunriseClient_system_conditionsCheck) then {
				_colorCtrl lbSetPictureRight [(lbSize _colorCtrl)-1, "\sunrise_pack\icons\messages\error.paa"];
				_colorCtrl lbSetValue [(lbSize _colorCtrl)-1,0];
			} else {
				_colorCtrl lbSetValue [(lbSize _colorCtrl)-1,1];
			};
		};
	};
} forEach (M_CONFIG(getArray,"LifeCfgVehicles",typeof _vehicle,"textures"));

private _materialCtrl = CONTROL(8400,8402);
lbClear _materialCtrl;
_materialCtrl lbAdd "Не менять";
_materialCtrl lbSetData [(lbSize _materialCtrl)-1,""];
{
	if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _x)) then {
		_materialCtrl lbAdd format["%1",M_CONFIG(getText,"LifeCfgVehMaterials",_x,"displayName")];
		_materialCtrl lbSetData [(lbSize _materialCtrl)-1,_x];
		if !([M_CONFIG(getText,"LifeCfgVehMaterials",_x,"conditions")] call SunriseClient_system_conditionsCheck) then {
			_materialCtrl lbSetPictureRight [(lbSize _materialCtrl)-1, "\sunrise_pack\icons\messages\error.paa"];
			_materialCtrl lbSetValue [(lbSize _materialCtrl)-1,0];
		} else {
			_materialCtrl lbSetValue [(lbSize _materialCtrl)-1,1];
		};
	};
} forEach (M_CONFIG(getArray,"LifeCfgVehicles",typeof _vehicle,"materials"));

private _boxCtrl = CONTROL(8400,8403);
lbClear _boxCtrl;
_boxCtrl lbAdd "Не добавлять контейнеры";
_boxCtrl lbSetValue [(lbSize _boxCtrl)-1,0];
for "_i" from 1 to (M_CONFIG(getNumber,"LifeCfgVehicles",typeof _vehicle,"maxContainers")) do {
	_boxCtrl lbAdd format["Поставить %1 контейнеров (+%2 к багажнику)",_i,(_i * 100)];
	_boxCtrl lbSetValue [(lbSize _boxCtrl)-1,_i];
};

lbSetCurSel[8401,0];
lbSetCurSel[8402,0];
lbSetCurSel[8403,0];

ctrlEnable [8401,lbSize _colorCtrl != 1];  
ctrlEnable [8402,lbSize _materialCtrl != 1];  
ctrlEnable [8403,lbSize _boxCtrl != 1];  

(findDisplay 8400) displayAddEventHandler ["MouseButtonDown","if ((_this select 1) isEqualTo 1) then {life_rbm = true}"];
(findDisplay 8400) displayAddEventHandler ["MouseButtonUp","if ((_this select 1) isEqualTo 1) then {life_rbm = false}"];
(findDisplay 8400) displayAddEventHandler ["MouseMoving", "_this call SunriseClient_system_serviceBoxCameraRotate"];
(findDisplay 8400) displayAddEventHandler ["MouseZChanged", "_this call SunriseClient_system_serviceBoxCameraZoom"];

[{isNull (findDisplay 8400)}, {call SunriseClient_system_serviceBoxDestroy}] call CBA_fnc_waitUntilAndExecute;