#include "..\..\script_macros.hpp"

_hasPerk = [life_currentExpPerks, "functions_quests"] call mav_ttm_fnc_hasPerk;
if (!_hasPerk) exitWith {["您技能尚未解锁该任务类别!","false","slow"] call ANZUS_fnc_notificationSystem;};
if ((missionNameSpace getVariable ["mav_ttm_var_angelReward",0]) isEqualTo 1) exitwith {["You have already completed this quest!","true","slow"] call ANZUS_fnc_notificationSystem;};

if (!(ITEM_VALUE("angel1") > 0)) exitWith {["你还没有从烦恼的天使那里得到光明!","true","slow"] call ANZUS_fnc_notificationSystem; };
if (!(ITEM_VALUE("angel2") > 0)) exitWith {["你还没有从悲伤的天使那里得到光明!","true","slow"] call ANZUS_fnc_notificationSystem;};
if (!(ITEM_VALUE("angel3") > 0)) exitWith {["你还没有从指点天使那里得到光!!","true","slow"] call ANZUS_fnc_notificationSystem;};

[false,"angel1",1] call ANZUS_fnc_handleInv;
[false,"angel2",1] call ANZUS_fnc_handleInv;
[false,"angel3",1] call ANZUS_fnc_handleInv;


[3] call ANZUS_fnc_updatePartial;
disableSerialization;

private _selectedPerkConfig = missionConfigFile >> "Maverick_TTM" >> "Perks" >> "functions_angelReward";

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

["angel"] spawn mav_ttm_fnc_addExp;
[75000] call cKGySJkJHNXbPgorKa;
