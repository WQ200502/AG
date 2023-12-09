/*

	Filename: 	SunriseClient_hazard_suckToLocation.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params[
	["_obj",objNull,[objNull]],
	["_pos",[],[[]]],
	["_intensity",1],
	["_duration", 10]
];

private _time = time + _duration;

while {(alive _obj) && (time <= _time)} do {
	_pos2 = getpos _obj;
	_a = ((_pos select 0) - (_pos2 select 0));
	_b = ((_pos select 1) - (_pos2 select 1));
	_obj setVelocity [_a * _intensity, _b * _intensity, 0.2];
};