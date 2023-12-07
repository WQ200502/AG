#include "..\..\script_macros.hpp"
/*
    File: fn_medBDinit.sqf
    Author: Fresqo
    Description: asks client if they will allow blood to be taken
*/

params [
    ["_giver",objNull,[objNull]],
    ["_taker",objNull,[objNull]]
];

if (isNull _giver || !alive _giver || !alive _taker || isNull _taker) exitWith {};

private _rand = random (50);
private _bType = _giver getVariable ["bloodtype",[]];
if ((_bType param [2,0,[0]]) > (_bType param [1,0,[0]]) || (_giver getVariable["bloodcap",false])) exitWith
{
    hint "您再也无法处理失血了!";
    [1,"现在不能处理这位病人失血了"] remoteExec ["life_fnc_broadcast",_taker];
};

if (_bType isEqualTo []) then {
    switch (true) do {
        case (_rand >= 48): {_bType = ["blood_vialo",round(random(6)+1),0];};
        case (_rand >= 24): {_bType = ["blood_viala",round(random(6)+1),0];};
        case (_rand >= 0): {_bType = ["blood_vialb",round(random(6)+1),0];};
    };
};
_giver setVariable ["bloodtype",_bType,true];

player spawn {
  private _action = ["你想为钱捐血吗?", "Blood Drive", true, true] call BIS_fnc_guiMessage;

  if(_action) then {
      if (isNull _taker || !alive _taker) exitWith {hint "护理人员已经不在了!";};
      if (_giver distance _taker > 5) exitWith
      {
          hint "你离医护人员太远了!";
          [1,"你离病人太远了!"] remoteExec ["life_fnc_broadcast",_taker];
      };
      hint format["你必须留在医护人员身边 %1 帮你输血!",name _taker];
      [_giver,_taker] remoteExec ["ANZUS_fnc_bloodDrive",_taker];
  } else {
      [1,"病人不肯让你为他输血!"] remoteExec ["life_fnc_broadcast",_taker];
  };
};