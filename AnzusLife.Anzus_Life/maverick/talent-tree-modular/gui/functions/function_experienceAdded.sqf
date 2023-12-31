#include "..\..\..\..\script_macros.hpp"
scriptName "function_experienceAdded";

try {
	disableSerialization;

	params [
		["_data", [], [[]]],
		["_message", "", [""]]
	];

	{
		private _dataBlock = _x;
		private _bottomConfig = _x param [0];
		private _topConfig = _x param [1, configNull, [configNull]];
		private _totalExpBeforeAdd = _x param [2];
		private _expAdded = _x param [3];
		private _completedLevel = _x param [4];
		private _titleDisplay = displayNull;

		if (isNull _topConfig) then {

		} else {
			private _expTop = (getNumber (_topConfig >> "expRequired")) - (getNumber (_bottomConfig >> "expRequired"));
			private _oldExp = _totalExpBeforeAdd - (getNumber (_bottomConfig >> "expRequired"));
			private _newExp = _oldExp + _expAdded;

			"TTM_GUI_RscTitleExperienceAdded" cutRsc ["TTM_GUI_RscTitleExperienceAdded", "PLAIN"];
			_titleDisplay = uiNamespace getVariable ["TTM_GUI_RscTitleExperienceAdded", displayNull];
			_ctrlProgress = _titleDisplay displayCtrl 5;
			if (isNull _titleDisplay) throw "Title display could not be found";	
			_ctrlActionText = _titleDisplay displayCtrl 4;
			_ctrlActionText ctrlSetPosition [0.445312 * safezoneW + safezoneX, 0.863 * safezoneH + safezoneY, 0.237187 * safezoneW, 0.022 * safezoneH];
			_ctrlActionText ctrlSetFade 1;
			_ctrlActionText ctrlCommit 0;
			_ctrlActionText ctrlSetStructuredText parseText format ["<t size='1' align='left' shadow='2'><t color='#FE6B2E'>+%1EXP</t> <t color='#FFFFFF'>%2</t></t>", _expAdded, _message ];
			_ctrlActionText ctrlSetPosition [0.345312 * safezoneW + safezoneX, 0.863 * safezoneH + safezoneY, 0.237187 * safezoneW, 0.022 * safezoneH];
			_ctrlActionText ctrlSetFade 0;
			_ctrlActionText ctrlCommit 1;	
			_ctrlInfoText = _titleDisplay displayCtrl 3;

			_eventSetting = MAIN_SETTINGS("Events","Maverick");
			if ((getNumber (_eventSetting >> "enable_doubleXP")) isEqualTo 1) then {
				_ctrlInfoText ctrlSetStructuredText parseText format ["<t size='1' align='right' shadow='0' color='#FFFFFF'>%1EXP (2x XP)</t></t>", _newExp];	
			} else {
				_ctrlInfoText ctrlSetStructuredText parseText format ["<t size='1' align='right' shadow='0' color='#FFFFFF'>%1EXP</t></t>", _newExp];	
			};
			
			private _startProgress = (_oldExp / _expTop);
			private _endProgress = (_newExp / _expTop);
			private _progressToAdd = _endProgress - _startProgress;
			private _progressToAddPerInterval = _progressToAdd / 100;

			_ctrlProgress progressSetPosition _startProgress;

			for "_i" from 1 to 100 do
			{
				_ctrlProgress progressSetPosition ((progressPosition _ctrlProgress) + _progressToAddPerInterval);
				uiSleep 0.001;
			};

			_ctrlProgress progressSetPosition _endProgress;
		};

		waitUntil {isNull _titleDisplay};
	} forEach _data;
} catch {
	[format ["[%1] %2", "function_experienceAdded.sqf", _exception]] call BIS_fnc_error;
};