#include "..\..\script_macros.hpp"

params [
    ["_value",0,[0]],
    ["_from",objNull,[objNull]]
];

_player = name _from;
if (isNil "_player") exitWith {};
if (_value <= 0) exitWith {/*[format["%1/%2 试图传输0以下的数字！",_player,getPlayerUID _from], "money.log"] remoteExec ["AH_LogInterface",2];*/};
if (isNull _from) exitWith {};
if (getPlayerUID _from isEqualTo getPlayerUID player) exitWith {/*[format["%1/%2 试图把钱转给他自己！",name player,getPlayerUID player], "money.log"] remoteExec ["AH_LogInterface",2];*/};
if (!(isPlayer _from)) exitWith {};

[_value] call xiyECYLNxrKhXypAac;
[1] call ANZUS_fnc_updatePartial;
[format[localize "STR_ATM_WireTransfer",_player,[_value] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;
[[format["%1/%2 has been transfered $%3 from %4/%5",profileName,(getPlayerUID player),_value,_player,getPlayerUID _from]],"money"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
