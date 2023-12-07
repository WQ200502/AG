#include "..\..\script_macros.hpp"

_hasPerk = [life_currentExpPerks, "functions_quests"] call mav_ttm_fnc_hasPerk;
if (!_hasPerk) exitWith {["你没有解锁任务分类！","false","slow"] call ANZUS_fnc_notificationSystem;};
if ((missionNameSpace getVariable ["mav_ttm_var_ciaReward",0]) isEqualTo 1) exitwith {["You have already completed this quest!","true","slow"] call ANZUS_fnc_notificationSystem;};

if (!(ITEM_VALUE("cia1") > 0)) exitWith {["你没有可卡因中情局的包裹，你需要所有中情局的包裹才能得到奖励！","true","slow"] call ANZUS_fnc_notificationSystem; };
if (!(ITEM_VALUE("cia2") > 0)) exitWith {["你没有大麻中情局的包裹，你需要所有中情局的包裹才能得到奖励！","true","slow"] call ANZUS_fnc_notificationSystem;};
if (!(ITEM_VALUE("cia3") > 0)) exitWith {["你没有冰毒中情局的包裹，你需要所有中情局的包裹才能得到奖励！","true","slow"] call ANZUS_fnc_notificationSystem;};
if (!(ITEM_VALUE("cia4") > 0)) exitWith {["你没有中情局的海洛因包裹，你需要所有的中情局包裹才能得到奖励！","true","slow"] call ANZUS_fnc_notificationSystem;};

[false,"cia1",1] call ANZUS_fnc_handleInv;
[false,"cia2",1] call ANZUS_fnc_handleInv;
[false,"cia3",1] call ANZUS_fnc_handleInv;
[false,"cia4",1] call ANZUS_fnc_handleInv;


[3] call ANZUS_fnc_updatePartial;
disableSerialization;

private _selectedPerkConfig = missionConfigFile >> "Maverick_TTM" >> "Perks" >> "functions_ciaReward";

private _toFind = configName _selectedPerkConfig;

private _exit = false;
private _iterate = {
	{
		private _first = _x param[0];
		if (_first isEqualType []) then {
			if (_first param[0] isEqualTo _toFind) then {
				_first set [1, true];
				_exit = true;
			} else {
				if (_first param[1]) then {
					(_x param[1]) call _iterate;
				};
			};
		} else {
			if (_first isEqualTo _toFind) then {
				_x set [1, true];
				_exit = true;
			};
		};
		if (_exit) exitWith {};
		true
	} count _this;
};

life_currentExpPerks call _iterate;



[_selectedPerkConfig] call TTM_GUI_function_perkUnlocked;


private _initScriptPath = getText (_selectedPerkConfig >> "initScript");
if (_initScriptPath != "") then {
	[] spawn (compileFinal preprocessFileLineNumbers _initScriptPath);
};


[2] call mav_ttm_fnc_clientSendUpdateToServer;
[3] call mav_ttm_fnc_clientSendUpdateToServer;

["cia"] spawn mav_ttm_fnc_addExp;
