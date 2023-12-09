/*
	
	Filename: 	SunriseClient_system_healMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 3600)) then {createDialog "SunriseDialogHealth"};
_display = findDisplay 3600;

private _title = CONTROL(3600,3601);

private _headImage = CONTROL(3600,3611);
private _bodyImage = CONTROL(3600,3612);
private _handsImage = CONTROL(3600,3613);
private _legsImage = CONTROL(3600,3614);

private _healInfo = CONTROL(3600,3615);

private _headButton = CONTROL(3600,3621);
private _bodyButton = CONTROL(3600,3622);
private _handLeftButton = CONTROL(3600,3623);
private _handRightButton = CONTROL(3600,3624);
private _legsButton = CONTROL(3600,3625);

private _buttons = [
	[2010,2011], [2012,2013], [2014,2015], [2016,2017], [2018,2019], [2020,2021],

	[2022,2023], [2024,2025], [2026,2027], [2028,2029], [2030,2031], [2032,2033],

	[2034,2035], [2036,2037], [2038,2039], [2040,2041], [2042,2043], [2044,2045]
];

{
	ctrlShow [_x select 0,false];
	ctrlShow [_x select 1,false];
} forEach _buttons;

_title ctrlSetText format["Здоровье и повреждения %1",GVAR_RNAME(player)];

private _hitHead = round ((player getHitPointDamage "hitHead") * 100);
private _hitBody = round ((player getHitPointDamage "hitBody") * 100);
private _hitHands = round ((player getHitPointDamage "hitHands") * 100);
private _hitLegs = round ((player getHitPointDamage "hitLegs") * 100);

private _damageText = "";
private _healthText = "";

if (_hitHead >= 25) then {
	_damageText = _damageText + "Ранение головы<br/>";
};
if (_hitBody >= 25) then {
	_damageText = _damageText + "Ранение туловища<br/>";
};
if (_hitHands >= 25) then {
	_damageText = _damageText + "Ранение рук<br/>";
};
if (_hitLegs >= 25) then {
	_damageText = _damageText + "Ранение ног<br/>";
};
if (life_bleeding) then {
	_damageText = _damageText + "Кровотечение<br/>";
};
if (life_pain_shock) then {
	_damageText = _damageText + "Болевой шок<br/>";
};
/*if (life_critHit) then {
	_damageText = _damageText + "Критическое ранение<br/>";
};*/
if (life_blood_legs) then {
	_damageText = _damageText + "Перелом ног<br/>";
};

if (_damageText == "") then {
	_damageText = "<t size='0.95' color='#c3ff21'><br/><br/>Повреждений нет<br/></t>";
} else {
	_damageText = "<t size='0.95' color='#ff4e00'><br/><br/>" + _damageText + "</t>";
};


if (life_drug_light) then {
	_healthText = _healthText + "Зависимость от легких наркотиков<br/>";
};
if (life_drug_hard) then {
	_healthText = _healthText + "Зависимость от тяжелых наркотиков<br/>";
};
if (life_sickness) then {
	_healthText = _healthText + "Вы болеете<br/>";
};
if (life_diarrhea) then {
	_healthText = _healthText + "Диарея";
};

if (EQUAL(_healthText,"")) then {
	_healthText = "<t size='0.95' color='#c3ff21'><br/><br/>Заболеваний нет</t>";
} else {
	_healthText = "<t size='0.95' color='#ff4e00'><br/><br/>" + _healthText + "</t>";
};

_healInfo ctrlSetStructuredText parseText format ["<t size='1.15'>Повреждения:</t>%1<br/><t size='1.15'>Здоровье:</t>%2",_damageText, _healthText];

switch (true) do
{
	case (_hitHead >= 0 && _hitHead < 25): {_headImage ctrlSetText "\sunrise_pack\pictures\health\head1.paa"};
	case (_hitHead >= 25 && _hitHead <= 75 ): {_headImage ctrlSetText "\sunrise_pack\pictures\health\head2.paa"};
	case (_hitHead > 75 && _hitHead <= 100): {_headImage ctrlSetText "\sunrise_pack\pictures\health\head3.paa"};
};	

switch (true) do
{
	case (_hitBody >= 0 && _hitBody < 25): {_bodyImage ctrlSetText "\sunrise_pack\pictures\health\body1.paa"};
	case (_hitBody >= 25 && _hitBody <= 75): {_bodyImage ctrlSetText "\sunrise_pack\pictures\health\body2.paa"};
	case (_hitBody > 75 && _hitBody <= 100): {_bodyImage ctrlSetText "\sunrise_pack\pictures\health\body3.paa"};
};

switch (true) do
{	
	case (_hitHands >= 0 && _hitHands < 25): {_handsImage ctrlSetText "\sunrise_pack\pictures\health\hands1.paa"};
	case (_hitHands >= 25 && _hitHands <= 75 ): {_handsImage ctrlSetText "\sunrise_pack\pictures\health\hands2.paa"};
	case (_hitHands > 75 && _hitHands <= 100): {_handsImage ctrlSetText "\sunrise_pack\pictures\health\hands3.paa"};
};
	
switch (true) do
{	
	case (_hitLegs >= 0 && _hitLegs < 25): {_legsImage ctrlSetText "\sunrise_pack\pictures\health\legs1.paa"};
	case (_hitLegs >= 25 && _hitLegs <= 75 ): {_legsImage ctrlSetText "\sunrise_pack\pictures\health\legs2.paa"};
	case (_hitLegs > 75 && _hitLegs <= 100): {_legsImage ctrlSetText "\sunrise_pack\pictures\health\legs3.paa"};
};

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