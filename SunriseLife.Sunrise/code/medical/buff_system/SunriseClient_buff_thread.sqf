/*

	Filename: 	SunriseClient_buff_thread.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

	Web:		http://sunriserp.ru
 add buff test
*/
#include "..\..\..\script_macros.hpp"
private["_toastControl", "_status", "_statusChangeAt", "_toastPosition"];

if (ui_buff_array isEqualTo[]) exitWith {};

disableSerialization;

_tmpArray = +ui_buff_array;
_count = (count ui_buff_array) - 1;
reverse _tmpArray;

{
    _toastControl = _x select 0;
    _status = _x select 1;
    _statusChangeAt = _x select 2;
    _variable = _x select 4;
    if (diag_tickTime >= _statusChangeAt) then {
        switch (_status) do {
            case 0:{
                    _toastPosition = ctrlPosition _toastControl;
                    _toastPosition set [1, (_toastPosition select 1) - 15 * pixelH];
                    _toastControl ctrlSetPosition _toastPosition;
                    _toastControl ctrlSetFade 1;
                    _toastControl ctrlCommit 0.25;
                    ui_buff_array set [(_count - _forEachIndex), [_toastControl, 1, diag_tickTime + 1, (_x select 3), _variable]];
                };
            case 1:{
                    ctrlDelete _toastControl;
                    ui_buff_array deleteAt(_count - _forEachIndex);

                    if !(_variable in (getArray(missionConfigFile >> "Life_Settings" >> "dont_use_buffs"))) then {
                        missionNamespace setVariable[_variable, false]
                    };

                };
            case 2:{
                    _toastPosition = ctrlPosition _toastControl;
                    _toastPosition set [1, (_toastPosition select 1) - 15 * pixelH];
                    _toastControl ctrlSetPosition _toastPosition;
                    _toastControl ctrlSetFade 1;
                    _toastControl ctrlCommit 0.25;
                    ui_buff_array set [(_count - _forEachIndex), [_toastControl, 1, diag_tickTime + 1, (_x select 3), _variable]];
                };
            default {
                if ((_count - _forEachIndex) != (_x select 3)) then {
                    _toastPosition = ctrlPosition _toastControl;
                    _toastPosition set[1, (_toastPosition select 1) - (_toastPosition select 3) + (35 * pixelH)];
                    _toastControl ctrlSetFade 0;
                    _toastControl ctrlSetPosition _toastPosition;
                    _toastControl ctrlCommit 0.25;
                    ui_buff_array set[(_count - _forEachIndex), [_toastControl, (_x select 1), (_x select 2), ((_x select 3) - 1), _variable]];
                };
            };
        };
    } else {
        if ((_count - _forEachIndex) != (_x select 3)) then {
            _toastPosition = ctrlPosition _toastControl;
            _toastPosition set [1, (_toastPosition select 1) - (_toastPosition select 3) + (35 * pixelH)];
            _toastControl ctrlSetFade 0;
            _toastControl ctrlSetPosition _toastPosition;
            _toastControl ctrlCommit 0.25;
            ui_buff_array set [(_count - _forEachIndex), [_toastControl, (_x select 1), (_x select 2), ((_x select 3) - 1), _variable]];
        };
    };

    if ((_count - _forEachIndex) > 7) then {
        _toastControl ctrlSetFade 1;
        _toastControl ctrlCommit 0.25;
    };
}
forEach _tmpArray;