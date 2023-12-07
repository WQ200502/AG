private ["_handle"];
_handle = [] spawn ANZUS_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_hats = ["anzus_CAP_beanie_1_c","anzus_CAP_beanie_1_h","anzus_CAP_beanie_1_m","anzus_CAP_beanie_2_o","anzus_CAP_beanie4","anzus_CAP_beanie_2_a","anzus_CAP_beanie_1_l","anzus_CAP_beanie_1_b","anzus_CAP_christmas_head_b","anzus_CAP_christmas_head_e","anzus_CAP_christmas_head_g","anzus_CAP_christmas_head2_b","anzus_CAP_christmas_head3_b","anzus_CAP_christmas_head4_d","anzus_CAP_christmas_head_f","anzus_CAP_furcap"];
_clothing = ["cg_lsd1","cg_lambo1","cg_kfc1","cg_homer1"];
player addHeadgear (selectRandom _hats);
player addUniform (selectRandom _clothing);

player addItem "RoleplayRadio"; 
player assignItem "RoleplayRadio";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemGPS";

[] call ANZUS_fnc_saveGear;