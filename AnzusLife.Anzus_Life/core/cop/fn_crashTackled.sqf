	params [["_target", ObjNull,[ObjNull]], ["_who", "", [""]], "_obj"];


if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who isEqualTo "") exitWith {};

999999 cutText [format["您你现在完成紧急逮捕 %1.",_who],"BLACK FADED"];

player playMoveNow "Incapacitated";
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
[_obj] spawn {
	params ["_obj"];

	if(!(player getVariable["restrained",false])) then {
		player playMoveNow "amovppnemstpsraswrfldnon";
	};

	if(!(player getVariable ["escorting", false])) then {
		detach player;
	};
	
	deleteVehicle _obj;
	player setVariable ["robbed",FALSE,TRUE];
};
