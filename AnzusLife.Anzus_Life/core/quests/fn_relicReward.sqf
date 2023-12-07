#include "..\..\script_macros.hpp"

_hasPerk = [life_currentExpPerks, "functions_quests"] call mav_ttm_fnc_hasPerk;
if (!_hasPerk) exitWith {["你没有解锁任务分类！","false","slow"] call ANZUS_fnc_notificationSystem;};
if ((missionNameSpace getVariable ["mav_ttm_var_relicReward",0]) isEqualTo 1) exitwith {["你已经完成了这个任务！","true","slow"] call ANZUS_fnc_notificationSystem;};

if (!(ITEM_VALUE("relic1") > 0)) exitWith {["你没有塔奇遗迹，你需要所有的遗迹才能得到奖励！","true","slow"] call ANZUS_fnc_notificationSystem; };
if (!(ITEM_VALUE("relic2") > 0)) exitWith {["你没有阿尔坎遗迹，你需要所有的遗迹来获得奖励！","true","slow"] call ANZUS_fnc_notificationSystem;};
if (!(ITEM_VALUE("relic3") > 0)) exitWith {["你没有沙克希的遗物，你需要所有的遗物来获得奖励！","true","slow"] call ANZUS_fnc_notificationSystem;};
if (!(ITEM_VALUE("relic4") > 0)) exitWith {["你没有莱尼遗物，你需要所有的遗物才能得到奖励！","true","slow"] call ANZUS_fnc_notificationSystem;};

[false,"relic1",1] call ANZUS_fnc_handleInv;
[false,"relic2",1] call ANZUS_fnc_handleInv;
[false,"relic3",1] call ANZUS_fnc_handleInv;
[false,"relic4",1] call ANZUS_fnc_handleInv;


[3] call ANZUS_fnc_updatePartial;
disableSerialization;

private _selectedPerkConfig = missionConfigFile >> "Maverick_TTM" >> "Perks" >> "functions_relicReward";

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

["relic"] spawn mav_ttm_fnc_addExp;
