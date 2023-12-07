params [
    ["_unit", objNull, [objNull]]
];

private _query = format ["SELECT exp_level, exp_total, exp_perkPoints, exp_perks FROM players WHERE pid = '%1'", getPlayerUID _unit];
private _queryResult = [_query,2] call ANZUS_fnc_asyncCall;

if ((_queryResult param [3]) isEqualType "") then {
	_queryResult set [3, []];
};

if (_queryResult isEqualTo []) then {
    _queryResult = [0, 0, 0, []];
} else {
	private _perks = _queryResult param[3];
	_perks call mav_ttm_fnc_tinyIntConverter;
	_queryResult set [3, _perks];
};

_queryResult remoteExecCall ["mav_ttm_fnc_clientReceiveData", _unit];