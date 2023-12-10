/*

	Filename:   SunriseServer_system_turtleZone.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
params [
	["_zoneName","",[""]],
	["_animals_per_player",10,[0]]
];
if (_zoneName isEqualTo "") exitWith {};

private _radius = (getMarkerSize _zoneName) select 0;
private _dist = _radius + 100;
private _zone = getMarkerPos _zoneName;
turtles = [];

while {true} do {
	_players_count = {(_x distance _zone) < _dist} count playableUnits;
	_needed_animals = _players_count * _animals_per_player;
	turtles = turtles - [objNull];
	_counted_animals = count turtles;
	if (_players_count > 0 AND (_needed_animals * 0.5) > _counted_animals) then {
		for "_i" from _counted_animals to _needed_animals do {
			_animal = createAgent ["Turtle_F",_zone,[_zoneName],_radius,"FORM"];
			turtles pushBack _animal;
		};
	} else {
		if (_players_count isEqualTo 0) then {
			{deleteVehicle _x} forEach turtles;
			turtles = [];
		};
	};
	uiSleep 30;
};