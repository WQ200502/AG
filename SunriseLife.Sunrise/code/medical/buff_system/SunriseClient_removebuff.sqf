/*

	Filename: 	SunriseClient_removebuff.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF
	Web:		http://sunriserp.ru

*/
#include "..\..\..\script_macros.hpp"
disableSerialization;
private _variable = param[0,"",[""]];

if (_variable isEqualTo "") exitWith {};
if (ui_buff_array isEqualTo[]) exitWith {};

private _buffList = ["life_speed_buff","life_turbo_used","life_jet_used","life_morphine_used","life_radx_used","life_stepHeal_buff"];
private _deBaffList = ["life_pain_shock","life_bleeding","life_blood_legs","life_depsyho_used"];

private _check = false;

switch (_variable) do {
    case "all": {
        {
            _toastControl = _x select 0;
            _variableLocal = (_x select 4);

            [_variableLocal] call SunriseClient_terminateBuffVar;

            ctrlDelete _toastControl;

            if (_variableLocal in (getArray(missionConfigFile >> "Life_Settings" >> "save_buffs"))) then {_check = true;};
        } forEach ui_buff_array;
			
		ui_buff_array = [];
    };
    case "buff":{
        _tmp = +[]; 
		{
            _toastControl = _x select 0;
            _variableLocal = (_x select 4);

            if (_variableLocal in _buffList) then {
                [_variableLocal] call SunriseClient_terminateBuffVar;
                ctrlDelete _toastControl;
                _tmp pushBack _x;

                if (_variableLocal in (getArray(missionConfigFile >> "Life_Settings" >> "save_buffs"))) then {_check = true;};
            };
        } forEach ui_buff_array;
        ui_buff_array = ui_buff_array - _tmp;
    };
    case "debaff":{
        _tmp = +[]; 
		{
            _toastControl = _x select 0;
            _variableLocal = (_x select 4);

            if (_variableLocal in _deBaffList) then {
                [_variableLocal] call SunriseClient_terminateBuffVar;
                ctrlDelete _toastControl;
                _tmp pushBack _x;

                if (_variableLocal in (getArray(missionConfigFile >> "Life_Settings" >> "save_buffs"))) then {check = true;};
            };
        } forEach ui_buff_array;
        ui_buff_array = ui_buff_array - _tmp;
    };
    default {
        {
            _toastControl = _x select 0;
            _variableLocal = (_x select 4);
            if (_variableLocal isEqualTo _variable) then {
                [_variableLocal] call SunriseClient_terminateBuffVar;
                _toastPosition = ctrlPosition _toastControl;
                _toastPosition set[1, (_toastPosition select 1) - 20 * pixelH];
                _toastControl ctrlSetPosition _toastPosition;
                _toastControl ctrlSetFade 1;
                _toastControl ctrlCommit 0.25;
                ui_buff_array set[_forEachIndex, [_toastControl, 1, diag_tickTime + 1, (_x select 3), (_x select 4)]];

                if (_variableLocal in (getArray(missionConfigFile >> "Life_Settings" >> "save_buffs"))) then {_check = true;};
            };
        } forEach ui_buff_array;
    };
};

if (_check) then {
    [false] spawn SunriseClient_saveEffects
};