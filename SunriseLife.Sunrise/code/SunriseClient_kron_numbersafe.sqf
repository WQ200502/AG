private ["_digitsCount","_modBase","_numberText"];
params[
	["_number",0,[0]],
	["_mod",3,[0]]
];
_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;
_modBase = _digitsCount % _mod;
_numberText = "";
{
	_numberText = _numberText + str _x;
	if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + "";};
} foreach _digits;
_numberText