/*

	Filename: 	SunriseClient_system_compass.sqf
	Project: 	Sunrise Lifeы
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _ui = uiNamespace getVariable ["life_compass",displayNull];
if (isNull _ui) then {
	["life_compass","PLAIN",1,false] call SunriseClient_gui_CreateRscLayer;
	_ui = uiNamespace getVariable ["life_compass",displayNull];
};
if (visibleMap OR {player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]} OR {dialog} OR {player getVariable ["isBlind",false]} OR {!("ItemCompass" in (assignedItems Player))}) exitWith {
	["life_compass"] call SunriseClient_gui_DestroyRscLayer;
};

private _compass_image = _ui displayCtrl 7636;
private _sPos = screenToWorld [0.5,0.5];
private _pPos = getPos player;
private _stripe = 0.96 * safezoneW;
private _dir = (((((_sPos select 0) - (_pPos select 0)) atan2 ((_sPos select 1) - (_pPos select 1))) + 360) % 360)/100;
private _calc = ((_stripe/570) * _dir)* 100 + (_stripe/570) * 45;

_compass_image ctrlSetPosition [_calc - _calc*2,-0.01,_stripe,1.8 * safezoneH];
_compass_image ctrlCommit 0;