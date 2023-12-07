#include "..\..\script_macros.hpp"

_hasPerk = [life_currentExpPerks, "functions_quests"] call mav_ttm_fnc_hasPerk;
if (!_hasPerk) exitWith {["You do not have the quests catagory unlocked!","false","slow"] call ANZUS_fnc_notificationSystem;};
if ((missionNameSpace getVariable ["mav_ttm_var_artifactReward",0]) isEqualTo 1) exitwith {["你已经完成了这个任务！","true","slow"] call ANZUS_fnc_notificationSystem;};

if (!(ITEM_VALUE("artifact1") > 0)) exitWith {["你少了一件神器！","true","slow"] call ANZUS_fnc_notificationSystem; };
if (!(ITEM_VALUE("artifact2") > 0)) exitWith {["你少了一件神器！","true","slow"] call ANZUS_fnc_notificationSystem;};
if (!(ITEM_VALUE("artifact3") > 0)) exitWith {["你少了一件神器！","true","slow"] call ANZUS_fnc_notificationSystem;};
if (!(ITEM_VALUE("artifact4") > 0)) exitWith {["你少了一件神器！","true","slow"] call ANZUS_fnc_notificationSystem; };
if (!(ITEM_VALUE("artifact5") > 0)) exitWith {["你少了一件神器！","true","slow"] call ANZUS_fnc_notificationSystem;};
if (!(ITEM_VALUE("artifact6") > 0)) exitWith {["你少了一件神器！","true","slow"] call ANZUS_fnc_notificationSystem;};

[false,"artifact1",1] call ANZUS_fnc_handleInv;
[false,"artifact2",1] call ANZUS_fnc_handleInv;
[false,"artifact3",1] call ANZUS_fnc_handleInv;
[false,"artifact4",1] call ANZUS_fnc_handleInv;
[false,"artifact5",1] call ANZUS_fnc_handleInv;
[false,"artifact6",1] call ANZUS_fnc_handleInv;

[3] call ANZUS_fnc_updatePartial;
disableSerialization;

private _selectedPerkConfig = missionConfigFile >> "Maverick_TTM" >> "Perks" >> "functions_artifactReward";

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

["Artifact"] spawn mav_ttm_fnc_addExp;
[125000] call cKGySJkJHNXbPgorKa;
