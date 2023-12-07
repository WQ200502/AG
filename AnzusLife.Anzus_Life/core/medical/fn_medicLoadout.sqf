#include "..\..\script_macros.hpp"
/*
    File: fn_medicLoadout.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads the medic out with the default gear.
*/
private ["_handle"];
_handle = [] spawn ANZUS_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "JD_FDPlain";
player addBackpack "JD_InvPack";
player addHeadgear "H_Cap_grn";
player linkItem "RoleplayRadio";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player addItem "Medikit";

[true,"cprKit",1] call ANZUS_fnc_handleInv;
[true,"personallight",1] call ANZUS_fnc_handleInv;
[true,"toolkit",1] call ANZUS_fnc_handleInv;
[true,"donuts",2] call ANZUS_fnc_handleInv;
[true,"waterBottle",2] call ANZUS_fnc_handleInv;

[] call ANZUS_fnc_saveGear;