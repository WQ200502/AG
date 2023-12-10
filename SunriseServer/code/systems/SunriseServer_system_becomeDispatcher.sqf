/*

	Filename: 	SunriseServer_system_becomeDispatcher.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {diag_log "dispatcher is null"};

if (isNull life_cop_disp) then {
	life_cop_disp = _unit;
	[format["Диспетчер (%1) заступил на дежурство", life_cop_disp getVariable ["realname",""]],"police"] remoteExecCall ["SunriseClient_system_hint",life_copGroup];
} else {
	if (_unit isEqualTo life_cop_disp) then {
		[format["Диспетчер (%1) ушел с дежурства", life_cop_disp getVariable ["realname",""]],"police"] remoteExecCall ["SunriseClient_system_hint",life_copGroup];
		life_cop_disp = objNull;
	} else {
		[format["Диспетчер может быть только один, в данный момент это - %1", life_cop_disp getVariable ["realname",""]],"police"] remoteExecCall ["SunriseClient_system_hint",_unit];
	};
};
publicVariable "life_cop_disp";