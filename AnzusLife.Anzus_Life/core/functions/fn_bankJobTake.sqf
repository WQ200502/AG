#include "..\..\script_macros.hpp"
/*
	Fresqo
		sooooo over it
		1. take
		2. count
*/
private["_crim","_crate","_ui","_progress","_pgText","_cP","_tax","_profName","_bagVal","_type","_money","_multi","_arr","_pile","_highranksneeded"];
params [["_type","",[""]]];
_crim = player;
_pile = cursorObject;

_bagVal = M_CONFIG(getNumber,"VirtualItems","bank_bag","sellPrice");
_money = _pile getVariable ["vault_money",0];
if ((west countSide playableUnits) < 6) exitWith {[ format ["有 %1 警察在线, 需要6个警察." , (west countSide playableUnits)],true,"slow"] call ANZUS_fnc_notificationSystem;};

_diff = ["bank_bag",1,life_carryWeight,life_maxWeight] call ANZUS_fnc_calWeightDiff;
if(_diff <= 0) exitWith {["你没有足够的空间放满一个袋子!","false","slow"] call ANZUS_fnc_notificationSystem;};

diag_log format["银行存款:$%1 | 袋价值:$%2 | 物件: %3",_money,_bagVal,_pile];

//ERROR CHECKS
if (!((typeOf _pile) in ["A3L_MoneyPile"])) exitWith {};
if (_money < _bagVal) exitWith {["没有钱了!","false","slow"] call ANZUS_fnc_notificationSystem; if (!isNull _pile) then{deleteVehicle _pile};};
if (isNull _pile) exitWith {};
if (life_action_inUse) exitWith {hint "Already doin shit!"};

switch (_type) do {
	case "count": {
    life_action_inUse = true;
    ["Counting money.","true","slow"] call ANZUS_fnc_notificationSystem;
    sleep 2;
    ["Counting money..","true","slow"] call ANZUS_fnc_notificationSystem;
    sleep 2;
    ["Counting money...","true","slow"] call ANZUS_fnc_notificationSystem;
    sleep 2;
    ["Counting money....","true","slow"] call ANZUS_fnc_notificationSystem;
    sleep 2;
    ["Counting money.....","true","slow"] call ANZUS_fnc_notificationSystem;
    sleep 2;
    if !(alive _crim) exitWith {};
    _money = _pile getVariable ["vault_money",0];
    [format["有 $%1 现金在桌子上!",[_money] call ANZUS_fnc_numberText],"turk","slow"] call ANZUS_fnc_notificationSystem;
    life_action_inUse = false;
	};

	case "take": {
    if (life_inv_bag < 1) exitWith {["你要把钱装在什么东西里，去拿个包子!","false","slow"] call ANZUS_fnc_notificationSystem;};
    if(side _crim != civilian) exitWith {["你不能偷钱袋，白痴!","false","slow"] call ANZUS_fnc_notificationSystem;};
    if(_crim distance _pile > 2) exitWith {["你需要在箱子3米以内才能偷走钱袋!","false","slow"] call ANZUS_fnc_notificationSystem;};
    if (vehicle player != _crim) exitWith {["你不能从车内那样做!","false","slow"] call ANZUS_fnc_notificationSystem;};
    if !(alive _crim) exitWith {};
      life_action_inUse = true;
    _title = "Filling bag with cash";
    _icon = "\AnzusLifeCore\images\icons\bag.paa";
    disableSerialization;
    "progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
    _ui = uiNamespace getVariable "AnzusLife_Progress";
    _controlsGroup = _ui displayCtrl 1;
    _progress = _controlsGroup controlsGroupCtrl 3;
    _pgText = _controlsGroup controlsGroupCtrl 2;
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
    _progress progressSetPosition 0.01;
    _add = 0.01;
    _cP = _add;
    life_interrupted = false;
    for "_i" from 0 to 1 step 0 do {
      if ((animationState player) != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
      };

      sleep 0.35;
      _cP = _cP + _add;
      _progress progressSetPosition _cP;
        _precentage = str round(_cP * 100) + "%";
        _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

      if (_cP >= 1) exitWith {};
      if (player getVariable ["inHostage",false]) exitWith {life_action_inUse = false;};
      if (!alive player) exitWith {life_action_inUse = false;};
      if !(isNull objectParent player) exitWith {life_action_inUse = false;};
      if (life_interrupted) exitWith {};
        if(_crim distance _pile > 2) exitWith {life_action_inUse = false;};
        if!(alive _crim) exitWith {life_action_inUse = false;};
        if (isNull _pile) exitWith {life_action_inUse = false;};
        _money = _pile getVariable ["vault_money",0];
        if (_money < _bagVal) exitWith {life_action_inUse = false;};
    };
    life_action_inUse = false;
    "progressBar" cutText ["","PLAIN"];
			if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
      if (isNull _pile) exitWith {["钱不见了",false,"slow"] call ANZUS_fnc_notificationSystem;5 cutText ["","PLAIN"]; [] call ANZUS_fnc_hudUpdate;};
      if!(alive _crim) exitWith { 5 cutText ["","PLAIN"];[] call ANZUS_fnc_hudUpdate;};
      if(_crim distance _pile > 4) exitWith {["您需要留在2m以内以偷钱袋!",false,"slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; [] call ANZUS_fnc_hudUpdate; };
      _money = _pile getVariable ["vault_money",0];
      if (_money < _bagVal) exitWith {["没有钱了",false,"slow"] call ANZUS_fnc_notificationSystem;5 cutText ["","PLAIN"];[] call ANZUS_fnc_hudUpdate; if (!isNull _pile) then{deleteVehicle _pile};};
      if(!([false,"bag",1] call ANZUS_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [] call ANZUS_fnc_hudUpdate;};
      if(!([true,"bank_bag",1] call ANZUS_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];[] call ANZUS_fnc_hudUpdate;};

      SUB(_money,_bagVal);
      _pile setVariable ["vault_money",_money,true];
      if (_money < _bagVal) then {if (!isNull _pile) then {deleteVehicle _pile}};

      5 cutText ["","PLAIN"];
      titleText ["你偷了一个装满钱的袋子，不能用它，最好把它拿给洗钱者!", "PLAIN"];
      [] call ANZUS_fnc_hudUpdate;
	};
};
