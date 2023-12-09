/*

	Filename: 	SunriseClient_system_vehicleActions.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

if !(isNil "AID_SEP") then {_vehicle removeAction AID_SEP;};
AID_SEP = _vehicle addAction ["Посмотреть номер",SunriseClient_system_seePlate,"",0,false,false,"",'isNull objectParent _this'];

waitUntil {!isNil "life_coplevel"};
if (life_coplevel > 0 OR life_medlevel > 0) then {
	if !(isNil "AID_CED") then {_vehicle removeAction AID_CED;};
	if !(isNil "AID_CEP") then {_vehicle removeAction AID_CEP;};
	if !(isNil "AID_CEX") then {_vehicle removeAction AID_CEX;};

	AID_CED = _vehicle addAction [localize "STR_pAct_DriverSeat",SunriseClient_system_copEnter,"driver",200,false,false,"",' isNull objectParent _this && (locked _target) != 0  && !life_inwarzone && (life_copDuty OR life_medDuty)', 4];
	AID_CEP = _vehicle addAction [localize "STR_pAct_PassengerSeat",SunriseClient_system_copEnter,"passenger",100,false,false,"",' isNull objectParent _this && (locked _target) != 0  && !life_inwarzone && (life_copDuty OR life_medDuty)', 4];
	AID_CEX = _vehicle addAction [localize "STR_pAct_GoOut",SunriseClient_system_copEnter,"exit",100,false,false,"",' !isNull objectParent _this && (locked _target) == 2 && !life_inwarzone && (life_copDuty OR life_medDuty)'];
}