/*

    Filename:   SunriseServer_system_keyManagement.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
private "_arr";
_uid = param [0,"",[""]];
_mode = param [2,0,[0]];

if (_uid isEqualTo "") exitWith {}; //BAAAAAAAAADDDDDDDD

switch (_mode) do {
    case 0: {
        _input = param [1,[],[[]]];
        _arr = [];
        {
            if (!isNull _x && {!(_x isKindOf "House")}) then {
                _arr pushBack _x;
            };
        } forEach _input;

        _arr = _arr - [objNull];
        missionNamespace setVariable [(_uid + "_KEYS"),_arr];
    };

    case 1: {
        _input = param [1,objNull,[objNull]];
        if (isNull _input || _input isKindOf "House") exitWith {};
        _arr = missionNamespace getVariable [(_uid + "_KEYS"),[]];
        _arr pushBack _input;
        _arr = _arr - [objNull];
        missionNamespace setVariable [(_uid + "_KEYS"),_arr];
    };

    case 2: {
        _arr = missionNamespace getVariable [(_uid + "_KEYS"),[]];
        _arr = _arr - [objNull];
        missionNamespace setVariable [(_uid + "_KEYS"),_arr];
    };
};