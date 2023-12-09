/*
	
	Filename: 	SunriseClient_system_raidHouse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
private _uid = (_house GVAR "house_owner") select 0;
if (isNil "_uid") exitWith {[localize "STR_House_Raid_NoOwner", "error"] call SunriseClient_gui_BottomNotification};
if (life_coplevel < 8) exitWith {["Конфисковывать оружие могут только офицеры", "error"] call SunriseClient_gui_BottomNotification};
if !([_uid] call SunriseClient_system_isUIDActive) exitWith {[localize "STR_House_Raid_OwnerOff", "error"] call SunriseClient_gui_BottomNotification};

private _house_box = _house GVAR["house_box",objNull];
if (isNull _house_box) exitWith {["Ящик не найден", "error"] call SunriseClient_gui_BottomNotification};
if ([_house_box] call SunriseClient_system_isTrunkInUse) exitWith {[localize "STR_MISC_VehInvUse", "error"] call SunriseClient_gui_BottomNotification};

private _houseInv = _house_box GVAR ["Trunk",[[],0]] select 0;
if (EQUAL((_houseInv),[])) exitWith {[localize "STR_House_Raid_Nothing", "error"] call SunriseClient_gui_BottomNotification};
if (_house GVAR ["inRaid",false]) exitWith {["Обыск уже начался", "error"] call SunriseClient_gui_BottomNotification};
_house SVAR["inRaid",true,true];

private _time = 30;
if (IS_VIP) then {_time = _time call SunriseClient_system_timeDiscount};
[localize "STR_House_Raid_Searching",_time,"","",true,{(player distance _house > 13)}] call SunriseClient_system_progressBar;
[_house,"inRaid"] call SunriseClient_system_clearGlobalVar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if (player distance _house > 13) exitWith {[localize "STR_House_Raid_TooFar", "error"] call SunriseClient_gui_BottomNotification};

private _reward = 0;
/*{
	_x params ["_var","_val"];
	
	private _index = [_var,life_illegal_items] call SunriseClient_system_index;
	if !(EQUAL(_index,-1)) then {		
		_reward = _reward + (_val * ((life_illegal_items select _index) select 1));	
	};
} foreach _houseInv;*/

if (_reward > 0) then {
	private _gangID = grpPlayer GVAR ["gang_id",-1];
	if (grpPlayer isEqualTo life_copGroup) then {
		private _gFund = grpPlayer GVAR ["gang_bank",-1];
		if (EQUAL(_gFund,-1)) then {
			["atm","add",_reward,"raidHouse"] call SunriseClient_system_myCash;
			["Не удалось определить баланс группы. Начислено на банковский счет. Сообщите админу!", "error"] call SunriseClient_gui_BottomNotification
		} else {				
			ADD(_gFund,_reward);
			grpPlayer SVAR ["gang_bank",_gFund,true];		
			[[1,grpPlayer,steamid],"updateGang"] call SunriseClient_system_hcExec;
		};
	} else {
		["atm","add",_reward,"raidHouse"] call SunriseClient_system_myCash;
	};	
	
	[0,"STR_House_Raid_Successful",true,[[_reward] call SunriseClient_system_numberText]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
	[_house_box] call SunriseClient_system_clearVehicleTrunk;
	[[_house_box,player],"updateHouseContainers"] call SunriseClient_system_hcExec;
} else {
	[localize "STR_House_Raid_NoIllegal", "error"] call SunriseClient_gui_BottomNotification;
};