#include "..\..\script_macros.hpp"

_suspectsName = ctrlText 1210002;
_timeOfArrest = ctrlText 1210003;
_listOfCharges = ctrlText 1210004;
_sentencingLength = ctrlText 1210005;
_pleaTime = ctrlText 1210006;
_assistingOfficers = ctrlText 1210007;
_playerName = name player;
_allElements = [_suspectsName, _timeOfArrest, _listOfCharges, _sentencingLength, _pleaTime, _assistingOfficers];

_fake = false;
{ if (_x isEqualTo "") exitWith {_fake = true;}; } forEach _allElements;

if (_fake) exitWith {["您已将条目留空，如果需要空白条目，请填写 N/A.","true","slow"] call ANZUS_fnc_notificationSystem;};

[_suspectsName, _timeOfArrest, _listOfCharges, _sentencingLength, _pleaTime, _assistingOfficers, _playerName] remoteExec ["ANZUS_fnc_saveConviction",RSERV];
["You have sent a conviction log...","true","slow"] call ANZUS_fnc_notificationSystem;
closeDialog 0;