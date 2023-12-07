/*
file: fn_spoonBreakout.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Edited by Fresqo (jail spoon breaking shiz)
Description:
Executes the trigga!
Idea developed by PEpwnzya v1.0
*/
private["_ui","_progress","_pgText","_cP","_pos","_type","_out","_loc"];
_type = _this select 3;
switch (_type) do {
	case "1": {_loc = "spoon_in_1"; _out = "spoon_out_1";};
	case "2": {_loc = "spoon_in_2"; _out = "spoon_out_2";};
	case "3": {_loc = "spoon_in_3"; _out = "spoon_out_3";};
	case "4": {_loc = "spoon_in_4"; _out = "spoon_out_4";};
	case "5": {_loc = "spoon_in_5"; _out = "spoon_out_5";};
	case "6": {_loc = "spoon_in_6"; _out = "spoon_out_6";};
	case "7": {_loc = "spoon_in_7"; _out = "spoon_out_7";};
	case "8": {_loc = "spoon_in_8"; _out = "spoon_out_8";};
	case "9": {_loc = "spoon_in_9"; _out = "spoon_out_9";};
	case "10": {_loc = "spoon_in_10"; _out = "spoon_out_10";};
	case "11": {_loc = "spoon_in_11"; _out = "spoon_out_11";};
	case "12": {_loc = "spoon_in_12"; _out = "spoon_out_12";};
	case "13": {_loc = "spoon_in_13"; _out = "spoon_out_13";};
	case "14": {_loc = "spoon_in_14"; _out = "spoon_out_14";};
	case "15": {_loc = "spoon_in_15"; _out = "spoon_out_15";};
	case "16": {_loc = "spoon_in_16"; _out = "spoon_out_16";};
	case "17": {_loc = "spoon_in_17"; _out = "spoon_out_17";};
	case "18": {_loc = "spoon_in_18"; _out = "spoon_out_18";};
	case "19": {_loc = "spoon_in_19"; _out = "spoon_out_19";};
	case "20": {_loc = "spoon_in_20"; _out = "spoon_out_20";};	
};

if (playerSide != civilian) exitWith{[localize"STR_MIS_Digout",false,"slow"] call ANZUS_fnc_notificationSystem;};
if (player distance (getMarkerPos _loc) > 100) exitWith {["你必须在同一地点挖!",false,"slow"] call ANZUS_fnc_notificationSystem;};
if (life_inv_spoon < 1) exitWith {[localize"您没有任何可用于挖掘的项目!",false,"slow"] call ANZUS_fnc_notificationSystem;};
if (life_rip) exitWith {["已经尝试挖掘!",false,"slow"] call ANZUS_fnc_notificationSystem; };
if !(alive player) exitWith {};

life_rip = true;
 
_title = "Digging out of Prison";
_icon = "\AnzusLifeCore\images\displays\displayInteractionMenu\lockpick.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progressBar = _controlsGroup controlsGroupCtrl 3;
_titleText = _controlsGroup controlsGroupCtrl 2;
_titleText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, str("1" + "%"), (100 * (pixelH * pixelGrid * 0.50))];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
 
if(life_rip) then
{
	while{true} do
	{
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["ANZUS_fnc_animSync"];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
			sleep 0.5;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Digging, stay close (2m) (%1%2)...",round(_cP * 100),"%"];

		if(_cP >= 1) exitWith {};
		if(player distance (getMarkerPos _loc) > 2) exitWith {};
		if!(alive player) exitWith {};
	};

	if!(alive player) exitWith { life_rip = false; [] call life_fnc_updatePlayerHud;};
	if(player distance (getMarkerPos _loc) > 2) exitWith { [localize"STR_MIS_Digout2",false,"slow"] call ANZUS_fnc_notificationSystem;5 cutText ["","PLAIN"];life_rip = false;[] call life_fnc_updatePlayerHud; };
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	player setPos (getMarkerPos _out);
	[] call life_fnc_updatePlayerHud;
	sleep 1;
	//Check to make sure they goto check
	if(player distance (getMarkerPos _out) > 1) then
	{
	player setPos (getMarkerPos _out);
	};
	[false,"spoon",1] call ANZUS_fnc_handleInv;
	titleText[format["您已经开辟了通往自由的道路,快跑出去!"],"PLAIN"];	
	life_rip = false;	
};
