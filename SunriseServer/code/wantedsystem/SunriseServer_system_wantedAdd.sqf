/*

    Filename:   SunriseServer_system_wantedAdd.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
params [
    ["_uid","",[""]],
    ["_name","",[""]],
    ["_type","",[""]],
    ["_customBounty",-1,[0]]
];
if (_uid isEqualTo "" || _type isEqualTo "" || _name isEqualTo "") exitWith {}; //Bad data passed.
if !(isClass(missionConfigFile >> "LifeCfgCrimes" >> _type)) exitWith {};

private _reward = if (_customBounty isEqualTo -1) then {getNumber(missionConfigFile >> "LifeCfgCrimes" >> _type >> "reward")} else {_customBounty};

//Search the wanted list to make sure they are not on it.
private _queryResult = format ["wantedGet:%1",_uid] call SunriseServer_database_selectSingle; 

if !(_queryResult isEqualTo []) then
{
    _pastCrimes = _queryResult select 0;
    _pastCrimes pushBack _type;
    format ["wantedUpdate:%1:%2:%3",_pastCrimes,_reward,_uid] call SunriseServer_database_fireAndForget;
} else {
    format ["wantedInsert:%1:%2:%3:%4",_uid,_name,[_type],_reward] call SunriseServer_database_fireAndForget;
};
