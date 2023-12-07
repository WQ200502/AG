#include "..\..\script_macros.hpp"
private ["_uiDisp","_time","_timer","_amt","_item","_cash","_cashRand","_bomb","_reqItem","_perkTime"];

params [["_obj",objNull,[objNull]], ["_ply",objNull,[objNull]], "", ["_type","",[""]]];

_var = missionNamespace getVariable ["AnzusLife_MajorCrime",time];
_formatTime = [(1800 - (ceil(serverTime - _var))), "MM", false] call BIS_fnc_secondsToString;
if ((time - _var) < 1800) exitWith {[format["最近发生了重大犯罪，您必须等待 %1 更多分钟.",_formatTime],true,"slow"] call ANZUS_fnc_notificationSystem;};

if (isNull _obj) exitWith {};
if (isNull _ply) exitWith {};
if(!([_obj] call AnzusLife_GetDoor IN ["door11","vault_door","buildingcasino2_vaultdoor"])) exitWith {["您必须在银行金库中查看此操作","false","slow"] call ANZUS_fnc_notificationSystem;};
if (_obj getVariable ["bankOpen",false]) exitWith {["保险箱已经打开!","false","slow"] call ANZUS_fnc_notificationSystem;};
if (_obj getVariable ["chargeplaced",false]) exitWith {["已放置钻孔.!","false","slow"] call ANZUS_fnc_notificationSystem;};
if (_type isEqualTo "") exitWith {["一个开发人员很笨，告诉他们这是行动.","false","slow"] call ANZUS_fnc_notificationSystem;};
if !(_ply isEqualTo player) exitWith {["你不等于你自己.","false","slow"] call ANZUS_fnc_notificationSystem;};
if !(playerSide isEqualTo civilian) exitWith {["你需要是市民?","false","slow"] call ANZUS_fnc_notificationSystem;};
if ((west countSide playableUnits) < 6) exitWith {[ format ["有 %1 警察在线, 需要6个警察在线." , (west countSide playableUnits)],true,"slow"] call ANZUS_fnc_notificationSystem;};

_class = MAIN_SETTINGS("MajorCrimes",_type);
if !(isClass _class) exitWith {["一个开发人员很笨, 告诉他们这是配置.","false","slow"] call ANZUS_fnc_notificationSystem;};

	life_major_amount = nil;
	[] remoteExecCall ["AnzusLife_TotalItems", 2];
	_time = time;

	waitUntil {!isNil "life_major_amount" || (time - _time) > 5};
	[cursorObject] spawn ANZUS_fnc_spawndrill;
	removeBackpack player;

	if ((time - _time) > 5) then {
		life_major_amount = 6;
	} ;

	_amt = life_major_amount;
	if (_amt > 9) then {
		_amt = 9;
	};

	if (configName _class == "bank") then {
		_amt = ceil (_amt / 2);
	};
	_item = selectRandom (getArray (_class >> "items"));

	_time = ((getNumber (_class >> "time") ));
	_perkTime = ((missionNamespace getVariable ["mav_ttm_var_robbingMultiplier", 1]) - 1);
	_time = _time - (_time * _perkTime);
	_time = _time + time;

	_location = nearestLocation [position player,"NameCityCapital"];
	_distance = position player distance _location;
	if (_distance > 500) then {
		_location = nearestLocation [position player,"NameCity"];
	};
	If (typeOf _obj isEqualTo "Land_CommonwealthBank") then {
		[text _location,"com"] remoteExec ['ANZUS_fnc_secondAANnews',-2];
	} else {
		If (typeOf _obj isEqualTo "Land_ANZUS_bank") then {
			[text _location,"kam"] remoteExec ['ANZUS_fnc_secondAANnews',-2];
		} else {
			["Casino"] remoteExec ['ANZUS_fnc_AANBank',-2];
		};
	};
	missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];

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
	_weight = ITEM_WEIGHT(_item);
	_totalweight = _weight * _amt;

	_obj setVariable ["chargeplaced",false,true];
	_obj setVariable ["Trunk",[[[_item,_amt]],_totalweight],true];
	_obj setVariable ["bankOpen",true,true];
	_obj setVariable ["openInv",false,true];
	_obj setVariable ["openInvPID",nil,true];
	_obj setVariable ["vault_open",true,true];
	missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];
	_MajorSettings = MAIN_SETTINGS("MajorCrimes","Bank");

	["钻孔已完成。 现在您可以打开保管库门!","true","slow"] call ANZUS_fnc_notificationSystem;
	deleteVehicle bankdrill;

	switch (typeOf _obj) do {
		case "Land_CommonwealthBank": {
			_moula = createVehicle ["A3l_MoneyPile",[0,0,999],[], 0, "NONE"];
			_moula setPosATL (_obj modelToWorld [1.3,-3,4.7]);
			_dir = getDir _obj + 90;
			_moula setDir _dir;
			_amount = getNumber(_MajorSettings >> "bank_amount");
			_moula setVariable ["vault_money",_amount,true];
		};

		case "Land_ANZUS_bank": {
			_moula = createVehicle ["A3l_MoneyPile",[0,0,999],[], 0, "NONE"];
			_moula2 = createVehicle ["A3l_MoneyPile",[0,0,999],[], 0, "NONE"];
			_moula setPosATL (_obj modelToWorld [-12.29, 9.31, 0.859]);
			_moula2 setPosATL (_obj modelToWorld [-12.29, 6, 0.859]);
			_dir = getDir _obj - 270;
			_moula setDir _dir;
			_moula2 setDir _dir;
			_amount = getNumber(_MajorSettings >> "bank_amount");
			_amount = _amount + round(random 100000);
			_amount2 = getNumber(_MajorSettings >> "bank_amount");
			_amount2 = _amount2 + round(random 100000);
			_moula setVariable ["vault_money",_amount,true];
			_moula2 setVariable ["vault_money",_amount2,true];

		};

		case "Land_buildingsCasino2": {
			_gola = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
			_gola setPosATL (_obj modelToWorld [12.5,-23,-17.7]);
			_gola2 = createVehicle ["HL_Or",[0,0,999],[], 0, "NONE"];
			_gola2 setPosATL (_obj modelToWorld [9,-23,-17.7]);
			_amountgold = getNumber(_MajorSettings >> "Gold_amount");
			_gola setVariable ["vault_gold",_amountgold,true];
			_gola2 setVariable ["vault_gold",_amountgold,true];

			if (!isNil {(group player) getVariable ["gang_name",""]}) then {
				_gangrole = (group player) getVariable ["gang_role",[]];
				if (_gangrole isEqualTo []) exitWith {};
				_gangselect = _gangrole select 0;
				if (_gangselect != 0) then {
					_task = "Defunding the Mafia";
					_check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
					if (!_check) then {[_task] remoteExec ["AnzusLife_UnlockTask",2];};
					};
			};
			};
	};
