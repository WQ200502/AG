/*

	Filename: 	SunriseClient_suppression_fired.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params ["_unit","_weapon","","","_ammo","","_projectile"];
if (toLower(_weapon) isEqualTo "put") exitWith {};
if (_ammo isEqualTo "sunrise_Ammo_Swing") exitWith {};

if (isNull _projectile) then {_projectile = nearestObject [_unit, _ammo];};
if (player isEqualTo _unit) exitWith {};
if (player distance _unit >= 2500) exitWith {};

if ((_weapon in ["throw","put"])) exitWith {};

private _hit = [(configFile >> "CfgAmmo" >> _ammo >> "hit"), format ["life_suppr_cached_hit_%1", _ammo]] call SunriseClient_system_readCacheValues;
if (_hit isEqualTo 0) exitWith {};

private _dDist = (7 + (_hit / 2)) min 28;// Calculate the detectionDistance (dDist)
private _pPos = getPosATL _projectile;

life_suppr_mainArray pushBack [_projectile, _dDist, _hit];