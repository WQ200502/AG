#include "..\..\script_macros.hpp"

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];
if (isNull _display) exitWith {};

private _gangNameCtrl = _display displayCtrl 160003;
private _gangNameText = ctrlText _gangNameCtrl;

private _bannedWords = [_gangNameText] call ANZUS_fnc_bannedWords;

if (_bannedWords) exitWith {
  ["您不能使用该帮派名称，因为它包含被禁止的单词.","true","slow"] call ANZUS_fnc_notificationSystem;
};

_gangSettings = MAIN_SETTINGS("GameSettings","Gangs");
private _creationCost = getNumber(_gangSettings >> "gang_price");

if (BANK < _creationCost) exitWith {
	["您的银行帐户中没有足够的资源来执行此操作.","true","slow"] call ANZUS_fnc_notificationSystem;
};

	
private _text = format["你确定要创建一个名为 %1, 这将花费你 $%2",_gangNameText,[_creationCost] call ANZUS_fnc_numberText];
private _title = "Gang Creation";
private _response = [_title,_text] call ANZUS_fnc_sendWarning;

if (_response) then {
  closeDialog 0;
  [player,getPlayerUID player,_gangNameText] remoteExec ["TON_fnc_insertGang",RSERV];
} else {	
  ["您已取消创建帮派.","true","slow"] call ANZUS_fnc_notificationSystem;
};
