closeDialog 0;
AnzusLife_CocaineIsActive = true;

life_cocaine_effect = time;
["您吸了一些可卡因，现在可以快活30分钟，而且更加口渴.","false","slow"] call ANZUS_fnc_notificationSystem;
player enableFatigue false;
waitUntil {!alive player || ((time - life_cocaine_effect) > (30 * 60))};
if (mav_ttm_var_stamina isEqualTo 0) then {player enableFatigue true;};

AnzusLife_CocaineIsActive = false;