/*

	Filename: 	SunriseClient_effects_hazardZone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
	life_radx_used = true; life_hazard_fogTime = 111111;
*/
#include "..\script_macros.hpp"
if !(life_hazard_guided) exitWith {
	while {true} do {
		player say3d "radiation1";player say3d "radiation1";
		//systemChat "Вы находитесь в радиоактивной зоне без проводника!!! Вы погибнете мучительной смертью!!!";
		
		["error","",format ["Вы находитесь в радиоактивной зоне без проводника!!! Вы погибнете мучительной смертью!!!"],true] call SunriseClient_message;
		if ((damage player) < 0.89) then {
			player setDamage ((damage player) + 0.1);
		} else {
			[player,player] call SunriseClient_dmg_Agony;
		};

		uiSleep 3;
	};
};
life_hazard_guided = false;
playSound "vhod_zone";
playMusic "fon_zone";
5 fadeMusic 0.5;
private _music_time = time;// 5 min 50 sec

while {true} do {
	if (vehicle player != player) then {vehicle player setDamage 1};
	if ((LSALIVE(player)) AND (headgear player != "Skyline_HeadGear_NBC_Hazmat_01_F" OR goggles player != "Skyline_Glasses_Masque_GP5_01_F" OR uniform player != "Skyline_Character_U_CivilD_01_F")) then {
		player say3d "radiation1";
		//systemChat "Вы находитесь в радиоактивной зоне !!! Без специальной защиты вы погибнете мучительной смертью!!!";	

		["error","",format ["Вы находитесь в радиоактивной зоне !!! Без специальной защиты вы погибнете мучительной смертью!!!"],true] call SunriseClient_message;
		if ((damage player) < 0.89) then {
			player setDamage ((damage player) + 0.025);
		} else {
			[player,player] call SunriseClient_dmg_Agony;
		};
	};
	if (life_hazard_fogTime < time) then {[] spawn SunriseClient_hazard_makeFog};
	if (time - _music_time > 350) then {playMusic "fon_zone"; _music_time = time};
	//Визуальные эффекты
	if (EQUAL(LIFE_PPE_ANOMALY_COLOR,-1)) then {
		//Затемняем экран
		LIFE_PPE_ANOMALY_COLOR = ppEffectCreate ["ColorCorrections", 1000];
		LIFE_PPE_ANOMALY_COLOR ppEffectEnable true;
		LIFE_PPE_ANOMALY_COLOR ppEffectAdjust [0.75, 0.9, 0,[87, 85, 24, 0.0001],[1, 1, 1, 1],[1, 1, 1, 0]]; 
		LIFE_PPE_ANOMALY_COLOR ppEffectCommit 10;
	};
	if (EQUAL(LIFE_PPE_ANOMALY_FILMGRAIN,-1)) then {
		//Рябь
		LIFE_PPE_ANOMALY_FILMGRAIN = ppEffectCreate ["FilmGrain", 1100];
		LIFE_PPE_ANOMALY_FILMGRAIN ppEffectEnable true;
		LIFE_PPE_ANOMALY_FILMGRAIN ppEffectAdjust [0.02,0.2,1,0.2,1.0,0];
		LIFE_PPE_ANOMALY_FILMGRAIN ppEffectCommit 0;
	};	
	if (EQUAL(LIFE_PPE_ANOMALY_COLORINVERSION,-1)) then {
		//Цвет
		LIFE_PPE_ANOMALY_COLORINVERSION = ppEffectCreate ["ColorInversion", 2500];
		LIFE_PPE_ANOMALY_COLORINVERSION ppEffectEnable true;
		LIFE_PPE_ANOMALY_COLORINVERSION ppEffectAdjust [0.1, 0.1, 0.2];
		LIFE_PPE_ANOMALY_COLORINVERSION ppEffectCommit 0;
	};	
	found_anomalies = [];
	{
		_type = _x getVariable "anomaly_type";
		if (!(isNil "_type") && (player distance _x) < 100) then {
			found_anomalies pushBack _x;
			private _source = _x getVariable ["anomaly_particle_source", objNull];
			if (isNull _source) then {
				// create idle effect
				private _proxy = "Land_HelipadEmpty_F" createVehicleLocal position _x;
				_proxy enableSimulation false;
				_proxy setPos (_x modelToWorld [0,0,0]);
				private _source = "#particlesource" createVehicleLocal getPos _x;
				_source setPosATL (getPosATL _x);
				switch (_type) do {
					case 1: {[_proxy, _source, "idle"] call SunriseClient_hazard_effectMeatgrinder};
					case 2: {[_proxy, _source, "idle"] call SunriseClient_hazard_effectSpringboard};
					case 3: {[_proxy, _source, "idle"] call SunriseClient_hazard_effectBurner};
					case 4: {[_proxy, _source, "idle"] call SunriseClient_hazard_effectElectra};
					default {};
				};
				_x setVariable ["anomaly_particle_proxy", _proxy];
				_x setVariable ["anomaly_particle_source", _source];
			};
		};
		false
	} count anomalies_holder;
	_diff = active_anomalies - found_anomalies;
	{
		deleteVehicle (_x getVariable "anomaly_particle_proxy");
		deleteVehicle (_x getVariable "anomaly_particle_source");
		false
	} count _diff;
	active_anomalies = found_anomalies;

	uiSleep 3;
};