/*

	Filename: 	SunriseClient_system_jailMe.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_ret",[],[[]]],
	["_bad",false,[false]],
	["_time",-1,[0]],
	["_reason","",[""]]
];
if (_time > -1) then {life_jail_time = _time;life_karma = 5;};
if (_bad) then {waitUntil {uiSleep 0.03; LSALIVE(player)}};

if (life_karma > 0) then {
	_text = switch (life_karma) do {  
		case 1 : {"релог в агонии или в наручниках"}; 
		case 2 : {"багоюз"}; 
		case 3 : {"убийство в зеленой зоне"};
		case 4 : {"нарушение правила новой жизни"};
		case 5: {_reason};
		default {"<br/>ОШИБКА! ОБРАТИТЕСЬ К АДМИНИСТРАТОРУ<br/>"}; 
	};
	if (_text isEqualTo "") exitWith {};
	[parseText format ["<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#ff0000'>Вы были наказаны!<br/><br/>
	</t>Вы были наказаны за %1.<br/>Вы были помещены в тюрьму без возможности выкупа и побега.<br/><br/>
	<t color='#9cff00'>Соблюдайте правила!</t></t>",_text],[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
    //systemChat format ["Вы были наказаны за %1. Вы были помещены в тюрьму без возможности выкупа и побега",_text];
	
	["info","",format ["Вы были наказаны за %1. Вы были помещены в тюрьму без возможности выкупа и побега",_text],true] call SunriseClient_message;
};
detach player;
[player,"restrained"] call SunriseClient_system_clearGlobalVar;

[] call SunriseClient_system_inJail;
[0] call SunriseClient_system_removeLicenses;
["all"] call SunriseClient_removeBuff;

if (!(EQUAL(PUNIFORM,"U_sunrise_Prisonner"))) then {
	[] call SunriseClient_system_saveGear;
	prison_gear = life_gear;

	[] call SunriseClient_system_stripDownPlayer;

	{
		SVAR_MNS [ITEM_VARNAME(configName _x),0];
	} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));
	life_carryWeight = 0;

	player forceAddUniform "U_sunrise_Prisonner";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	[] call SunriseClient_fast_hudWeaponUpdate;
};

life_is_arrested = true;
[player,"isArrested",true] call CBA_fnc_setVarNet;
[getPlayerUID player,"life_is_arrested",[life_is_arrested,life_jail_time]] remoteExecCall ["SunriseServer_database_updatePartial",2];

private _time = time + (life_jail_time * 60);
private _mylistText = "";
if (!(EQUAL(_ret,[]))) then {
	private _crimes = _ret select 1;
	private _mylist = [];
	{
		_crime = _x;
		if (!(_crime in _mylist)) then
		{
			_mylist pushBack _crime;
			_mylistText = _mylistText + format["%2 x %1<br/>",{_x isEqualTo _crime} count _crimes,M_CONFIG(getText,"LifeCfgCrimes",_crime,"displayName")];
		};
	} foreach _crimes;
};

private _updateTime = time;
private _jailTime = life_jail_time;

if (!(EQUAL(_mylistText,""))) then {
	[format["Вы отбываете тюремный срок за следующие правонарушения: <br/><br/>
	<t color='#ffc900'>%1</t><br/>
	Срок заключения: <t color='#ffc900'>%2 минут</t><br/><br/>
	Вы можете оспорить срок заключения подав жалобу в соответствующие органы.",_mylistText,life_jail_time],"police"] call SunriseClient_system_hint;
};

disableSerialization;
//private _timer = ["jail_timer"] call SunriseClient_system_createTimer;
private _uiDisp = GVAR_UINS ["jail_timer",displayNull];
if (isNull _uiDisp) then {	
	["jail_timer","PLAIN"] call SunriseClient_gui_CreateRscLayer;
	_uiDisp = GVAR_UINS ["jail_timer",displayNull];
};

private _timer = _uiDisp displayCtrl 38305;

while {true} do {
	/*if ((round(_time - time)) > 0) then {
		_timer ctrlSetStructuredText parseText format ["%1",
		[(_time - time),"MM:SS"] call BIS_fnc_secondsToString];
	};*/
	if ((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
		_timer ctrlSetText format["%1",_countDown];
	};

	if ((time - _updateTime) > (5 * 60)) then {
		_updateTime = time;
		life_hunger = 100;
		life_thirst = 100;
		_jailTime = _jailTime - 5;
		if (_jailTime > 0) then {			
			[[getPlayerUID player,_jailTime],"wantedUpdateJailTime"] call SunriseClient_system_hcExec;
			//systemChat "Отсиженное время учтено...";
			["info","",format ["Отсиженное время учтено..."],true] call SunriseClient_message;
		};
	};
	

	//if (player distance (getMarkerPos "life_jail_office") > 3000 AND player distance (getMarkerPos "players_spawn_zone") > 750) then {[] call SunriseClient_system_inJail};
	if (player distance (getMarkerPos "life_jail_spawn") > 150 && life_jail_time > 15) then {[] call SunriseClient_system_inJail};
	if (life_jail_time < 1) exitWith {};
	if ((round(_time - time)) < 1) exitWith {hint ""};
	if (LSNOTALIVE(player) && ((round(_time - time)) > 0)) exitWith {};

	life_hunger = 100;
	life_thirst = 100;

	uiSleep 1;
};
if (!(EQUAL(prison_gear,[]))) then {
	life_gear = prison_gear;
	[] call SunriseClient_system_loadGear;
	prison_gear = [];
	[] call SunriseClient_fast_hudWeaponUpdate;
};

["jail_timer"] call SunriseClient_gui_DestroyRscLayer;

life_jail_time = 0;
life_is_arrested = false;
[player,"isArrested"] call SunriseClient_system_clearGlobalVar;
[localize "STR_Jail_Released","done"] call SunriseClient_gui_bottomNotification;
player setPos (getMarkerPos "jail_release_civ");
if !(life_karma > 0) then {[[steamid],"wantedRemove"] call SunriseClient_system_hcExec};

[0] call SunriseClient_system_updateKarma;


[getPlayerUID player,"life_is_arrested",[life_is_arrested,life_jail_time]] remoteExecCall ["SunriseServer_database_updatePartial",2];
//deleteVehicle life_jail_truck;