/*

	Filename: 	SunriseServer_system_updataGovern.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
private _gov_info = "getGovernInfo" call SunriseServer_database_selectSingle;
missionNamespace setVariable ["server_bank",_gov_info select 0,true];
missionNamespace setVariable ["server_tax",_gov_info select 1,true];
missionNamespace setVariable ["server_mar_legal",_gov_info select 2,true];
missionNamespace setVariable ["server_slavery",_gov_info select 3,true];
missionNamespace setVariable ["server_poor",_gov_info select 4,true];

missionNamespace setVariable ["server_timeText",(call SunriseServer_system_getRealTime),true];