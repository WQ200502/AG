scriptName "functions_bandage_4";
_ownsDependency1 = [life_currentExpPerks, "perk_bandage_4"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_bandage_5"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_bandage = 0.2;
};
