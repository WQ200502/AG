#include "..\..\script_macros.hpp"
/*

	Filename: 		fn_deleteBind.sqf
	Project: 	  	AmazingLife - RPG
	Author:		  	AmazingTeam
	E-mail:		  	dev@amazingrp.ru
	Web:		      http://amazingrp.ru/

*/
disableSerialization;
private _display = findDisplay 15700;
if (isNull _display) exitWith {diag_log "Error tablet: Init failed, display does not load."};

private _type_del = [_this,0,"",[""]] call BIS_fnc_param;
private _advInfo = [_this,1,[],[[]]] call BIS_fnc_param;

private _getControl = _display getVariable "getControl";

switch (_type_del) do {
		case "number": {
			for "_i" from 3 to 8 do {
				_ctrlPicture = ("main_button_pic_" + str _i) call _getControl;
				_ctrlPicture ctrlSetText "";
				bind_number_array set [(_i - 3),["",""]];
			};
		};
		case "f_nubmer": {
			for "_i" from 9 to 16 do {
				_ctrlPicture = ("main_button_pic_" + str _i) call _getControl;
				_ctrlPicture ctrlSetText "";
				bind_f_number_array set [(_i - 9),["",""]];
			};
		};
		case "one_number": {
			_ctrlPicture = ("main_button_pic_" + str (_advInfo select 0)) call _getControl;
			_ctrlPicture ctrlSetText "";

			switch (true) do {
				case ((_advInfo select 0) <= 8): {
					bind_number_array set [((_advInfo select 0) - 3),["",""]];
				};
				default {
					bind_f_number_array set [((_advInfo select 0) - 9),["",""]];
				};
			};
		};
		default {
			/* code */
		};
};
