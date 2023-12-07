/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_createDarter.sqf

    Parameter(s):
        NONE

    Returns:
        NOTHING
*/

params [
	["_type", -1, [-1]]
];

if (_type isEqualTo -1) exitWith {};
switch (_type) do {
	case 0: {
		scriptName "szs_sdm_client_fnc_createDarter: main";
		scopeName "main";
		if !(isNil "SZS_createDarter_object") then {
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", SZS_createDarter_object];
		};

		SZS_createDarter_object = "B_UAV_01_F" createVehicle [0, 0, 100];
		SZS_createDarter_object allowDamage false;

		SZS_createDarter_object setDir (getDir player);
		SZS_createDarter_object attachTo [player, [0, 2, 2]];

		hint "Press 1 to place darter on ground.";

		[false, "drone", 1] call anzus_fnc_handleInv;

		SZS_createDarter_keyHandler_handle = (findDisplay 46) displayAddEventHandler ["KeyDown", {
			params ["_ctrl", "_dikCode"];

			private _fnc_detach = {
				detach SZS_createDarter_object;
				waitUntil {speed SZS_createDarter_object == 0};
				SZS_createDarter_object allowDamage true;
			};

			if (_dikCode isEqualTo 2) exitWith {
				[] spawn _fnc_detach;
				life_vehicles pushback SZS_createDarter_object;

				if !("B_UavTerminal" in assignedItems player) then {
					player addItem "B_UavTerminal";
					player assignItem "B_UavTerminal";
				};

				createVehicleCrew SZS_createDarter_object;

				if !(player connectTerminalToUAV SZS_createDarter_object) exitWith {["无法将终端连接到无人机",false,"slow"] call anzus_fnc_notificationSystem;};

				SZS_createDarter_object addAction [
					"Pack up Darter",
					{
						if !((_this select 0) in life_vehicles) exitWith {["你不能拾起.",false,"slow"] call anzus_fnc_notificationSystem;};

						deleteVehicle SZS_createDarter_object;
						SZS_createDarter_object = objNull;
						[true, "drone", 1] call anzus_fnc_handleInv
					},
					[],
					-1,
					true,
					true,
					"",
					""
				];

				(findDisplay 46) displayRemoveEventHandler ["KeyDown", SZS_createDarter_keyHandler_handle];
				true
			};
		}];
	};
	
	case 1: {
		["更高级的警官不允许您部署无人机",false,"slow"] call anzus_fnc_notificationSystem;
	};
};

