#include "..\..\script_macros.hpp"
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(ITEM_VALUE("gpsTracker") isEqualTo 0) exitWith {["您需要一个GPS追踪器.","false","slow"] call ANZUS_fnc_notificationSystem;};
if(!(_unit isKindOf "AllVehicles")) exitWith {["您不能在汽车上添加GPS跟踪器","false","slow"] call ANZUS_fnc_notificationSystem;};
if(player distance _unit > 7) exitWith {["你要靠近一点","false","slow"] call ANZUS_fnc_notificationSystem;};
if(!([false,"gpstracker",1] call ANZUS_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 4;
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["You are too far away!","PLAIN"];};
titleText["You have placed the GPS Tracker","PLAIN"];


[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_Traceur_GPS",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "GPS Tracker "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	while {true} do {
	if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
	_marker setMarkerPosLocal getPos _veh;
	uiSleep 2;
	};
};
