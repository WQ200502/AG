scriptName "functions_rebel_veh";
_ownsDependency = [life_currentExpPerks, "perk_rebel_veh"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency) then {
	mav_ttm_var_vehrebel = 1;
};