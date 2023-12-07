#include "..\..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_shooter",Objnull,[Objnull]]
];
if (isNull _unit) exitWith {};
if (isNull _shooter OR LSNOTALIVE(_unit)) exitWith {[_unit,"tazed"] call ZBKClient_system_clearGlobalVar};

if (vehicle player == player) then {
	_inVehicle = false;
} else {
	player allowdamage false; player action ["Eject",vehicle player]; [] spawn {sleep 5; player allowDamage true};
	_inVehicle = true;
};

if (_shooter isKindOf "Man" && alive _unit) then {
	if !(_unit GVAR ["tazed",false]) then {
		private "_obj";
		[_unit,"tazed",true] call CBA_fnc_setVarNet;
		disableUserInput true;
		[_unit] remoteExecCall ["ZBKClient_system_tazeSound",RCLIENT];		
		if (NOTINVEH(_unit)) then {
			_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
			_obj setPosATL (getPosATL _unit);
			[_unit,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["ZBKClient_system_animSync",RCLIENT];
			_unit attachTo [_obj,[0,0,0]];
		};
		
		if (side _shooter != west OR !(license_civ_jianchag) OR !(license_civ_ztb) OR !(license_civ_faguan) OR FETCH_CONST(life_adminlevel) < 1) then {
			[[getPlayerUID _shooter,GVAR_RNAME(_shooter),"666"],"wantedAdd"] call ZBKClient_system_hcExec;
			if ([player] call ZBKClient_system_isSafeZone) then {
				[player,format["%1 (%2) 在安全区电倒了 %3 (%4)",GVAR_RNAME(_shooter),getPlayerUID _shooter,GVAR_RNAME(_unit),steamid]] remoteExec ["DB_fnc_writeLog",2];
				[ hint "你在安全区被%1 (%2)电晕，属于违规行为，如果你认为这是恶意事件请截图上报法庭！（警察、法官、检察官允许在特殊情况时使用电击枪)",GVAR_RNAME(_shooter),getPlayerUID _shooter,GVAR_RNAME(_unit),steamid];
			};
		};
		player setDamage 0;
		["all"] call ZBKClient_system_removeBuff;
		[player,format["%1 (%2) 电倒了 %3 (%4)",GVAR_RNAME(_shooter),getPlayerUID _shooter,GVAR_RNAME(_unit),steamid]] remoteExec ["DB_fnc_writeLog",2];
		systemChat format ["ID %1 的玩家攻击了你. 请记住此ID以防违反服务器规则",(getPlayerUID _shooter)];
		for "_i" from 1 to 30 do {
			titleText[format["你被电击枪击中晕倒，将会在%1秒内醒来。", (31 - _i)],"PLAIN"];
			uiSleep 1;
			if (GVAR_RESTRAINED(_unit)) exitWith {};
		};		
		
		if (NOTINVEH(_unit)) then {
			[_unit,"amovppnemstpsraswrfldnon"] remoteExecCall ["ZBKClient_system_animSync",RCLIENT];
			detach _unit;
			deleteVehicle _obj;
		};
		titleText["","PLAIN"];
		[_unit,"tazed"] call ZBKClient_system_clearGlobalVar;
		disableUserInput false;
	};
} else {	
	[_unit,"tazed"] call ZBKClient_system_clearGlobalVar;
};