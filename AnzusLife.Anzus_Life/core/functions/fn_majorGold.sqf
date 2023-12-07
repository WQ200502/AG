#include "..\..\script_macros.hpp"
private ["_uiDisp","_time","_timer","_amt","_cash","_cashRand","_bomb","_reqItem","_perkTime"];

params [["_obj",objNull,[objNull]], ["_ply",objNull,[objNull]], "", ["_type","",[""]]];

if (isNull _obj) exitWith {};
if (isNull _ply) exitWith {};
if(!([_obj] call AnzusLife_GetDoor IN ["door_1"])) exitWith {["您必须在金库中执行此操作","false","slow"] call ANZUS_fnc_notificationSystem;};
if (_obj getVariable ["bankOpen",false]) exitWith {["保险箱已经打开!","false","slow"] call ANZUS_fnc_notificationSystem;};
if (_obj getVariable ["chargeplaced",false]) exitWith {["已放置钻头.!","false","slow"] call ANZUS_fnc_notificationSystem;};
if (_type isEqualTo "") exitWith {["一个开发人员很笨，告诉他们这是行动.","false","slow"] call ANZUS_fnc_notificationSystem;};
if !(_ply isEqualTo player) exitWith {["你不等于你自己.","false","slow"] call ANZUS_fnc_notificationSystem;};
if !(playerSide isEqualTo civilian) exitWith {["你需要是一个平民?","false","slow"] call ANZUS_fnc_notificationSystem;};
if ((west countSide playableUnits) > 3) exitWith {[ format ["有 %1 警察在线, 需要10名警察在线." , (west countSide playableUnits)],true,"slow"] call ANZUS_fnc_notificationSystem;};
if (fedpcvault getVariable ['fedpcvault',false] isEqualto false) exitWith {["您必须首先侵入安全系统并禁用保管库安全系统","false","slow"] call ANZUS_fnc_notificationSystem;};

_class = MAIN_SETTINGS("MajorCrimes",_type);
if !(isClass _class) exitWith {["一个开发人员很笨，告诉他们这是配置.","false","slow"] call ANZUS_fnc_notificationSystem;};

	life_major_amount = nil;
	[] remoteExecCall ["AnzusLife_TotalItems", 2];
	_time = time;

	waitUntil {!isNil "life_major_amount" || (time - _time) > 5};
	[cursorObject] spawn ANZUS_fnc_spawndrill;
	removeBackpack player;

	_time = ((getNumber (_class >> "time") ));
	_perkTime = ((missionNamespace getVariable ["mav_ttm_var_robbingMultiplier", 1]) - 1);
	_time = _time - (_time * _perkTime);
	_time = _time + time;

	["Fed"] remoteExec ['ANZUS_fnc_AANBank',-2];

	disableSerialization;
	"lifeTimer" cutRsc ["life_timer","PLAIN"];
	_uiDisp = uiNamespace getVariable "life_timer";
	_timer = _uiDisp displayCtrl 38301;
	_obj setVariable ["chargeplaced",true,true];

	for "_i" from 0 to 1 step 0 do {
		if (isNull _uiDisp) then {
			"lifeTimer" cutRsc ["life_timer","PLAIN"];
			_uiDisp = uiNamespace getVariable "life_timer";
			_timer = _uiDisp displayCtrl 38301;
		};
		if (round(_time - time) < 1) exitWith {};
		if (!(_obj getVariable ["chargeplaced",false])) exitWith {};
		_timer ctrlSetText format ["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		sleep 0.08;
	};
	"lifeTimer" cutText["","PLAIN"];
	if (!(_obj getVariable ["chargeplaced",false])) exitWith {};

	_obj setVariable ["chargeplaced",false,true];
	_obj setVariable ["bankOpen",true,true];
	_obj setVariable ["openInv",false,true];
	_obj setVariable ["openInvPID",nil,true];
	_obj setVariable ["vault_open",true,true];
	missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];
	_MajorSettings = MAIN_SETTINGS("MajorCrimes","Fed");

	["钻头钻开已完成。 现在您可以打开保管库门!","true","slow"] call ANZUS_fnc_notificationSystem;
	deleteVehicle bankdrill;
	_obj setVariable ["bis_disabled_Door_1",0,true];

	[true,"relicFed",1] call ANZUS_fnc_handleInv;

	if (!isNil {(group player) getVariable ["gang_name",""]}) then {
				_gangrole = (group player) getVariable ["gang_role",[]];
				if (_gangrole isEqualTo []) exitWith {};

				_gangselect = _gangrole select 0;
				if (_gangselect != 0) then {
						_task = "Defunding the Cartel";
						_check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
						if (!_check) then {[_task] remoteExec ["AnzusLife_UnlockTask",2];};
				};
		};
		_dir = getDir _obj;

		_amountgoldfed = getNumber(_MajorSettings >> "Gold_amount");
		_amountcashFed = getNumber(_MajorSettings >> "Cash_amount");

		_golafed = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
		_golafed setVariable ["vault_gold",_amountgoldfed,true];
		_gola2fed = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
		_gola2fed setVariable ["vault_gold",_amountgoldfed,true];
		_gola4fed = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
		_gola4fed setVariable ["vault_gold",_amountgoldfed,true];
		_gola5fed = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
		_gola5fed setVariable ["vault_gold",_amountgoldfed,true];
		_gola6fed = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
		_gola6fed setVariable ["vault_gold",_amountgoldfed,true];
		_gola7fed = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
		_gola7fed setVariable ["vault_gold",_amountgoldfed,true];
		_gola8fed = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
		_gola8fed setVariable ["vault_gold",_amountgoldfed,true];
		_moulafed = createVehicle ["A3l_MoneyPile",[0,0,999],[], 0, "NONE"];
		_moulafed setVariable ["vault_money",_amountcashFed,true];
		_moulafed2 = createVehicle ["A3l_MoneyPile",[0,0,999],[], 0, "NONE"];
		_moulafed2 setVariable ["vault_money",_amountcashFed,true];
		_moulafed3 = createVehicle ["A3l_MoneyPile",[0,0,999],[], 0, "NONE"];
		_moulafed3 setVariable ["vault_money",_amountcashFed,true];
		_moulafed4 = createVehicle ["A3l_MoneyPile",[0,0,999],[], 0, "NONE"];
		_moulafed4 setVariable ["vault_money",_amountcashFed,true];

		_golafed setPosATL (_obj modelToWorld [-1,2,-1]);
		_gola2fed setPosATL (_obj modelToWorld [2.5,2,-1]);
		_gola4fed setPosATL (_obj modelToWorld [4.5,2,-1]);
		_gola5fed setPosATL (_obj modelToWorld [-1,-2,-1]);
		_gola6fed setPosATL (_obj modelToWorld [2.5,-2,-1]);
		_gola7fed setPosATL (_obj modelToWorld [2.5,-2,-1]);
		_gola8fed setPosATL (_obj modelToWorld [4.5,-2,-1]);
		_moulafed setPosATL (_obj modelToWorld [13.7,4,-1]);
		_moulafed2 setPosATL (_obj modelToWorld [9.7,4,-1]);
		_moulafed3 setPosATL (_obj modelToWorld [13.7,-4,-1]);
		_moulafed4 setPosATL (_obj modelToWorld [9.7,-4,-1]);

		_moulafed setDir _dir - 360;
		_moulafed2 setDir _dir - 360;
		_moulafed3 setDir _dir - 180;
		_moulafed4 setDir _dir - 180;
