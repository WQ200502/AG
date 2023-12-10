/*

	Filename: 	SunriseServer_system_updateGangBank.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_mode","",[""]],
	["_value",0,[0]],
	["_g_bank",0,[0]],
	["_unit",ObjNull,[ObjNull]],
	["_value_tax",0,[0]]
];
private _group = group _unit;
private _g_id = _group getVariable ["gang_id",-1];
private _uid = getPlayerUID _unit;

switch (_mode) do {
	case "add": {
		_group setVariable ["gang_bank",_g_bank + _value,true];
		format ["depositGangBank:%1:%2", _value,_g_id] call SunriseServer_database_fireAndForget;
		[_value_tax] remoteExecCall ["SunriseClient_gangs_DepositDone",_unit];
	};
	case "remove": {
		_group setVariable ["gang_bank",_g_bank - _value,true];
		format ["withdrawGangBank:%1:%2", _value,_g_id] call SunriseServer_database_fireAndForget;
		[_value] remoteExecCall ["SunriseClient_gangs_WithdrawDone",_unit];
	};
};
["gangbank",format ["|updateGangBank| MOD - %1 || UID - %2 || VALUE - %3 || GANG ID - %4",_mode,_uid,_value,_g_id]] call SunriseServer_system_customLog;