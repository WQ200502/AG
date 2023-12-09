/*
	
	Filename: 	SunriseClient_system_repairTruck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _veh = cursorObject;
if (isNull _veh) exitwith {};
if (life_action_inUse) exitWith {["error","","Вы заняты"] call SunriseClient_message};
private _parts = [];
private _hitpoints = [];
private _hitpointsText = [];
private _partsText = "";
private _critical = 0;

//private _sleep = if (life_copDuty OR life_medDuty) then {10} else {25 * perk_specialist};
private _sleep = if (life_copDuty OR life_medDuty) then {10} else {15};

if ([_veh] call SunriseClient_system_isVehicleKind && ("srl_ItemRepairKit" in (items player))) then {
	switch (true) do {
		case (_veh isKindOf "Air"): {
			_hitpoints = ["HitEngine","HitHRotor","HitFuel","HitHull","HitVRotor","HitTransmission"];
			_hitpointsText = [localize "STR_NOTF_VehPartEngine",localize "STR_NOTF_VehPartRotor",localize "STR_NOTF_VehPartFuel",localize "STR_NOTF_VehPartHull",localize "STR_NOTF_VehPartRearRotor",localize "STR_NOTF_VehPartTransmission"];			
			_critical = 3;
		};
		
		case (_veh isKindOf "LandVehicle"): {			
			if ((typeof _veh) in ["I_Truck_02_transport_F","I_Truck_02_covered_F","I_Truck_02_covered_CIV_F","O_Truck_02_fuel_F","B_Truck_01_mover_F","B_Truck_01_transport_F","B_Truck_01_covered_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_fuel_F","B_Truck_01_box_F","B_Truck_01_box_CIV_F","B_Truck_01_fuel_F","B_Truck_01_fuel_CIV_F","O_Truck_03_device_F"]) then {
				_hitpoints = ["HitLFWheel","HitLF2Wheel","HitRF2Wheel","HitLBWheel","HitRFWheel","HitRBWheel","HitLMWheel","HitRMWheel","HitFuel","HitEngine","HitBody"];
				_hitpointsText = [localize "STR_NOTF_VehPartLFWheel",localize "STR_NOTF_VehPartLF2Wheel",localize "STR_NOTF_VehPartRF2Wheel",localize "STR_NOTF_VehPartLBWheel",localize "STR_NOTF_VehPartRFWheel",localize "STR_NOTF_VehPartRBWheel",localize "STR_NOTF_VehPartLMWheel",localize "STR_NOTF_VehPartRMWheel",localize "STR_NOTF_VehPartFuel",localize "STR_NOTF_VehPartEngine",localize "STR_NOTF_VehPartHull"];
				_critical = 4;
			} else {
				_hitpoints = ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitFuel","HitEngine","HitBody"];
				_hitpointsText = [localize "STR_NOTF_VehPartLFWheel",localize "STR_NOTF_VehPartLBWheel",localize "STR_NOTF_VehPartRFWheel",localize "STR_NOTF_VehPartRBWheel",localize "STR_NOTF_VehPartFuel",localize "STR_NOTF_VehPartEngine",localize "STR_NOTF_VehPartHull"];
				_critical = 3;
			};
		};
		
		case (_veh isKindOf "Ship"): {
			_hitpoints = ["HitEngine","HitBody"];
			_hitpointsText = [localize "STR_NOTF_VehPartEngine",localize "STR_NOTF_VehPartHull"];
			_critical = 2;
		};

	};
	
	if (EQUAL(_hitpoints,[])) exitWith {hint localize "STR_NOTF_VehUnknow"};
	
	{
		if (_veh getHitPointDamage _x > 0.65) then {
			_parts pushBack (_hitpointsText select _forEachIndex);
			_partsText = _partsText + format["- %1<br />",_hitpointsText select _forEachIndex];
		};
	} forEach _hitpoints;
	
	private _displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");	
	
	if (!(life_copDuty OR life_medDuty) && {(count units life_medGroup) > LIFE_SETTINGS(getNumber,"life_med_min")} && {(count _parts) >= _critical} && {"Двигатель" in _parts}) exitWith {	
		hint parseText format["<t size='1.3' color='#ff0000' align='center'>"+ localize "STR_NOTF_VehDamage" +"<br/>%1</t><br /><br /><t align='left'>%2</t><br /><t align='left'>"+ localize "STR_NOTF_VehRepairNeedHelp" +"</t>",_displayName,_partsText];				
	};
	
	if !(EQUAL(_parts,[])) then {_sleep = _sleep * (count _parts)};
	
	hint parseText format["<t size='1.3' color='#ff0000' align='center'>"+ localize "STR_NOTF_VehDamage" +"<br/>%1</t><br /><br /><t align='left'>%2</t>",_displayName,_partsText];

	[format[localize "STR_NOTF_Repairing",_displayName],_sleep,"repairme","",false,{if !(animationState player isEqualTo "acts_carfixingwheel") then {["Acts_carFixingWheel"] call SunriseClient_system_animDo};!(isNull objectParent player)}] call SunriseClient_system_progressBar;
	if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
	if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};
	if !(NOTINVEH(player)) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"]};
	if (random 1 > perk_master AND !life_medDuty) exitWith {["error","","Ремонт не удался. Попробуйте еще раз"] call SunriseClient_message};
		
	//if (!(life_copDuty OR life_medDuty) AND (random 1 > perk_master)) then {player removeItem "srl_ItemRepairKit"};		
	_veh setDamage 0;
	titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
};