/*

	Filename: 	SunriseClient_system_readCacheValues.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_config", configNull, [configNull, []]],
	["_varName", "", [""]]
];

private _var = profilenamespace getVariable _varName;
if (isNil "_var") then {
    if (_config isEqualType []) then {
        _path = configFile;
        {
            _path = _path >> _x;
        } count _config;
        _config = _path;
    };
    _var = call {
        if (isText _config) exitWith {
            getText _config;
        };
        if (isNumber _config) exitWith {
            getNumber _config;
        };
        if (isArray _config) exitWith {
            getArray _config;
        };
        ""
    };
    profilenamespace setVariable [_varName, _var];
};

_var
