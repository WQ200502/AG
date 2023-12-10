/*

	Filename:   SunriseServer_system_huntingZone.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
params [
	["_zoneName","",[""]],
	["_animals_per_player",10,[0]]
];
if (_zoneName isEqualTo "") exitWith {};

private _animalList = ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F"];
private _radius = (getMarkerSize _zoneName) select 0;
private _dist = _radius + 100;
private _zone = getMarkerPos _zoneName;
animals = [];

while {true} do {
	_players_count = {(_x distance _zone) < _dist} count playableUnits;
	_needed_animals = _players_count * _animals_per_player;
	animals = animals - [objNull];
	_counted_animals = count animals;
	if (_players_count > 0 AND (_needed_animals * 0.5) > _counted_animals) then {
		for "_i" from _counted_animals to _needed_animals do {
			_animal = createAgent [selectRandom _animalList,_zone,[_zoneName],_radius,"FORM"];
			animals pushBack _animal;
		};
	} else {
		if (_players_count isEqualTo 0) then {
			{deleteVehicle _x} forEach animals;
			animals = [];
		};
	};
	uiSleep 30;
};