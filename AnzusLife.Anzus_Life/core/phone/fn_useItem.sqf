#include "..\..\script_macros.hpp"

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];
if (isNull _display) exitWith {};


private _itemList = _display displayCtrl 130002;
private _itemSelection = lbCurSel _itemList;
if(player getVariable ["restrained",false]) exitWith {["哇，克蒙布鲁？ ？你没有被拘束吗?","true","slow"] call ANZUS_fnc_notificationSystem;};

if (_itemSelection isEqualto -1) exitWith {[localize "STR_ISTR_SelectItemFirst","true","slow"] call ANZUS_fnc_notificationSystem;};
private _item = _itemList lbData _itemSelection;

switch (true) do {
    case (_item in ["waterBottle","coffee","redgull","pepsi","cocacola","monsterEnergy"]): {
        if ([false,_item,1] call ANZUS_fnc_handleInv) then {
            life_thirst = 100;
            private _reduce = switch (_item) do {
            	case "redgull" : { 0.3 };
            	case "monsterEnergy" : { 0.3 };
            	case "coffee" : { 0.2 };
            	default { 0.05 };
            };
            private _aimCoef = (getCustomAimCoef player);
            player setCustomAimCoef (_aimCoef - (_aimCoef * _reduce));

            if (_item isEqualTo "redgull" || _item isEqualTo "monsterEnergy") then {
                [] spawn {
                    life_redgull_effect = time;
                    titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
                    player enableFatigue false;
                    waitUntil {!alive player || ((time - life_redgull_effect) > (3 * 60))};

                    _ownsDependency = [life_currentExpPerks, "functions_stamina_1"] call mav_ttm_fnc_hasPerk;
                    if (_ownsDependency) then {
                        player enableFatigue false;
                    } else {
                        player enableFatigue true;
                    };
                };
            };
        };
    };

	case (_item isEqualTo "cyanideCapsule"): {
		if (player getVariable ["restrained",false]) exitWith {["当你被约束时，你不能使用这个.","true","slow"] call ANZUS_fnc_notificationSystem;};

		if(([false,_item,1] call ANZUS_fnc_handleInv)) then {
			[] spawn {
				["Goodbye cruel world...","true","slow"] call ANZUS_fnc_notificationSystem;
				player setVariable["AnzusLife_UsedCyanide",true,true];
				sleep 3;
                player setHit ["head",1];
			};
		};
	};

    case (_item isEqualTo "storagesmall"): {
        [false] call ANZUS_fnc_mestorageBox;
    };

    case (_item isEqualTo "stabilizer"): {
        if (player getVariable ['inHostage',false] isEqualTo false && !(alive cursorObject) && player distance cursorObject <= 3) then {
            [cursorObject] spawn AnzusLife_StabilizePlayer;
        };
    };

    case (_item isEqualTo "storagebig"): {
        [true] call ANZUS_fnc_mestorageBox;
    };

    case (_item isEqualTo "drone"): {
        [0] remoteExec ["ANZUS_fnc_createDarter", player];
    };

    case (_item isEqualTo "gpstracker"): {
		[cursorTarget] spawn ANZUS_fnc_gpsTracker; closeDialog 0;
	};

    case (_item isEqualTo "enginedisable"): {
		[cursorTarget] spawn anzus_fnc_meengineDisable; closeDialog 0;
	};

    case (_item isEqualTo "doorc4"): {
        [cursorTarget] spawn AnzusLife_SWATRaid; closeDialog 0;
    };

    case (_item isEqualTo "protest"):
	{
		if(([false,_item,1] call ANZUS_fnc_handleInv)) then
		{
			[] spawn ANZUS_fnc_protest;
		};
	};

    case (_item isEqualTo "spikeStrip"): {
        if (!isNull life_spikestrip) exitWith {[localize "STR_ISTR_SpikesDeployment","true","slow"] call ANZUS_fnc_notificationSystem; closeDialog 0};
        if !(isNull(objectParent player)) exitWith {["您不能在车辆上使用它.","true","slow"] call ANZUS_fnc_notificationSystem; closeDialog 0};
        if ([false,_item,1] call ANZUS_fnc_handleInv) then {
            [] spawn anzus_fnc_mespikeStrip;
            closeDialog 0;
        };
    };

    case (_item isEqualTo "fuelFull"): {
        if !(isNull objectParent player) exitWith {[localize "STR_ISTR_RefuelInVehicle","true","slow"] call ANZUS_fnc_notificationSystem;};
        [] spawn anzus_fnc_mejerryRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "fuelEmpty"): {
        [] spawn anzus_fnc_mejerryCanRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "lockpick"): {
        [] spawn anzus_fnc_melockpick;
        closeDialog 0;
    };

	case (_item isEqualTo "bandage"):
	{
		[] spawn ANZUS_fnc_mebandage;
	};

    case (_item isEqualTo "marijuana"):
	{
		if(playerSide in [west,independent]) exitWith {["你不能在值班时吸毒!","false","slow"] call ANZUS_fnc_notificationSystem;};
		if(([false,_item,1] call ANZUS_fnc_handleInv)) then
		{
			[] spawn ANZUS_fnc_meweed;
		};
    };

    case (_item isEqualTo "cocaine_processed"):
	{
		if(playerSide in [west,independent]) exitWith {["你不能在值班时吸毒!","false","slow"] call ANZUS_fnc_notificationSystem;};
		if(([false,_item,1] call ANZUS_fnc_handleInv)) then
		{
			[] spawn ANZUS_fnc_mecocaine;
		};
	};

    case (_item isEqualTo "heroin_processed"):
	{
		if(playerSide in [west,independent]) exitWith {["你不能在值班时吸毒!","false","slow"] call ANZUS_fnc_notificationSystem;};
		if(([false,_item,1] call ANZUS_fnc_handleInv)) then
		{
			[] spawn anzus_fnc_meheroin;
		};
	};

    case (_item isEqualTo "morphine"):
      {
          if(([false,_item,1] call ANZUS_fnc_handleInv)) then
  		{
  			[] call anzus_fnc_memorphine;
  		};
    };

    case (_item isEqualTo "methTable"):
      {
          if(([false,_item,1] call ANZUS_fnc_handleInv)) then
      {
        [] call AnzusLife_MethAttachLocal
      };
    };

    case (_item isEqualTo "keyCard"):
    {
        player setVariable ["copLevel",1];
    };
	
    case (_item isEqualTo "vehnos"):
    {
        [] spawn anzus_fnc_vehnosuse;
    };

    case (_item isEqualTo "seeds"): {
      if (playerSide != civilian) exitWith {};
      if([false,_item,1] call ANZUS_fnc_handleInv) then
        {
          if(((player distance (getMarkerPos "cop_spawn_1") > 3000) && (player distance (getMarkerPos "cop_spawn_2") > 1000) && (player distance (getMarkerPos "cop_spawn_3") > 1000) && (player distance (getMarkerPos "cop_spawn_4") > 1000) && (player distance (getMarkerPos "cop_spawn_5") > 1000) && (player distance (getMarkerPos "cop_spawn_6") > 1000) && (player distance (getMarkerPos "cop_spawn_7") > 1000) && (player distance (getMarkerPos "cop_spawn_8") > 1000) && (player distance (getMarkerPos "cop_spawn_9") > 1000) && (player distance (getMarkerPos "cop_spawn_10") > 1000) && (player distance (getMarkerPos "Rebelop") > 1000) && (player distance (getMarkerPos "Rebelop_1") > 1000) && (player distance (getMarkerPos "Rebelop_2") > 1000) && (player distance (getMarkerPos "Weed_p_1") > 4000) && (player distance (getMarkerPos "weed_1") > 1000) && (player distance (getMarkerPos "weed_2") > 1000) && (player distance (getMarkerPos "weed_3") > 1000) && (player distance (getMarkerPos "weed_4") > 1000) && (player distance (getMarkerPos "weed_5") > 1000) && (player distance (getMarkerPos "weed_1_x") > 1000) && (player distance (getMarkerPos "weed_2_x") > 1000) && (player distance (getMarkerPos "weed_3_x") > 1000) && (player distance (getMarkerPos "weed_4_x") > 1000) && (player distance (getMarkerPos "weed_5_x") > 1000) && (player distance (getMarkerPos "gang_area_1") > 1000) && (player distance (getMarkerPos "gang_area_2") > 1000) && (player distance (getMarkerPos "gang_area_3") > 1000) && (player distance (getMarkerPos "gang_area_4") > 1000) && (player distance (getMarkerPos "hideout3") > 1000) )) then
          {
            _wfields = GVAR_MNS["wfields",[]];
            if (count _wfields < 5) then {
            _pos = getPos player;
            if (life_growweed) exitWith {["你最近已经种了大麻!","false","slow"] call ANZUS_fnc_notificationSystem;[true,_item,1] call ANZUS_fnc_handleInv;};
            life_growweed = true;
            [_pos,player] remoteExec ["AnzusLife_RunWeed",2]; ["您已经种植了大麻种子。 等到准备好","slow"] call ANZUS_fnc_notificationSystem;} else {[localize"STR_ISTR_NoSeeds",false,"slow"] call ANZUS_fnc_notificationSystem;[true,_item,1] call ANZUS_fnc_handleInv;};
          } else {["您距离警察局，重生点或另一个大麻场太近，无法种下这些种子!","false","slow"] call ANZUS_fnc_notificationSystem;[true,_item,1] call ANZUS_fnc_handleInv;};
          closeDialog 0;
        };
    };

		case (_item isEqualTo "vodka"):
	{
		if(playerSide in [west,independent]) exitWith {[localize"STR_MISC_WestIndNoNo",false,"slow"] call ANZUS_fnc_notificationSystem;};
		if(([false,_item,1] call ANZUS_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.04;
			if (life_drink < 0.01) exitWith {};
			[1] spawn ANZUS_fnc_drinkUp;
		};
	};

	case (_item isEqualTo "jimbeam"):
	{
		if(playerSide in [west,independent]) exitWith {[localize"STR_MISC_WestIndNoNo",false,"slow"] call ANZUS_fnc_notificationSystem;};
		if(([false,_item,1] call ANZUS_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.01) exitWith {};
			[2] spawn ANZUS_fnc_drinkUp;
		};
	};

	case (_item isEqualTo "beer"):
	{

		if(playerSide in [west,independent]) exitWith {[localize"STR_MISC_WestIndNoNo",false,"slow"] call ANZUS_fnc_notificationSystem;};
		if(([false,_item,1] call ANZUS_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.01) exitWith {};
			[3] spawn ANZUS_fnc_drinkUp;
		};
	};

    case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach","doritos","shittynoodles","kfc"]): {
        if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {
            if ([false,_item,1] call ANZUS_fnc_handleInv) then {
                _val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
                closedialog 0;
                player playAction "Gesture_eat";
                _sum = life_hunger + _val;
                switch (true) do {
                    case (_val < 0 && _sum < 1): {life_hunger = 5;};
                    case (_sum > 100): {life_hunger = 100;};
                    default {life_hunger = _sum;};
                };
            };
        };
    };


    default {
        [localize "STR_ISTR_NotUsable","false","slow"] call ANZUS_fnc_notificationSystem;
    };
};

[3] call ANZUS_fnc_updatePartial;
[] call ANZUS_fnc_LoadInventory;
[] spawn ANZUS_fnc_hudUpdate
