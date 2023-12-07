#include "..\..\script_macros.hpp"

params [
	["_type","",[""]]
];

_testPrice = 1000;
switch (_type) do {
	case "Fail": {
		closeDialog 0;
		[player,"TestFailure"] remoteexeccall ["say3D",-2];
		["You have failed your test, please read our rules!","false","slow"] call ANZUS_fnc_notificationSystem;
	};

	case "One": {
		if(!([_testPrice] call ANZUS_fnc_debitCard)) exitWith {[format["你没有钱参加这个测试，价格是%1美元", [_testPrice] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;};
		[0] call ANZUS_fnc_updatePartial;

		closeDialog 0;
		CreateDialog "speedLimitCity";
	};

	case "Two": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "speedLimitHW";
	};

	case "Three": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "speedingCar";
	};

	case "Four": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "trolling";
	};

	case "Five": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "pullOverIllegal";
	};

	case "Six": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "carCrash";
	};

	case "Seven": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "turning";
	};

	case "Eight": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "federal";
	};

	case "Nine": {
		closeDialog 0;
		playSound "TestCorrect";
		CreateDialog "checkpoint";
	};

	case "Pass": {
		if ((time - life_action_delay) < 5) exitWith {closeDialog 0;};
		closeDialog 0;
		life_action_delay = time;

		missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),true];
		["DMV"] spawn mav_ttm_fnc_addExp;

		[player,"TestComplete"] remoteexeccall ["say3D",-2];
		[2] call ANZUS_fnc_updatePartial;

		["恭喜你！您已通过测试！您现在可以购买任何车辆，请遵守交通规则!","true","slow"] call ANZUS_fnc_notificationSystem;
	};
};
