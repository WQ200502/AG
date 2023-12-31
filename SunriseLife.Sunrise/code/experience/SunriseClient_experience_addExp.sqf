/*

	Filename: 	SunriseClient_experience_addExp.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
scriptName "fn_addExp";
#define __filename "fn_addExp.sqf"

params [
	["_action", "", [""]],
	["_factor", 1, [1]]
];

scopeName "main";

private _baseConfig = missionConfigFile >> "Experience";
private _actionConfig = _baseConfig >> "Actions" >> _action;
private _expGained = getNumber (_actionConfig >> "expToAdd");
_expGained = switch (call life_donator) do {
	case 1: {_expGained * 1.10};
	case 2: {_expGained * 1.15};
	case 3: {_expGained * 1.20};
	case 4: {_expGained * 1.25};
	default {_expGained};
};
_expGained = round (_expGained * _factor);
if (_expGained < 1) exitWith {};

private _messageEntry = _actionConfig >> "message";
private _message = getText _messageEntry;
private _level = life_currentExpLevel;
private _levelConfigBase = _baseConfig >> "Levels";
private _currentExpLevelConfig = _levelConfigBase >> format["Level_%1", life_currentExpLevel];
private _nextLevelConfig = _levelConfigBase >> format["Level_%1", _level + 1];

// Max level
if (!isClass _nextLevelConfig) exitWith {};

private _nextLevelExp =  getNumber (_nextLevelConfig >> "expRequired");
private _nextLevelPerkPoints =  getNumber (_nextLevelConfig >> "perkPointsOnUnlock");
private _dif = _expGained;
private _gainedPerkPoints = 0;
private _iteratedExp = life_currentExp;
private _progressData = [];

while {_dif > 0} do {

	scopeName "iteration";

	private "_iteratedLevelExp";
	private "_iteratedPerkPoints";
	private "_iteratedLevelConfig";
	private "_iteratedCurrentConfig";
	if !(_level isEqualTo life_currentExpLevel) then {
		_iteratedLevelConfig = _levelConfigBase >> format["Level_%1", (_level + 1)];
		if (!isClass _iteratedLevelConfig) then {
			//Must be max level
			hint "Trying to break out..";
			breakOut "iteration";
		};
		_iteratedLevelExp =  getNumber (_iteratedLevelConfig >> "expRequired");
		_iteratedPerkPoints =  getNumber (_iteratedLevelConfig >> "perkPointsOnUnlock");
		_iteratedCurrentConfig = _levelConfigBase >> format["Level_%1", _level];
	} else {
		_iteratedLevelConfig = _nextLevelConfig;
		_iteratedLevelExp = _nextLevelExp;
		_iteratedPerkPoints = _nextLevelPerkPoints;
		_iteratedCurrentConfig = _currentExpLevelConfig;
	};

	private _expGap = _iteratedLevelExp - _iteratedExp;
	_dif = _dif - _expGap;

	if (_dif < 0) exitWith {
		_progressData pushBack [_iteratedCurrentConfig, _iteratedLevelConfig, _iteratedExp, _dif + _expGap, false];
	};

	_level = _level + 1;
	_gainedPerkPoints = _gainedPerkPoints + _iteratedPerkPoints;

	_progressData pushBack [_iteratedCurrentConfig, _iteratedLevelConfig, _iteratedExp, _expGap, true];

	if (_dif isEqualTo 0) exitWith {};

	_iteratedExp = _iteratedLevelExp;
};

life_currentExpLevel = _level;
life_currentExp = life_currentExp + _expGained;
life_currentPerkPoints = life_currentPerkPoints + _gainedPerkPoints;

// -- Save to the database
[0,_action] call SunriseClient_experience_clientSendUpdateToServer;

// -- Display
//[_progressData, _message] spawn SunriseClient_experiencegui_experienceAdded;