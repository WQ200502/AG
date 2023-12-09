/*

	Filename: 	SunriseClient_suppression_mainHandler.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _deleted = false;
{
	_x params [
		"_projectile",
		"_dDist", // "Detection Distance"
		"_hit"
	];
	if !(alive _projectile) then {
		life_suppr_mainArray set [_forEachIndex, objNull];
		_deleted = true;
	} else {
		private _distanceToPlayer = _projectile distance player;
		if (_distanceToPlayer <= _dDist) then {
			private _pPos = getPosATL _projectile;

			private _lis = lineIntersectsSurfaces [ATLToASL _pPos, eyePos player, player];
			if !(_lis isEqualTo []) then {
				_dDist = _dDist * 0.65
			};
			
			if (_distanceToPlayer <= _dDist) then {
				private _factor  = 1 - (_distanceToPlayer / _dDist);
				private _divisor = 25 - (9 * _factor);
				
				life_suppr_lastShotAt = time;

				[_factor] call SunriseClient_suppression_impact;
				
				if (_divisor != 0) then {
					if ((vehicle player isEqualTo player) || (isTurnedOut player)) then {
						private _add = life_suppr_buildupFactor * (_hit / _divisor);
						//hintSilent format [" dDist: %1 \n dToPlayer: %2 \n Hit: %3 \n Factor: %4 \n Divisor: %5 \n Add: %6",_dDist,_distanceToPlayer,_hit,_factor,_divisor,_add];
						life_suppr_Threshold = (life_suppr_Threshold + _add) min 30;
					};
				};
			};

			life_suppr_mainArray set [_forEachIndex, objNull];
            _deleted = true;
		};
	};
	nil
} forEach life_suppr_mainArray;

if (_deleted) then {
    life_suppr_mainArray = life_suppr_mainArray - [objNull];
    _deleted = false;
};