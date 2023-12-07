disableSerialization;

#include "..\..\script_macros.hpp"

params [["_computerNumber",1],["_computerObject",objNull]];
_resetHackInProgress =
{
	_computerCode = _this select 0;
	_falseOrTrue = _this select 1;
	switch(_computerCode) do
	{
		case 1: {life_computer1HackInProgress = _falseOrTrue; publicVariable "life_computer1HackInProgress"};
		case 2: {life_computer2HackInProgress = _falseOrTrue; publicVariable "life_computer2HackInProgress"};
		case 3: {life_computer3HackInProgress = _falseOrTrue; publicVariable "life_computer3HackInProgress"};
		case 4: {life_computer4HackInProgress = _falseOrTrue; publicVariable "life_computer4HackInProgress"};
	};
};
//if(west countSide playableUnits < 3) exitWith {["您需要有超过3个警察才能入侵军舰.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(_computerNumber isEqualTo 1 && life_computer1HackInProgress) exitWith {["这台电脑已经被黑客攻击了.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(_computerNumber isEqualTo 2 && life_computer2HackInProgress) exitWith {["这台电脑已经被黑客攻击了.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(_computerNumber isEqualTo 3 && life_computer3HackInProgress) exitWith {["这台电脑已经被黑客攻击了.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(_computerNumber isEqualTo 4 && life_computer4HackInProgress) exitWith {["这台电脑已经被黑客攻击了.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(life_inv_regularUSB < 1) exitWith {["You need a regular USB stick to hack this",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(life_computer1CannotBeHacked && _computerNumber isEqualTo 1) exitWith {["电脑已被黑客入侵.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(life_computer2CannotBeHacked && _computerNumber isEqualTo 2) exitWith {["电脑已被黑客入侵.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(life_computer3CannotBeHacked && _computerNumber isEqualTo 3) exitWith {["电脑已被黑客入侵.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(life_computer4CannotBeHacked && _computerNumber isEqualTo 4) exitWith {["电脑已被黑客入侵.",false,"slow"] call ANZUS_fnc_notificationSystem;};
["<t color='#ff0000' size='2' align='center' > 军事进入警报 </t> <br/> <br/> 有人在盗取访问代码以侵入主机! <br/> <br/> 前往USS Liberty并重置密码以阻止它们!","false","slow"] remoteExec ["ANZUS_fnc_notificationSystem",WEST];
["Ship"] remoteExec ['ANZUS_fnc_AANBank',-2];

playSound "alert";

["上载访问码时处于待机状态...",false,"slow"] call ANZUS_fnc_notificationSystem;

_percent = 0;

[_computerNumber,true] call _resetHackInProgress;

life_isHacking = true;

_title = "UPLOADING";
_icon = "\AnzusLifeCore\images\displays\displayInteractionMenu\lockpick.paa";

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
	if(life_inv_regularUSB < 1) exitWith {["您丢下了USB记忆棒或丢失了它。上传失败",false,"slow"] call ANZUS_fnc_notificationSystem;};
	if(life_stopHacking) exitWith {["您停止了上传，军方已成功更改了数据变量。您将需要等待代码重置，然后重新开始.",false,"slow"] call ANZUS_fnc_notificationSystem;};
	if (player getVariable ["inHostage",false]) exitWith {};
	if (!alive player) exitWith {};
	if !(isNull objectParent player) exitWith {};
	if (life_interrupted) exitWith {};
	if (life_resetMainFrameAccessDeny) exitWith {};
	if (!life_isHacking) exitWith {};
};
life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
life_isHacking = false;

if(life_inv_regularUSB < 1) exitWith
{
	[_computerNumber,false] call _resetHackInProgress;
};

if(life_resetMainFrameAccessDeny) exitWith {};

[_computerNumber,false] call _resetHackInProgress;

if(player distance _computerObject >= 10) exitWith {["USB记忆棒从电脑里掉了下来！上传失败.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(life_stopHacking) exitWith {life_stopHacking = false;};
if(!alive player) exitWith {["You died! Upload failed.",false,"slow"] call ANZUS_fnc_notificationSystem;};
if(life_is_arrested && life_istazed && life_isknocked) then {["You cannot do that anymore.",false,"slow"] call ANZUS_fnc_notificationSystem;};

switch(_computerNumber) do
{
	case 1:
	{
		[true, "USB1", 1] call ANZUS_fnc_handleInv;
		[false, "regularUSB", 1] call ANZUS_fnc_handleInv;
		["您已将命令代码上传到USB记忆棒!",false,"slow"] call ANZUS_fnc_notificationSystem;
		life_computer1CannotBeHacked = true;
		publicVariable "life_computer1CannotBeHacked";
	};
	case 2:
	{
		[true, "USB2", 1] call ANZUS_fnc_handleInv;
		[false, "regularUSB", 1] call ANZUS_fnc_handleInv;
		["您已将命令代码上传到USB记忆棒!",false,"slow"] call ANZUS_fnc_notificationSystem;
		life_computer2CannotBeHacked = true;
		publicVariable "life_computer2CannotBeHacked";
	};
	case 3:
	{
		[true, "USB3", 1] call ANZUS_fnc_handleInv;
		[false, "regularUSB", 1] call ANZUS_fnc_handleInv;
		["您已将命令代码上传到USB记忆棒!",false,"slow"] call ANZUS_fnc_notificationSystem;
		life_computer3CannotBeHacked = true;
		publicVariable "life_computer3CannotBeHacked";
	};
	case 4:
	{
		[true, "USB4", 1] call ANZUS_fnc_handleInv;
		[false, "regularUSB", 1] call ANZUS_fnc_handleInv;
		["您已将命令代码上传到USB记忆棒!",false,"slow"] call ANZUS_fnc_notificationSystem;
		life_computer4CannotBeHacked = true;
		publicVariable "life_computer4CannotBeHacked";
	};
};

if(life_inv_usb1 > 0 && life_inv_usb2 > 0 && life_inv_usb3 > 0 && life_inv_usb4 > 0) then
{
	[true, "USB5", 1] call ANZUS_fnc_handleInv;
	{
		[false,_x, 1] call ANZUS_fnc_handleInv;
	} forEach ["USB1","USB2","USB3","USB4"];
	["现在，您已经拥有进入军事基地所需的所有命令代码。您已将4个代码编译到单个USB记忆棒上.",false,"slow"] call ANZUS_fnc_notificationSystem;
};
