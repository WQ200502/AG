/*

	Filename: 	SunriseClient_gangs_Menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\script_macros.hpp"

if (life_action_gangInUse) exitWith {};
disableSerialization;
if (isNull (findDisplay 2620)) then {
	if !(createDialog "SunriseDialogMyGang") exitWith {};
};


private _ownerID = grpPlayer GVAR["gang_owner",""];
if (EQUAL(_ownerID,"")) exitWith {closeDialog 0;};
private _gangDeputy = grpPlayer GVAR ["gang_deputy","-1"];
private _gangName = GANG_NAME;
private _gangBank = grpPlayer GVAR "gang_bank";
private _gangMax = grpPlayer GVAR "gang_maxMembers";
private _gangCount = grpPlayer GVAR "gang_membersCount";
private _gangLicense = grpPlayer GVAR ["gang_license","-1"];
private _gangID = grpPlayer GVAR "gang_id";
private _gangWarpoints = grpPlayer GVAR ["gang_warpoints",0];

private _BtnLvlUp = CONTROL(2620,2627);
private _BtnLvlDwn = CONTROL(2620,2628);
private _BtnLicense = CONTROL(2620,2635);
private _BtnUpgrade = CONTROL(2620,2622);
private _BtnKick = CONTROL(2620,2624);
private _BtnNewLeader = CONTROL(2620,2625);
private _BtnNewDeputy = CONTROL(2620,2637);
private _BtnInvite = CONTROL(2620,2630);
private _listInvite = CONTROL(2620,2632);
private _MoneyEdit = CONTROL(2620,2633);
private _BtnTakeMoney = CONTROL(2620,2626);
private _BtnDisband = CONTROL(2620,2631);
private _BtnLeave = CONTROL(2620,2636);
private _BtnOffline = CONTROL(2620,2638);

private _GangInfoAdd = CONTROL(2620,2639);

_BtnLvlUp ctrlEnable false; //lvl +
_BtnLvlDwn ctrlEnable false; //lvl -
_BtnLicense ctrlEnable false; //лицуха

_BtnUpgrade ctrlEnable false; //Upgrade
_BtnKick ctrlEnable false; //Kick
_BtnNewLeader ctrlEnable false; //Set New Leader
_BtnNewDeputy ctrlEnable false; //Set New Deputy
_BtnInvite ctrlEnable false; //Invite Player
_listInvite ctrlEnable false; //Invite Player
_BtnTakeMoney ctrlEnable false; //Снять бабки
_MoneyEdit ctrlEnable false; //Снять бабки поле
_BtnDisband ctrlShow false; //Disband Gang
_BtnLeave ctrlShow true; //Leave Gang
_BtnOffline ctrlEnable false; //Leave Gang

_GangInfoAdd ctrlEnable false;

if (EQUAL(_gangDeputy,steamid)) then {
	_BtnUpgrade ctrlEnable true; //Upgrade
	_BtnKick ctrlEnable true; //Kick
	_BtnInvite ctrlEnable true; //Invite Player
	_listInvite ctrlEnable true; //Invite Player
	_GangInfoAdd ctrlEnable true; //изменение инфы
	_BtnOffline ctrlEnable true;
};

if (EQUAL(_ownerID,steamid)) then {
	_BtnUpgrade ctrlEnable true; //Upgrade
	_BtnKick ctrlEnable true; //Kick
	_BtnNewLeader ctrlEnable true; //Set New Leader
	_BtnNewDeputy ctrlEnable true; //Set New Deputy
	_BtnInvite ctrlEnable true; //Invite Player
	_listInvite ctrlEnable true; //Invite Player
	_BtnTakeMoney ctrlEnable true; //Снять бабки
	_MoneyEdit ctrlEnable true; //Снять бабки поле
	_BtnDisband ctrlShow true; //Disband Gang
	_BtnLeave ctrlShow false; //Leave Gang
	_GangInfoAdd ctrlEnable true; //изменение инфы
	_BtnOffline ctrlEnable true;
};

switch(true) do {
	case (life_copDuty): {if (player GVAR ["copLevel",0] > 1) then {_GangInfoAdd ctrlEnable true};};
	case (life_medDuty): {if (player GVAR ["medrank",0] > 1) then {_GangInfoAdd ctrlEnable true};};
	default {if (player GVAR ["lvl",0] > 1) then {_GangInfoAdd ctrlEnable true};};
};

if (group player in [life_copGroup,life_medGroup]) then {
	if (EQUAL(_ownerID,steamid) OR (EQUAL(_gangDeputy,steamid))) then {
		_BtnLvlUp ctrlEnable true;
		_BtnLvlDwn ctrlEnable true;
	};
	if !([LIFE_SETTINGS(getText,"life_gangCopCanLeaveCondition")] call SunriseClient_system_conditionsCheck) then {_BtnLeave ctrlEnable false};
	if (life_coplevel > 2) then {_GangInfoAdd ctrlEnable true};
	if (life_medlevel > 2) then {_GangInfoAdd ctrlEnable true};
	_BtnDisband ctrlEnable false;
} else {
	if !(EQUAL(_gangLicense,"-1")) then {
		if (EQUAL(_ownerID,steamid) OR EQUAL(_gangDeputy,steamid)) then {
			SetGangLicense = _gangLicense;
			_BtnLicense ctrlEnable true;
			_BtnLicense buttonSetAction "[SetGangLicense] call SunriseClient_gangs_LicenseToPlayer";
			//dobavil
			_BtnLvlUp ctrlEnable true;
			_BtnLvlDwn ctrlEnable true;
		};
	};
};

(CONTROL(2620,2629)) ctrlSetText _gangName;
(CONTROL(2620,601)) ctrlSetText format["В сети: %1 из %2  |  Слотов: %3  |  Общак: $%4",count(units grpPlayer),_gangCount,_gangMax,[_gangBank] call SunriseClient_system_numberText];

private _members = CONTROL(2620,2621);
lbClear _members;

private "_lvlTitle";
{
	if (GVAR_RNAME(_x) != "") then {
		_lvlTitle = switch(true) do {
			case life_copDuty: {format ["[Ур. %1] ",_x GVAR["copLevel",0]];};
			case life_medDuty: {format ["[Ур. %1] ",_x GVAR["medrank",0]];};
			default {
				if (!(EQUAL(_gangLicense,"-1"))) then {
					switch (_x GVAR ["lvl",0]) do {
						case 1: {"[Салага] "};
						case 2: {"[Рядовой] "};
						case 3: {"[Боец] "};
						case 4: {"[Офицер] "};
						case 5: {"[Ст.Офицер] "};
						default {""};
					};
				} else {""};
			};
		};
		
		switch(getPlayerUID _x) do {
			case _ownerID: {_members lbAdd format["%2%1 " +(localize "STR_GNOTF_GangLeader"),(GVAR_RNAME(_x)),_lvlTitle];};
			
			case _gangDeputy: {_members lbAdd format["%2%1 (Заместитель)",(GVAR_RNAME(_x)),_lvlTitle];};
			
			default {_members lbAdd format["%2%1",(GVAR_RNAME(_x)),_lvlTitle];};
		};
		_members lbSetData [(lbSize _members)-1,str(_x)];
	};
} foreach (units grpPlayer);

private _grpMembers = units grpPlayer;
private _pUnits = playableUnits - _grpMembers;

lbClear _listInvite;
{
	if (LSALIVE(_x) && {GVAR_RNAME(_x) != ""}) then {
		_listInvite lbAdd format["%1",GVAR_RNAME(_x)];
		_listInvite lbSetData [(lbSize _listInvite)-1,str(_x)];
	};
} foreach _pUnits;


_display = findDisplay 2620;

private _buttons = [
	[2010,2011], [2012,2013], [2014,2015], [2016,2017], [2018,2019], [2020,2021],

	[2022,2023], [2024,2025], [2026,2027], [2028,2029], [2030,2031], [2032,2033],

	[2034,2035], [2036,2037], [2038,2039], [2040,2041], [2042,2043], [2044,2045]
];

{
	ctrlShow [_x select 0,false];
	ctrlShow [_x select 1,false];
} forEach _buttons;

private ["_imageID","_buttonID"];
private _index = 0;
{	
	if (isNull _display) exitWith {};
	if ([getText(_x >> "conditions")] call SunriseClient_system_conditionsCheck) then {
		_imageID = _display displayCtrl ((_buttons select _index) select 0);
		_buttonID = _display displayCtrl ((_buttons select _index) select 1);
	
		_imageID ctrlSetText getText(_x >> "image");
		_buttonID ctrlSetTooltip localize (getText(_x >> "tooltip"));
		_buttonID buttonSetAction getText(_x >> "action");
	
		_imageID ctrlShow true;
		_buttonID ctrlShow true;

		ADD(_index,1);
	};	
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPadIcons"));