/*

	Resets market by calling marketConfiguration

*/

[] call anzus_fnc_marketconfiguration;

[0,format["管理员: %1 已将市场价格定为标准价格."],name player] remoteExecCall ["life_fnc_broadcast",RCLIENT];

hint "Market prices reset.";