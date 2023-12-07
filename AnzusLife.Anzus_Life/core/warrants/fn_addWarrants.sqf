params [ 
    ["_unit", objNull, [objNull]], 
    ["_crimeClass", "", [""]]
];

// Error checks
if (isNull _unit) exitWith {};
if (!alive _unit) exitWith {};
if (_unit in [independent, west]) exitWith {};

private _configClass = (missionConfigFile >> "CfgJail" >> "Crimes" >> _crimeClass); 
if !(isClass _configClass) exitWith {};

private _title = getText (_configClass >> "title");
private _penalty = getText (_configClass >> "penalty");
private _sentenceTime = getNumber (_configClass >> "prisonTime");
private _ticketValue = getNumber (_configClass >> "ticketValue");
private _crimeID = getNumber (_configClass >> "crimeID");

if (_crimeID < 0) exitWith {["No crime ID found.","true","slow"] call ANZUS_fnc_notificationSystem;};
[_unit, _crimeID] remoteExec ["ANZUS_fnc_addWarrantsServ",2];

if (!local _unit) then
{
    [format["逮捕 %1 的逮捕令已添加到逮捕令数据库中。",name _unit],false,"slow"] call ANZUS_fnc_notificationSystem;
    [format["你的逮捕令已经发出。这是因为怀疑是 %1 ，将被处以 %2 到 %3 分钟的罚款以及 $%4 美元的罚单。",_title,_penalty,_sentenceTime,[_ticketValue] call ANZUS_fnc_numberText],"false","slow"] remoteExec ["ANZUS_fnc_notificationSystem",_unit];
}
else
{
    [format["你的逮捕令已经发出。这是因为怀疑是 %1 ，将被处以 %2 到 %3 分钟的罚款以及 $%4 美元的罚单。",_title,_penalty,_sentenceTime,[_ticketValue] call ANZUS_fnc_numberText],"false","slow"] call ANZUS_fnc_notificationSystem;
};