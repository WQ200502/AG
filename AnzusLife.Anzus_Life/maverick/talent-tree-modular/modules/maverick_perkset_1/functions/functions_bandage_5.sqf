scriptName "functions_bandage_5";
_ownsDependency1 = [life_currentExpPerks, "perk_bandage_5"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
	mav_ttm_var_bandage = 0.25;
};
