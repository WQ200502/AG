/*

	Filename: 	SunriseServer_system_serverBank.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_unit",ObjNull,[ObjNull]],
	["_mode","",[""]],
	["_amount",-1,[0]]
];
if (isNull _unit || _amount isEqualTo -1 || _mode isEqualTo "") exitWith {};

switch (_mode) do {
	case "add": {
		format ["addServBank:%1", _amount] call SunriseServer_database_fireAndForget;
		server_bank = server_bank + _amount;
	};
	case "take": {
		format ["takeServBank:%1", _amount] call SunriseServer_database_fireAndForget;
		["atm","add",_amount] remoteExecCall ["SunriseClient_system_myCash",_unit];
		server_bank = server_bank - _amount;
	};
};
{life_action_inUse = false} remoteExecCall ["call",_unit];
publicVariable "server_bank";