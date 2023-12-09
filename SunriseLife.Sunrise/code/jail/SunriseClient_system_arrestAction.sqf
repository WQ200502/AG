/*

	Filename: 	SunriseClient_system_arrestAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
private _jailtime = ctrlText 37408;
if !([_jailtime] call SunriseClient_system_isnumber) exitWith {[localize "STR_Cop_TicketNum","error"] call SunriseClient_gui_bottomNotification};
_jailtime = parseNumber _jailtime;
if (_jailtime > 90 OR _jailtime < 1) exitWith {hint "Срок заключения должен быть от 1 до 90 минут"};
if (_jailtime > 30 && ([player,"jail_marker"] call CBA_fnc_getDistance > 150)) exitWith {hint "Чтобы посадить в тюрьму более чем на 30 минут, Вы должны конвоировать преступника в исправительную колонию"};
//if (_jailtime > 5 OR _jailtime < 1) exitWith {["Срок заключения должен быть от 1 до 5 ходок","error"] call SunriseClient_gui_bottomNotification};

if (isNull _unit OR isNil "_unit") exitWith {};
if !(GVAR_RESTRAINED(_unit)) exitWith {["Человек не в наручниках","error"] call SunriseClient_gui_bottomNotification};
if (_unit getVariable ["copDuty",false] OR _unit getVariable ["medDuty",false]) exitWith {["Его нельзя посадить, этот человек на службе", "error"] call SunriseClient_gui_BottomNotification};
if (_unit GVAR ["isArrested",false]) exitWith {["Человек уже в тюрьме", "error"] call SunriseClient_gui_BottomNotification};

[[_unit,player],"wantedBounty"] call SunriseClient_system_hcExec;
["CrimeArrested"] spawn SunriseClient_experience_addExp;

[0,"STR_NOTF_Arrested_1",true, [GVAR_RNAME(_unit), GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
[_unit,false,_jailtime] remoteExecCall ["SunriseClient_system_jail",_unit];

[["police",format["%4 (%5) jailed %1 (%2) on %3 mins",GVAR_RNAME(_unit),getPlayerUID _unit,_jailtime,GVAR_RNAME(player),steamid]],"customLog"] call SunriseClient_system_hcExec;