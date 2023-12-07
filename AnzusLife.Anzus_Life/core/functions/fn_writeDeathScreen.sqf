params [["_killer",objNull,[objNull]],["_killdist",0,[0]]];

if (isNull _killer) exitWith {};
if (!isPlayer _killer) exitWith {};

_display = uiNamespace getVariable ["AnzusLife_Deathscreen",displayNull];
if (isNull _display) exitWith {};

private "_groupNameKiller";
switch (side _killer) do {
	case civilian: {if(((group _killer) getVariable["gang_name",""]) isEqualTo "") then {_groupNameKiller = "No Gang"; } else {_groupNameKiller = "Gang: " + ((group _killer) getVariable["gang_name",""]); }; };
	case west:{_playerdept = _killer getVariable ["AnzusLife_CopDept",0]; _groupNameKiller = (getArray(missionConfigFile >> "CfgMaster" >> "GameSettings" >> "GovFactions" >> "cop_departmentsArray") select _playerdept);};
	case independent:{_groupNameKiller = "EMS";};
};

_KilledByText = format["击杀凶手: %1 (%2) (%3)",name _killer,_groupNameKiller,getPlayerUID _killer];
_KilledWeaponText = format["使用武器: %1", getText (configFile >> "CfgWeapons" >> currentWeapon _killer >> "displayname")];
_KilledDistanceText = format["击杀距离: %1米", round(_killdist)];

_Killedby = (_display displayCtrl 7310);
_KilledWeapon = (_display displayCtrl 7311);
_KilledDistance = (_display displayCtrl 7312);

_Killedby ctrlSetText _KilledByText;
_KilledWeapon ctrlSetText _KilledWeaponText;
_KilledDistance ctrlSetText _KilledDistanceText;
