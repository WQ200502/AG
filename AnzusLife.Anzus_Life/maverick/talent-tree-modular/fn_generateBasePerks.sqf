scriptName "fn_generateBasePerks";

private _baseConfig = missionConfigFile >> "Maverick_TTM" >> "Perks";
private _baseArray = [];

private _constructWithSubs = {
    private _subs = format ["getText (_x >> 'requiredPerk') == '%1'", _this]  configClasses _baseConfig;
    if (count _subs isEqualTo 0) exitWith {
        [_this, false];
    };
    private _subArray = [[_this, false]];
    private _temp = [];
    {
        private _ret = (configName _x) call _constructWithSubs;
        _temp pushBack _ret;
        true
    } count _subs;

    _subArray pushBack _temp;
    _subArray;
};

_parentPerks = "getText (_x >> 'requiredPerk') == ''" configClasses _baseConfig;
{
    private _ret = (configName _x) call _constructWithSubs;
    _baseArray pushBack _ret;
    true
} count _parentPerks;

_baseArray;
