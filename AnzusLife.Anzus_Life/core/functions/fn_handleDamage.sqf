#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]],
    ["_instigator",objNull,[objNull]]
];
private _isDown=false;
if (isNull _instigator && (isNull AnzusLife_HeliEjectThread)) exitWith {
    if ((vehicle player) isKindOf "Air") exitWith {_damage};
    0 max (_damage min 0.7);
};


//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in ["taser","Mossberg_590"] && _projectile in ["B_12Gauge_Pellets","590_Slug"]) then {
            _damage = damage _unit;
			_isDown=true;

            if (alive _unit && {!life_istazed} && {!life_isknocked}) then {
                private _distance = 35;
                if (_projectile in ["B_12Gauge_Pellets","590_Slug"]) then {_distance = 30;};
                if (_unit distance _source < _distance) then {
                    if !(isNull objectParent _unit ) then {
                        if (toLower (typeOf (vehicle _unit )) find "bike" > -1) then {
                            _unit action ["Eject",vehicle _unit ];
                            [_unit,_source] spawn ANZUS_fnc_tazedHit;
                        };
                    } else {
                        
                        if ((animationState _unit select [0, 6]) isEqualTo "ladder") then {
                            _ins = lineIntersectsSurfaces [getPosASL _unit, (getPosASL _unit vectorAdd [3* (sin (getDir _unit)),3 * (cos (getDir _unit)),0]), _unit];
                            _obj = (_ins select 0) select 2;
                            _unit action ["ladderOff", _obj];
                        };

                        if (side _source isEqualTo civilian && playerSide isEqualTo west && !isNil {(group _source) getVariable ["gang_name",""]}) then {
                            [] remoteExec ["AnzusLife_TazedGangPerk",_source];
                        };
                        player switchMove "";
                        [_unit,_source] spawn ANZUS_fnc_tazedHit;
                    };
                    
                    //[format["%1 (%2) hit %3 (%4) with %5",name _unit, getPlayerUID _unit, name _source, getPlayerUID _source, currentWeapon _source], "taser.log"] remoteExec ["AH_LogInterface",2];
                };
            };
            if (side _source isEqualTo west && (playerSide isEqualTo west || playerSide isEqualTo independent)) then {
                _damage = damage _unit;
            };
        };
		if ("acc_pointer_IR" in (primaryWeaponItems _source) && side _source isEqualTo west) then {
			_isDown=true;
			if (getDammage _unit >= 0.95 || _damage >= 0.95) then {_damage = 0.96; _unit setDamage 0.96;};
			_hitDam = if (_part == "") then { damage _unit } else { (_unit getHit _part) };
			if (getDammage _unit >= 0.95 || (_hitDam + _damage >= 0.95)) then {
			_damage = 0; 
       		 [_unit,_source] spawn ANZUS_fnc_tazedHit;
       		 };
        	};
    };
};

if (_projectile in ["TR8_Drill_Fuel","APERSMine_Range_Ammo"]) then {
    _damage = damage _unit;
};



if(vehicle _source isKindOf "LandVehicle" || vehicle _source isKindOf "Ship" || vehicle _source isKindOf "Air") then {
    if(alive _unit && ((driver (vehicle _source)) isEqualTo _source)) then {
        _damage = damage _unit;
        [_unit] call ANZUS_fnc_ragdoll;
    };
};

_damage;
