/*

	Filename: 	SunriseServer_system_addWarPoint.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_pointX",0,[0]],
	["_pointY",0,[0]],
	["_radius",0,[0]],
	["_pointName","",[""]],
	["_unit",objNull,[objNull]]
];
if (count server_warzones > 2) exitWith {["Нельзя поставить больше 3-х военных положений!","error"] remoteExecCall ["SunriseClient_gui_BottomNotification",_unit]};
private _unitName = _unit getVariable["realname",name _unit];

//Stop bad data being passed.
if (_pointX isEqualTo 0 || _pointY isEqualTo 0 || _radius isEqualTo 0 || _pointName isEqualTo "" || _unit isEqualTo objNull) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptName,_this]] call SunriseServer_system_customLog};

private _pointID = round(random(1000));
server_warzones pushBack [_pointID,_radius,_pointName,_unitName];
publicVariable "server_warzones";


private _warn = createMarker [format ["war_zone_%1",_pointID],[_pointX,_pointY]];
_warn setMarkerShape "ELLIPSE";
_warn setMarkerSize [_radius,_radius];
_warn setMarkerColor "ColorEAST";
_warn setMarkerBrush "Solid";
_warn setMarkerAlpha 0.5;

private _marker = createMarker [format ["war_marker_%1",_pointID],[_pointX,_pointY]];
_marker setMarkerColor "ColorWhite";
_marker setMarkerTypeLocal "KIA";
_marker setMarkerText "Не входить! Ведётся военное положение!";


["add",_pointName,_unitName] remoteExecCall ["SunriseClient_martiallaw_updateWarPoints",-2];