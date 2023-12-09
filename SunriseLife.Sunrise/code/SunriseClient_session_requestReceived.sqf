/*

	Filename: 	SunriseClient_session_requestReceived.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
life_debugger = _this;
life_session_tries = life_session_tries + 1;
if (life_session_completed OR isServer OR !hasInterface) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if (life_session_tries > 3) exitWith {
	[["error",format["life_session_tries > 3 - %1 - %2",getPlayerUID player,life_session_tries]],"customLog"] call SunriseClient_system_hcExec;
	endMission "LoadingError";
};

//Error handling and  junk..
if (isNil "_this") exitWith {[] call SunriseClient_session_insertPlayerInfo};
if (_this isEqualTo []) exitWith {[] call SunriseClient_session_insertPlayerInfo};

params [
	"_playerid",
	"_name",
	"_cash",
	"_bankacc",
	"_dcash",
	"_donorlevel",
	"_licenses",
	"_civlevel",
	"_coplevel",
	"_mediclevel",
	"_gear",
	"_recipes",
	"_logout_pos",
	"_karma",
	"_deaths",
	"_servermap",
	"_arrested",
	"_jail_time",
	"_first_time",
	"_playtime",
	"_damage",
	"_exp_level",
	"_exp_total",
	"_exp_perkPoints",
	"_exp_perks",
	"_gangData",
	"_houseData",
	"_configsData",
	"_indicatorsData",
	"_keysData"
];
if (!isNil "life_coplevel" OR !isNil "life_medlevel" OR !isNil "life_civlevel" OR !isNil "life_donator" OR !isNil "life_donator_expired") exitWith {
	["cheat",format["%1 (%2) !isNil _requestReceived",getPlayerUID player,name player]] remoteExecCall ["SunriseServer_system_customlog",-2];
	endMission "SpyGlass"
};
if (steamid != _playerid) exitWith {[] call SunriseClient_session_dataQuery};
if ((profileName != _name) && !(call life_isAdmin)) exitWith {
	closeDialog 0;
	hint parseText format ["<t size='1.1'><t size='2'><t color='#f5be00'>Внимание!!!</t></t><br /><br />За вашим ID закреплён другой ник, укажите свой старый ник в профиле игры!<br/><br/>Ваш старый ник<br/> <t size='1.7'><t color='#1dae0e'>%1</t></t><br/><br/>Если у вас проблемы с изменением ника - обратитесь на форум <t color='#665bff'>forum.sunriserp.ru</t></t>",_name];
	0 cutText ["","BLACK FADED"];
	0 cutFadeOut 9999999;
	uiSleep 10;
	endMission "NameExists";
};

/*if (!(EQUAL(worldName,(_servermap))) && !(call life_isAdmin)) exitWith {
	switch (_servermap) do {
		case "Sunrise" : {endMission "NotYouServerMap_Altis";};
		case "Tanoa" : {endMission "NotYouServerMap_Tanoa";};
	};
};*/

//Parse basic player information.
["cash","set",parseNumber _cash] call SunriseClient_system_myCash;
["atm","set",parseNumber _bankacc] call SunriseClient_system_myCash;
["dcash","set",parseNumber _dcash] call SunriseClient_system_myCash;

CONST(life_donator,_donorlevel);

{if !(isClass (missionConfigFile >> "LifeCfgLicenses" >> _x)) then {_licenses set [_forEachIndex,-1]}} foreach _licenses;
_licenses = _licenses - [-1];
life_licenses = _licenses;

life_civlevel = _civlevel;
life_coplevel = _coplevel;
life_medlevel = _mediclevel;
life_gear = _gear;
[] call SunriseClient_system_loadGear;

life_recipes = _recipes;
life_logout_position = _logout_pos;
life_karma = _karma;
life_deaths = _deaths;


life_is_arrested = _arrested;
life_jail_time = _jail_time;
life_firstTime = _first_time;
life_newbie = (_playtime < 720 AND life_civLevel < 2 AND life_coplevel < 1);

life_damage = _damage;
life_currentExpLevel = _exp_level;
life_currentExp = _exp_total;
life_currentPerkPoints = _exp_perkPoints;

[_exp_perks] call SunriseClient_experience_setPerks;


if !(_houseData isEqualTo []) then {[_houseData] call SunriseClient_system_initHouses};

{missionNamespace setVariable [life_config_array select _forEachIndex,_x]} foreach _configsData;
{missionNamespace setVariable [life_indicators_array select _forEachIndex,_x]} foreach _indicatorsData;
if ((call life_donator) isEqualTo 0) then {life_myIdentity = ""};
if (life_death_endtime isEqualTo 0) then {life_death_markers = []};


life_gangData = _gangData;
private _handle = [] spawn SunriseClient_gangs_Init;
waitUntil {scriptDone _handle};
	
life_deaths_max = switch (call life_donator) do {
	case 1: {999};
	case 2: {999};
	case 3: {999};
	case 4: {999};
	case 5: {999};
	default {999};
};

if (life_deaths >= life_deaths_max) exitWith {
	[true] spawn SunriseClient_system_logout;
};

if !(_keysData isEqualTo []) then {
	{[_x] call SunriseClient_system_vehInit} forEach _keysData;
};


if ((server_govinfo select 0 isEqualTo steamid) && !(life_copDuty OR life_medDuty)) then {life_gov = true};
if ((count life_death_markers > 0) && life_death_endtime > 0) then {[life_death_endtime] call SunriseClient_system_DeathTimer};

//Static variable representing the players max carrying weight on start.
life_maxWeightT = switch (FETCH_CONST(life_donator)) do {
	case 1: {26};
	case 2: {30};
	case 3: {36};
	case 4: {42};
	case 5: {48};
	default {24};
};

//Load settings (USER PROFILE)
_tmpSettingArray = [] call SunriseClient_system_loadSettings;
{
	missionNamespace setVariable [_x,(_tmpSettingArray select _forEachIndex)];
} forEach array_settings;

life_session_completed = true;