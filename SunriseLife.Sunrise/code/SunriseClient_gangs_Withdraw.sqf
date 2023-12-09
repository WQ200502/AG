/*

	Filename: 	SunriseClient_gangs_Withdraw.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};

private _ownerID = grpPlayer GVAR ["gang_owner",""];
if (_ownerID != steamid) exitWith {["只有头目才能取款", "error"] call SunriseClient_gui_BottomNotification};

private _val = ctrlText 2633;
if !([_val] call SunriseClient_system_isnumber) exitWith {["金额必须是数字", "error"] call SunriseClient_gui_BottomNotification};

_val = parseNumber _val;
if (_val < 1000) exitWith {["提款的最小值: $1000", "error"] call SunriseClient_gui_BottomNotification};
if (_val > 999999) exitWith {["提款的数额不得超过 $999,999 每次", "error"] call SunriseClient_gui_BottomNotification};

private _gangBank = grpPlayer GVAR ["gang_bank",-1];
if (EQUAL(_gangBank,-1)) exitWith {["无法确定组的通信", "error"] call SunriseClient_gui_BottomNotification};
if (_val > _gangBank) exitWith {["你的团伙没有足够的资金", "error"] call SunriseClient_gui_BottomNotification};

call SunriseClient_actions_inUse;
(CONTROL(2620,2626)) ctrlEnable false;
["Снимаем деньги со счета...", "info"] call SunriseClient_gui_BottomNotification;

["remove",_val,_gangBank,player] remoteExecCall ["SunriseServer_system_updateGangBank",RSERV];
