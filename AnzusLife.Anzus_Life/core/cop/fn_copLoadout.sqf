/*
    File: fn_copLoadout.sqf
    Author: Bryan "Tonic" Boardwine
    Edited: Itsyuka

    Description:
    Loads the cops out with the default gear.
*/
private ["_handle"];
_handle = [] spawn ANZUS_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "AG_Corrections1";
player addBackpack "officer_belt";
player addHeadGear "JD_SheriffHat_Black";
player addWeapon "taser";
player addMagazines ["vvv_np_magazine_taser",5];

player linkItem "RoleplayRadio";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemGPS";

[true,"keyCard",1] call ANZUS_fnc_handleInv;
[true,"panicbutton",1] call ANZUS_fnc_handleInv;
[true,"toolkit",1] call ANZUS_fnc_handleInv;
[true,"donuts",2] call ANZUS_fnc_handleInv;
[true,"waterBottle",2] call ANZUS_fnc_handleInv;
[true,"spikeStrip",1] call ANZUS_fnc_handleInv;

player setVariable ["copLevel",1,true];
call ANZUS_fnc_setFreq;
