#include "..\..\script_macros.hpp"

if ((missionNamespace getVariable ['mav_ttm_var_relicReward',0]) isEqualTo 0) exitwith {["在完成这个任务之前你需要完成第一个任务！","true","slow"] call ANZUS_fnc_notificationSystem;};
if ((missionNamespace getVariable ['mav_ttm_var_relicReward2',0]) isEqualTo 1) exitwith {["你已经完成了这个任务！","true","slow"] call ANZUS_fnc_notificationSystem;};

if (!(ITEM_VALUE("relicFed") > 0)) exitWith {["你没有吃过的遗物！","false","slow"] call ANZUS_fnc_notificationSystem; };

[false,"relicFed",1] call ANZUS_fnc_handleInv;

[3] call ANZUS_fnc_updatePartial;
disableSerialization;

private _selectedPerkConfig = missionConfigFile >> "Maverick_TTM" >> "Perks" >> "functions_relicReward2";

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

["relic3"] spawn mav_ttm_fnc_addExp;
