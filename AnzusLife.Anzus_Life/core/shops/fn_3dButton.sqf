/*
    File: fn_3dPreviewDisplay.sqf
    Author: KLM

    Description:
    Called to change the object in the 3d preview.
*/

if ((tvCurSel 8000243) isEqualTo []) exitWith {[localize "STR_Shop_Veh_DidntPick","true","slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
private _tvData = tvData[8000243,(tvCurSel 8000243)];
if (_tvData isEqualTo "") exitWith {};

private _vehicleData = parseSimpleArray _tvData;
_vehicleData params
  [
      ["_className", "", [""]]
  ];

private _className = lbData[2302,(lbCurSel 2302)];
if (isNil "life_3dPreview_camera") then {[(findDisplay 2300)] call ANZUS_fnc_3dPreviewInit;};

[_className] call ANZUS_fnc_3dPreviewDisplay;
