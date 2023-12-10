/*

	Filename: 	SunriseServer_database_updateMoney.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_logType","",[""]],//не удалять =)
	["_cash",-1,[0]],
	["_dcash",-1,[0]],
	["_bank",-1,[0]],
	["_uid","",[""]]
];
if (_uid isEqualTo "" OR _cash isEqualTo -1 OR _dcash isEqualTo -1 OR _bank isEqualTo -1) exitWith {["error",format ["|updateMoney| PARAMS=%1",_this]] call SunriseServer_system_customLog;};

_this call SunriseServer_system_customlog;
format ["updateMoney:%1:%2:%3:%4",_cash,_dcash,_bank,_uid] call SunriseServer_database_fireAndForget;