/*

	Filename: 	SunriseClient_evh_damageHandle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\script_macros.hpp"
params ["_unit", "_selection", "_damage", "_shooter", "_projectile", "_hitPointIndex", "_instigator"];

//баг с определением патрона
if (_projectile isEqualType objNull) then {
	_projectile = typeOf _projectile;
	_this set [4, _projectile];
};

//не важные нам повреждения
if (EQUAL(_selection,"hands")) exitWith {_unit getHit "hands"};
if (EQUAL(_selection,"legs")) exitWith {_unit getHit "legs"};
if (EQUAL(_selection,"arms")) exitWith {_unit getHit "arms"};

//получаем данные о текущем уроне
private _currentDmg = [_unit getHitIndex _hitPointIndex, damage _unit] select (_hitPointIndex < 0);

format["DMG - U: %1 - SEL: %2 - D: %3 - SHO: %4 - P: %5 - I: %6 - TR: %7",_unit, _selection, _damage, _shooter, _projectile, _hitPointIndex,_instigator] call SunriseClient_system_log;

if (alive _unit && _damage > 0) then {		
	if (LSINCAP(_unit)) then {
		"DMG - In agony - call _KilledInAgony" call SunriseClient_system_log;
		[_unit,_shooter,_instigator,_damage,_projectile,_selection] spawn SunriseClient_dmg_KilledInAgony;		
	} else {
		//сразу ловим тейзер и пейнтбол
		if (_projectile in ["DDOPP_B_Taser","Caseless_blau"] OR life_is_arrested) then {			
			_damage = _currentDmg;
			[_unit,_shooter,_projectile] spawn SunriseClient_dmg_NotLetal;
		} else {
			//остальные снаряды по человеку, но сперва урон от техники
			if (NOTINVEH(_unit) && {!(vehicle _shooter isEqualTo _shooter)} && {EQUAL((driver (vehicle _shooter)),_shooter) OR (fullCrew [vehicle _shooter, "cargo"]) findIf {_x select 0 isEqualTo _shooter} > -1}) then {
				"DMG - VRDM" call SunriseClient_system_log;
				_damage = _currentDmg;
				[_unit,_shooter] call SunriseClient_dmg_Vehicle;
			} else {				
				//Отправляем ли мы в агонию игрока?
				if (_damage >= 0.89) then {
					"DMG - Call Agony!" call SunriseClient_system_log;
					[{
						_this call SunriseClient_dmg_Agony;
					}, [_unit,_shooter,_instigator,_projectile,_selection]] call CBA_fnc_execNextFrame;
				} else {
					private _dmg = _damage - _currentDmg; //сколько в итоге прилетело?		
					//не агония, но урон надо обработать
					if (isNull _shooter && !(NOTINVEH(_unit))) then {
						//может мы ехали в машине и врезались куда-то? здесь будем делать поправку на будущий апгрейд "Ремни безопасности"						
						"DMG - Damage in car?" call SunriseClient_system_log;
						if (_dmg > 0) then {
							switch (true) do {
								case (_dmg > 0.3 && _dmg <= 0.45) : {									
									//[{_this spawn SunriseClient_addBuff}, ["life_bleeding","debuff",300], random(2)] call CBA_fnc_waitAndExecute;
									["Кровотечение","life_bleeding",180,0] call SunriseClient_addBuff;
								}; 								
								case (_dmg > 0.45 && _dmg <= 0.9) : {
									//[{_this spawn SunriseClient_addBuff}, ["life_critHit","debuff"], random(2)] call CBA_fnc_waitAndExecute;
									["Болевой шок","life_pain_shock",320,0] call SunriseClient_addBuff;
								}; 
								default {}; 
							};
						};
					} else {
						//оставшийся урон - урон от оружия			
						"DMG - just damage" call SunriseClient_system_log;
						if (_dmg > 0) then {
							switch (true) do {
								case (_dmg > 0.1 && _dmg <= 0.3) : {
									//[{_this spawn SunriseClient_addBuff}, ["life_bleeding","debuff",300], random(2)] call CBA_fnc_waitAndExecute;
									["Кровотечение","life_bleeding",180,0] call SunriseClient_addBuff;
								}; 
								case (_dmg > 0.3 && _dmg <= 0.45) : {
									//[{_this spawn SunriseClient_addBuff}, ["life_pain_shock","debuff"], random(2)] call CBA_fnc_waitAndExecute;
									["Болевой шок","life_pain_shock",300,0] call SunriseClient_addBuff;
								}; 
								case (_dmg > 0.45 && _dmg <= 0.9) : {
									//[{_this spawn SunriseClient_addBuff}, ["life_critHit","debuff"], random(2)] call CBA_fnc_waitAndExecute;
									["Болевой шок","life_pain_shock",400,0] call SunriseClient_addBuff;
								}; 
								default {}; 
							};
						};
					};					
				};
			};
		};
	};
} else {
	_damage = _currentDmg;
	"DMG - Skip" call SunriseClient_system_log;
};

_damage = _damage min 0.89;
_damage