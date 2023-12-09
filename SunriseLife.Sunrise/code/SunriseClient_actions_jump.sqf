/*

	Filename: 	SunriseClient_actions_jump.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"

private _handled = false;

if (vehicle player isEqualTo player) then {
	private _move = animationState player;
	private _moveM = toLower (_move select [8,4]);
	private _moveP = toLower (_move select [4,4]);

	if (_moveM in ["mrun","meva"] && _moveP in ["perc","pknl"] && getFatigue player < 0.6 && isTouchingGround player) then {
		private _vel = velocity player;
		player setvelocity [(_vel select 0), (_vel select 1), 3];
		player setStamina (getstamina player)-8;
		_handled = true;
	};
};

_handled