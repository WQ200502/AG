/*

	Filename: 	SunriseServer_system_getRestartTime.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _restarttimes = [[04,00,00],[08,00,00],[12,00,00],[16,00,00],[20,00,00],[24,00,00]]; //HH,MM,SS
private _gottime = false;
private _restartTime = -1;
{
	if (_gottime) exitWith {};
	_hardSecondsTime = (((_x#0 * 3600) + (_x#1 * 60)) + _x#2);

	_currentTimestamp = (call compile ("extDB3" callExtension "9:LOCAL_TIME")) select 1;
	_nowSecondsTime = (((_currentTimestamp#3 * 3600) + (_currentTimestamp#4 * 60)) + _currentTimestamp#5);

	if (_nowSecondsTime < _hardSecondsTime AND !(_gottime)) then {
		_restartTime = _hardSecondsTime - _nowSecondsTime;
		_gottime = true;
	};
} forEach _restarttimes;
_restartTime