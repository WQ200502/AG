disableSerialization;

params[["_computerObject",objNull]];

if(life_mainFrameHackInProgress) exitWith {["主机已经被黑客攻击了.",false,"slow"] call ANZUS_fnc_notificationSystem;};

if(life_inv_usb5 < 1) exitWith {["您需要带有访问代码的USB记忆棒才能破解",false,"slow"] call ANZUS_fnc_notificationSystem;};

//if(west countSide playableUnits < 3) exitWith {hint "您需要有3位警察才能入侵大型机.";};

["Standby while the access codes are uploaded...",false,"slow"] call ANZUS_fnc_notificationSystem;

["<t color='#ff0000' size='2' align='center' > 军事进入警报 </t> <br/> <br/> 有人在盗取访问代码以侵入主机! <br/> <br/> Head to the USS Liberty and reset the codes to stop them!","false","slow"] remoteExec ["ANZUS_fnc_notificationSystem",WEST];
["Ship"] remoteExec ['ANZUS_fnc_AANBank',-2];

_mark = createMarker["mainframeMarkScript",[(getPos mainFrame select 0),(getPos mainFrame select 1)]];
_mark setMarkerShape "ICON";
_mark setMarkerColor "ColorRed";
_mark setMarkerType "mil_dot";
_mark setMarkerText "MAINFRAME UNDER ATTACK";

_percent = 0;
life_mainFrameHackInProgress = true;
publicVariable "life_mainFrameHackInProgress";

_title = "UPLOADING TO THE MAIN FRAME";
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

life_isHacking = true;

while{_percent < 100 && alive player && player distance _computerObject < 4 && life_isHacking && !life_resetMainFrameAccessDeny} do
{
	if(life_resetMainFrameAccessDeny) exitWith {["主机已被锁定...",false,"slow"] call ANZUS_fnc_notificationSystem;};
	if(life_inv_usb5 < 1) exitWith {["您丢下了USB记忆棒或丢失了它。上传失败.",false,"slow"] call ANZUS_fnc_notificationSystem;};
	if(life_stopHacking) exitWith {["您停止了上传，军方已成功更改了数据变量。您将需要等待代码重置，然后重新开始.",false,"slow"] call ANZUS_fnc_notificationSystem;};
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then
	{

        [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",0];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
	_progressText ctrlSetText format["UPLOADING TO MAINFRAME: %1%2",_percent,"%"];
	_progress progressSetPosition (_percent / 100);

	_percent = _percent + 1;
	sleep 7;

};

player playActionNow "stop";
deleteMarker _mark;

5 cutText ["","PLAIN"];
life_isHacking = false;
life_mainFrameHackInProgress = false;
publicVariable "life_mainFrameHackInProgress";
if(life_stopHacking) exitWith {};
if(life_inv_usb5 < 1) exitWith {};
if(life_resetMainFrameAccessDeny) exitWith {};
if(!alive player) then
{
	["你死了！上传已被警方阻止",false,"slow"] call ANZUS_fnc_notificationSystem;
}
else
{
	if(player distance _computerObject >= 4) then
	{
		["你走得太远了，上传停止.",false,"slow"] call ANZUS_fnc_notificationSystem;
	}
	else
	{
		["您已成功闯入大型机!",false,"slow"] call ANZUS_fnc_notificationSystem;
		[false, "USB5", 1] call ANZUS_fnc_handleInv;
		[true, "USB6", 1] call ANZUS_fnc_handleInv;
	};
};
