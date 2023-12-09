/*

	Filename: 	SunriseClient_kron_strToArray.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _in = _this select 0;
private _arr = toArray(_in);
private _out = [];

for "_i" from 0 to (count _arr)-1 do {
	_out = _out + [toString([_arr select _i])];
};
_out