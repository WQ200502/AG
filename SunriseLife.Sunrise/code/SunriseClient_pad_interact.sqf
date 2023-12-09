/*

	Filename: 	SunriseClient_pad_interact.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_mode","_params"];
switch (_mode) do { 
	case "onEnter" : {
			_ctrlIDC = (ctrlIDC (_params select 0) - 1);
			_handle = [(findDisplay 2000) displayCtrl _ctrlIDC,_params select 0] spawn {
				params ["_img","_btn"];
				if (isNull _img OR isNull _btn) exitWith {};
				_i = (profilenamespace getvariable ['GUI_V3_BTBG_R',0]);
				_y = (profilenamespace getvariable ['GUI_V3_BTBG_G',0]);
				_z = (profilenamespace getvariable ['GUI_V3_BTBG_B',0]);
				_rMODimg = ((1 - _i) / 15);
				_gMODimg = ((1 - _y) / 15);
				_bMODimg = ((1 - _z) / 15);
				_iBg = (profilenamespace getvariable ['GUI_V3_BG_R',1]);
				_yBg = (profilenamespace getvariable ['GUI_V3_BG_G',1]);
				_zBg = (profilenamespace getvariable ['GUI_V3_BG_B',1]);
				_rMODbtn = ((_i - _iBg) / 15);
				_gMODbtn = ((_y - _yBg) / 15);
				_bMODbtn = ((_z - _zBg) / 15);
				for '_x' from 0 to 15 step 1 do {
				if (isNull _img OR isNull _btn) exitWith {};
					_imgColor = [
						(_i + (_rMODimg * _x)),
						(_y + (_gMODimg * _x)),
						(_z + (_bMODimg * _x)),
						1
					];
					_img ctrlSetTextColor _imgColor;

					_btnColor = [
						(_iBg + (_rMODbtn * _x)),
						(_yBg + (_gMODbtn * _x)),
						(_zBg + (_bMODbtn * _x)),
						(profilenamespace getvariable ['GUI_V3_BG_A',0.7])
					];
					_btn ctrlSetBackgroundColor _btnColor;

					_btn ctrlSetText str [_imgColor,_btnColor];
					uisleep 0.01;
				};
			};
			uiNamespace setVariable [format ["button_%1",_ctrlIDC],_handle];
		}; 
	case "onExit" : {
			_ctrlIDC = (ctrlIDC (_params select 0) - 1);
			_handle = uiNamespace getVariable [format ["button_%1",_ctrlIDC],scriptNull];
			if !(isNull _handle) then {terminate _handle};
			[(findDisplay 2000) displayCtrl _ctrlIDC,_params select 0] spawn {
				params ["_img","_btn"];
				if (isNull _img OR isNull _btn) exitWith {};
				(parseSimpleArray (ctrlText _btn)) params ["_imgColor","_btnColor"];
				_imgColor params ["_img_i","_img_y","_img_z"];
				_rMODimg = ((_img_i - (profilenamespace getvariable ['GUI_V3_BTBG_R',0])) / 15);
				_gMODimg = ((_img_y - (profilenamespace getvariable ['GUI_V3_BTBG_G',0])) / 15);
				_bMODimg = ((_img_z - (profilenamespace getvariable ['GUI_V3_BTBG_B',0])) / 15);
				_btnColor params ["_btn_i","_btn_y","_btn_z"];
				_rMODbtn = ((_btn_i - (profilenamespace getvariable ['GUI_V3_BG_R',1])) / 15);
				_gMODbtn = ((_btn_y - (profilenamespace getvariable ['GUI_V3_BG_G',1])) / 15);
				_bMODbtn = ((_btn_z - (profilenamespace getvariable ['GUI_V3_BG_B',1])) / 15);
				for '_x' from 0 to 15 step 1 do {
					if (isNull _img OR isNull _btn) exitWith {};
					_img ctrlSetTextColor [
						(_img_i - (_rMODimg * _x)),
						(_img_y - (_gMODimg * _x)),
						(_img_z - (_bMODimg * _x)),
						1
					];
					_btn ctrlSetBackgroundColor [
						(_btn_i - (_rMODbtn * _x)),
						(_btn_y - (_gMODbtn * _x)),
						(_btn_z - (_bMODbtn * _x)),
						(profilenamespace getvariable ['GUI_V3_BG_A',0.7])
					];
					uisleep 0.01;
				};
			};
		}; 
	case "onClick" : {
		_i = (profilenamespace getvariable ['GUI_V3_BTBG_R',0]);
		_y = (profilenamespace getvariable ['GUI_V3_BTBG_G',0]);
		_z = (profilenamespace getvariable ['GUI_V3_BTBG_B',0]);
		_rMOD = ((_i - 0) / 5);
		_gMOD = ((_y - 0) / 5);
		_bMOD = ((_z - 0) / 5);
		_ctrl = ((findDisplay 2000) displayCtrl 2001);
		for '_x' from 0 to 5 step 1 do {
			_ctrl ctrlSetBackgroundColor [
				(0 + (_rMOD * _x)),
				(0 + (_gMOD * _x)),
				(0 + (_bMOD * _x)),
				0.5
			];
			uisleep 0.01;
		};
		for '_x' from 0 to 5 step 1 do {
			_ctrl ctrlSetBackgroundColor [
				(_i - (_rMOD * _x)),
				(_y - (_gMOD * _x)),
				(_z - (_bMOD * _x)),
				0.8
			];
			uisleep 0.01;
		};
	}; 
	default {}; 
};