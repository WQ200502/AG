#include "..\..\script_macros.hpp"
/*
 Created by repentz
*/

private ["_type", "_sp", "_inProgress", "_endPoint", "_distance"];

_endPoint = selectRandom ["emstransport1","emstransport2","emstransport3","emstransport4"];

if(player getVariable ["taskStartMedic",true]) exitWith {["您已经开始执行任务",false,"slow"] call anzus_fnc_notificationSystem;};
if !(playerSide isEqualTo independent) exitWith {["你不是医护!",false,"slow"] call anzus_fnc_notificationSystem;};

player setVariable ["taskStartMedic", true, true];
playSound "testcorrect";

["您已经开始了运输任务，您需要将一些补给品带到地图上所选的地点，请这样做以获得奖励.",false,"slow"] call anzus_fnc_notificationSystem;
//{
		deleteMarkerLocal "EndPointM";
		deleteMarkerLocal "EndPointT";
		_marker = createMarkerLocal ["EndPointM", getMarkerPos _endPoint];
		"EndPointM" setMarkerColorLocal "ColorGreen";
		"EndPointM" setMarkerTypeLocal "Empty";
		"EndPointM" setMarkerShapeLocal "ELLIPSE";
		"EndPointM" setMarkerSizeLocal [30,30];
		_markerText = createMarkerLocal ["EndPointT", getMarkerPos _endPoint];
		"EndPointT" setMarkerColorLocal "Default";
		"EndPointT" setMarkerTextLocal "Deliver Organs Here";
		"EndPointT" setMarkerTypeLocal "RMarkers_Medical_Heart";
//} forEach (units group player);
_distance = player distance (getMarkerPos _endPoint);
_distance = floor(_distance);

waitUntil {
	_distance = player distance (getMarkerPos _endPoint);
	_distance = floor(_distance);
	_distance < 30;
};
life_collectMoneys = player addaction ["完成任务",anzus_fnc_MedMissionFinish];
["您已经到达目的任务完成.",false,"slow"] call anzus_fnc_notificationSystem;
deleteMarkerLocal "EndPointM";
deleteMarkerLocal "EndPointT";
