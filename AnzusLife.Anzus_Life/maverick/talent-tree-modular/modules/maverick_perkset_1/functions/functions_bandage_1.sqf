scriptName "functions_bandage_1";
_ownsDependency1 = [life_currentExpPerks, "perk_bandage_1"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_bandage_2"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_bandage = 0.05;
};
