/*

	Filename: 	SunriseClient_rob_robGas.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["error","","Вы заняты"] call SunriseClient_message};
params ["_target", "_caller", "_actionId"];
if (life_action_inUse) exitWith {};
if (call SunriseClient_system_isInterrupted) exitWith {};
if !(NOTINVEH(player)) exitWith {};	
if (life_copDuty OR life_medDuty) exitWith {};
if (count units life_copGroup < LIFE_SETTINGS(getNumber,"life_cop_min_illegal")) exitWith {hint format [localize "STR_Civ_NotEnoughCops",LIFE_SETTINGS(getNumber,"life_cop_min_illegal")]};
if (_target GVAR ["robinprogress",false]) exitWith {hint localize "STR_NOTF_targetRobInProgress"};
if (EQUAL(CURWEAPON,"") OR EQUAL(CURWEAPON,"Binocular") OR (["Extremo_Sign",CURWEAPON] call SunriseClient_system_xString) OR (["sunrise_Tool",CURWEAPON] call SunriseClient_system_xString)) exitWith {hint "И чего я должен испугаться?! Вали отсюда!"};

[_target,"robinprogress",true] call CBA_fnc_setVarNet;

if (random(100) > (50 * perk_stealth)) then {
	["police","","Сработала сигнализация и полиция оповещена об ограблении!"] call SunriseClient_message;	
	[1,format["!!! Магазин (координаты: %1) обносится криминальными элементами !!!", mapGridPosition _target]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
	[[getPlayerUID player,name player,"211"],"wantedAdd"] call SunriseClient_system_hcExec;
};

private _marker = createMarker [format ["wrgMarker_%1", random(1000)], getPos player];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "!!! Идет ограбление !!!";
_marker setMarkerType "mil_warning";

["Грабим заправку",100,{player distance _target > 5}] call SunriseClient_system_progressBarSimple;
deleteMarker _marker;
[_target,"robinprogress"] call SunriseClient_system_clearGlobalVar;
if (call SunriseClient_system_isInterrupted) exitWith {};
if (player distance _target > 5) exitWith {["error","","Вы слишком далеко отошли!"] call SunriseClient_message};

life_rob_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_rob_job;
_target removeAction _actionId;

private _price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_rob_price");
_price = round (_price + random _price);
if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
["done","",format["Вы успешно выполнили работу, вы получили $%1 грязными деньгами",[_price] call SunriseClient_system_numberText]] call SunriseClient_message;
["RobGasDone"] spawn SunriseClient_experience_addExp;
["dcash","add",_price,"robgasJob"] call SunriseClient_system_myCash;
[[steamid,GVAR_RNAME(player),"211"],"wantedAdd"] call SunriseClient_system_hcExec;
life_job_inProgress = false;
[["earning", getPlayerUID player, (player getVariable ["realname",""]), "robGas", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;