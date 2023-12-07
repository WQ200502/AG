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
_unit = param [0,objNull,[objNull]];
_vehicle = param [1,objNull,[objNull]];
_price = param [2,0,[0]];

_uid = getPlayerUID _unit;
_name = name _unit;

BANK = BANK + _price;
[1] call SOCK_fnc_updatePartial;
life_vehicles = life_vehicles - [_vehicle];

_vehicle setVariable ["vehicle_info_owners",[[_uid,_name]],true];
_vInfo = _vehicle getVariable ["dbInfo",[]];
_vehicle setVariable ["dbInfo",[_uid,(_vInfo select 1)],true];

[_vehicle,_vInfo] remoteExecCall ["max_giveVeh_fnc_giveVehicle",2];
hint format [(["STR_SUCCES_GIVE_VEHICLE"] call max_giveVeh_fnc_localize),typeOf _vehicle,_name];
