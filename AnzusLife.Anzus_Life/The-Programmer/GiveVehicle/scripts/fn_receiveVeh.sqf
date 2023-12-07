#include "..\..\script_macros.hpp"
/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
_from = param [0,objNull,[objNull]];
_vehicle = param [1,objNull,[objNull]];
_price = param [2,0,[0]];

if (_price > BANK) exitWith {[1,(["STR_NOT_ENOUGHT_BANK"] call max_giveVeh_fnc_localize)] remoteExecCall ["life_fnc_broadcast",_from];};

_action = [
    format [(["STR_CONFIRM_TEXT"] call max_giveVeh_fnc_localize), name _from, typeOf _vehicle, [_price] call life_fnc_numberText],
    (["STR_CONFIRM_HEADER"] call max_giveVeh_fnc_localize), 
    localize "STR_Global_Yes", 
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [player,_vehicle,_price] remoteExecCall ["max_giveVeh_fnc_infoBack",_from];
    hint format [(["STR_SUCCES_RECEIVE_VEHICLE"] call max_giveVeh_fnc_localize),typeof _vehicle,name _from];
    BANK = BANK - _price;
    [1] call SOCK_fnc_updatePartial;

    if !(_vehicle in life_vehicles) then {
        life_vehicles pushBack _vehicle;
        [getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",2];
    };
} else {
    [1,format [(["STR_REFUSE_GIVE_VEHICLE"] call max_giveVeh_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_from];
};