/*
	
	Filename: 	SunriseClient_system_robShops.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _shop = param [0,ObjNull,[ObjNull]];
if (life_action_inUse) exitWith {};
if (call SunriseClient_system_isInterrupted) exitWith {};
if !(NOTINVEH(player)) exitWith {};	
if (life_copDuty OR life_medDuty) exitWith {};
if (count units life_copGroup < LIFE_SETTINGS(getNumber,"life_cop_min_illegal")) exitWith {hint format [localize "STR_Civ_NotEnoughCops",LIFE_SETTINGS(getNumber,"life_cop_min_illegal")]};
if (_shop GVAR ["robinprogress",false]) exitWith {hint localize "STR_NOTF_ShopRobInProgress"};
if (EQUAL(CURWEAPON,"") OR EQUAL(CURWEAPON,"Binocular") OR (["Extremo_Sign",CURWEAPON] call SunriseClient_system_xString) OR (["sunrise_Tool",CURWEAPON] call SunriseClient_system_xString)) exitWith {hint "И чего я должен испугаться?! Вали отсюда!"};

private _kassa = 5000 + round(random 25000);

[_shop,"robinprogress",true] call CBA_fnc_setVarNet;



if (random(100) >= 50) then {
	["done","","Сработала сигнализация и полиция оповещена об ограблении!"] call SunriseClient_message;
	[1,format["!!! Магазин (координаты: %1) обносится криминальными элементами !!!", mapGridPosition _shop]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
};


private _marker = createMarker [format ["wrgMarker_%1", random(1000)], getPos player];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "!!! Идет ограбление !!!";
_marker setMarkerType "mil_warning";

[localize "STR_NOTF_ShopRobStay",100,"","",false,{}] call SunriseClient_system_progressBar;
deleteMarker _marker;
[_shop,"robinprogress"] call SunriseClient_system_clearGlobalVar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};
  
if (player distance _shop > 5) exitWith {
	hint localize "STR_NOTF_ShopRobInWanted";
	[[steamid,GVAR_RNAME(player),"211A"],"wantedAdd"] call SunriseClient_system_hcExec;
};
   
titleText[format[localize "STR_NOTF_ShopRobDone",[_kassa] call SunriseClient_system_numberText],"PLAIN"];
["cash","add",_kassa] call SunriseClient_system_myCash;
["ShopRobbed"] spawn SunriseClient_experience_addExp;
[[steamid,GVAR_RNAME(player),"211"],"wantedAdd"] call SunriseClient_system_hcExec;
