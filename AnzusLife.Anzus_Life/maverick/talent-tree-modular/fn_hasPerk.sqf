scriptName "fn_hasPerk";

params ["_arr","_toFind"];

_found = false;
_value = false;
{
    private _first = _x param[0];
    if (_first isEqualType []) then {
        if (_first select 1) then {
            if (_first param[0] isEqualTo _toFind) then {
                _found = true;
                _value = true;
            } else {
                [_x param[1], _toFind] call mav_ttm_fnc_hasPerk;
            };
        };
    } else {
        if (_first isEqualTo _toFind) then {
            _found = true;
            _value = _x param[1];
        };
    };
    if (_found) exitWith {};
    true
} count +_arr;
_value