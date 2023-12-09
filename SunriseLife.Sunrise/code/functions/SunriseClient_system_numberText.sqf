/*
	
	Filename: 	SunriseClient_system_numberText.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _num = param [0,-1,[0]];
private _numbers = [];
while {_num >= 10} do {
	_num = _num / 10;
	_numbers pushBack round ((_num % floor _num) * 10);
	_num = floor  _num;
};
_numbers pushBack _num;
reverse _numbers;

private _numberText = "";
private _digitsCount = count _numbers - 1;
private _modBase = _digitsCount % 3;

{
	_numberText = _numberText + str _x;
	if ((_foreachindex - _modBase) % 3 isEqualTo 0 && !(_foreachindex isEqualTo _digitsCount)) then {_numberText = _numberText + ","};
} foreach _numbers;
_numberText