/*

	Filename: 	SunriseClient_evh_vehicleChange.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_playerUnit","_newVehicle"];

if (EQUAL(_newVehicle,_playerUnit)) then {
	life_lastVehicle removeAction AID_VEHOUT;
	life_lastVehicle removeAction AID_VEHNITRO;
	life_lastVehicle removeAction AID_VEHPARA;
	life_lastVehicle removeAllEventHandlers "Engine";
	if (isNull driver life_lastVehicle) then {life_lastVehicle engineOn false};

	if (EQUAL(life_dhl_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHDHM;
	};
	if (EQUAL(life_eln_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHELN;
	};
	if (EQUAL(life_eco_gs_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHECO_GS;
	};
	if (EQUAL(life_eco_ws_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHECO_WS;
	};
	if (EQUAL(life_bus_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHBUS;
	};
} else {
	life_lastVehicle = _newVehicle;

	if (!(isNull life_ds_box) OR life_is_arrested AND !(typeOf _newVehicle isEqualTo LIFE_SETTINGS(getText,"life_jail_truck"))) exitWith {
		["Вам нельзя садиться в транспортные средства","error"] call SunriseClient_gui_bottomNotification;
		unassignVehicle _playerUnit;
		player action ["getout",_newVehicle];
	};
	
	if ((!(EQUAL(life_inv_uraniumu,0)) OR !(EQUAL(life_inv_uraniump,0)) OR !(EQUAL(life_inv_uraniumc,0))) && {_newVehicle isKindOf "Air"}) exitWith {
		unassignVehicle _playerUnit;
		_playerUnit action ["getout",_newVehicle];
		["Крайне опасно летать с ураном в рюкзаке...", "error"] call SunriseClient_gui_BottomNotification;
	};

	if ((typeOf _newVehicle) in server_donat_vehicles && !(_newVehicle GVAR ["FiredEVH",false])) then {
		_newVehicle addEventHandler ["Fired",{_this call SunriseClient_system_onVehicleFire}];
		_newVehicle SVAR ["FiredEVH",true];
	};

	_newVehicle addEventHandler ["Engine",{_this call SunriseClient_system_onVehicleEngine}];
	
	AID_VEHOUT = _newVehicle addAction ["<img image='\sunrise_pack\icons\ui\s_icon_noweapon.paa' /> Выйти с оружием за спиной",SunriseClient_system_getOutW,"",0,false,false,"",'(objectParent _this) isEqualTo _target && {(locked _target) != 2} && {!(_this getVariable ["restrained",false])}'];

	AID_VEHNITRO = _newVehicle addAction ["<t color=""#ffba00"">Включить закись азота!</t>",SunriseClient_system_nitroUse,"",0,false,false,"",'(objectParent _this) isEqualTo _target && {driver _target isEqualTo _this} && {_target isKindOf "LandVehicle"} && {speed _target > 3} && {_target getVariable ["adacNitroUsed",-1] != -1}'];

	AID_VEHPARA = _newVehicle addAction ["<img image='\sunrise_pack\icons\para.paa' /> <t color=""#ff00f6"">Десантирование</t>",SunriseClient_system_paraGetOut,"",30,false,false,"",'_target isKindOf "Air" && {((visiblePosition _target) select 2) >= 170} && {!(_this getVariable ["restrained",false])} && {(locked _target) != 2}'];

	if (EQUAL(life_dhl_vehicle,_newVehicle)) then {
		AID_VEHDHM = _newVehicle addAction ["<img image='\sunrise_dhl\data\dhl_logo.paa' /> " + localize "STR_DHL_Menu",SunriseClient_dhl_menuOpen,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
	if (EQUAL(life_eln_vehicle,_newVehicle)) then {
		AID_VEHELN = _newVehicle addAction ["Взять работу электрика",SunriseClient_eln_orderTake,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
	if (EQUAL(life_eco_gs_vehicle,_newVehicle)) then {
		AID_VEHECO_GS = _newVehicle addAction ["Взять работу пробоотборщика грунта",SunriseClient_eco_gs_orderTake,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
	if (EQUAL(life_eco_ws_vehicle,_newVehicle)) then {
		AID_VEHECO_WS = _newVehicle addAction ["Взять работу пробоотборщика воды",SunriseClient_eco_ws_orderTake,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
	if (EQUAL(life_bus_vehicle,_newVehicle)) then {
		AID_VEHBUS = _newVehicle addAction ["Взять работу водителя",SunriseClient_bus_orderTake,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};

};

[] call SunriseClient_system_updateViewDistance;