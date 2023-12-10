/*
	
	Filename: 	SunriseServer_database_numberSafe.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _num = param [0,-1,[0]];
private _s = "";
while {_num >= 10} do {
	_num = _num / 10;
	_s = format ["%1%2", round ((_num % floor _num) * 10), _s];
	_num = floor _num;
};
format ["%1%2", _num, _s];