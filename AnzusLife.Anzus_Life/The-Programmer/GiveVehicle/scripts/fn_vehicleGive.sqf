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
private ["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index"];
disableSerialization;

_display = findDisplay 2700;
(_display displayCtrl 2703) ctrlSetText (["STR_BUTTON_GIVE_VEHICLE"] call max_giveVeh_fnc_localize);
(_display displayCtrl 2704) ctrlSetText (["STR_PRICE_DEFAUT_TEXT"] call max_giveVeh_fnc_localize);
(_display displayCtrl 5404) ctrlSetText (["STR_HEADER"] call max_giveVeh_fnc_localize);

_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;
_near_units = [];

{ if (player distance _x < 20) then {_near_units pushBack _x};} forEach playableUnits;

for "_i" from 0 to (count life_vehicles)-1 do {
    _veh = life_vehicles select _i;
    if (!isNull _veh && alive _veh && (_veh isKindOf "Car") || (_veh isKindOf "Air") || (_veh isKindOf "Ship")) then {
        _color = ((M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _veh),"textures") select (_veh getVariable "Life_VEH_color")) select 0);
        if (isNil "_color") then {_color = ""};
        _text = format ["(%1)",_color];
        if (_text == "()") then {
            _text = "";
        };

        _name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
        _pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
        _idx = _vehicles lbAdd format [(["STR_VEHICLES_LIST"] call max_giveVeh_fnc_localize),_name,round(player distance _veh),_text];
        if (_pic != "pictureStaticObject") then {
            _vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
        };
        _vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
    };
};

{
    if (!isNull _x && alive _x && player distance _x < 20 && !(_x isEqualTo player)) then {
        _plist lbAdd format [(["STR_PLAYERS_LIST"] call max_giveVeh_fnc_localize),_x getVariable ["realname",name _x]];
        _plist lbSetData [(lbSize _plist)-1,str(_x)];
    };
} forEach _near_units;

if (((lbSize _vehicles)-1) isEqualTo -1) then {
    _vehicles lbAdd localize "STR_NOTF_noVehOwned";
    _vehicles lbSetData [(lbSize _vehicles)-1,""];
};