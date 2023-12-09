/*

	Filename: 	SunriseClient_evh_inventoryOnLoad.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
life_rbm = false;
private _display = _this select 0;

if !(isNull objectParent player) then {
	_display displayAddEventHandler ["MouseButtonDown","if ((_this select 1) == 0) then {life_rbm = true}"];
	_display displayAddEventHandler ["MouseButtonUp","if ((_this select 1) == 0) then {life_rbm = false}"];
	_display displayAddEventHandler ["MouseMoving", "if (life_rbm) then {closeDialog 0;['Перетаскивать предметы в машине запрещено!','error'] call SunriseClient_gui_bottomNotification}"];
};

private _backpack_title = _display ctrlCreate ["RscText", 7211];
//_backpack_title ctrlSetPosition [0.755956 * safezoneW + safezoneX,0.247 * safezoneH + safezoneY,0.110138 * safezoneW,0.022 * safezoneH];
_backpack_title ctrlSetPosition [safeZoneX + safeZoneW * 0.80625,safeZoneY + safeZoneH * 0.19722223,safeZoneW * 0.120,safeZoneH * 0.02222223];
_backpack_title ctrlSetBackgroundColor [0.1,0.1,0.1,1];
_backpack_title ctrlSetTextColor [1,1,1,1];
_backpack_title ctrlCommit 0;

private _backpack_items_list = _display ctrlCreate ["RscListbox", 7212];
//_backpack_items_list ctrlSetPosition [0.755486 * safezoneW + safezoneX,0.2698 * safezoneH + safezoneY,0.110138 * safezoneW,0.3856 * safezoneH];
_backpack_items_list ctrlSetPosition [safeZoneX + safeZoneW * 0.80625,safeZoneY + safeZoneH * 0.222,safeZoneW * 0.120,safeZoneH * 0.38611112];
_backpack_items_list ctrlCommit 0;

private _items_numbers = _display ctrlCreate ["RscEdit", 7213];
_items_numbers ctrlSetText "1";
//_items_numbers ctrlSetPosition [0.83496 * safezoneW + safezoneX,0.655089 * safezoneH + safezoneY,0.0307341 * safezoneW,0.022 * safezoneH];
_items_numbers ctrlSetPosition [safeZoneX + safeZoneW * 0.88515625,safeZoneY + safeZoneH * 0.6125,safeZoneW * 0.04,safeZoneH * 0.02222223];
_items_numbers ctrlCommit 0;

private _items_players_combo = _display ctrlCreate ["RscCombo", 7214];
//_items_players_combo ctrlSetPosition [0.755486 * safezoneW + safezoneX,0.655 * safezoneH + safezoneY,0.0771402 * safezoneW,0.022 * safezoneH];
_items_players_combo ctrlSetPosition [safeZoneX + safeZoneW * 0.80546875,safeZoneY + safeZoneH * 0.612,safeZoneW * 0.07734375,safeZoneH * 0.02222223];
_items_players_combo ctrlCommit 0;

private _use_item_button = _display ctrlCreate ["RscButtonUC", 7215];
_use_item_button ctrlSetText "Использовать";
_use_item_button buttonSetAction "[] call SunriseClient_system_useItem";
//_use_item_button ctrlSetPosition [0.755911 * safezoneW + safezoneX,0.68 * safezoneH + safezoneY,0.110138 * safezoneW,0.022 * safezoneH];
_use_item_button ctrlSetPosition [safeZoneX + safeZoneW * 0.80625,safeZoneY + safeZoneH * 0.64,safeZoneW * 0.120,safeZoneH * 0.025];
_use_item_button ctrlCommit 0;

private _give_item_button = _display ctrlCreate ["RscButtonUC", 7216];
_give_item_button ctrlSetText "Передать";
_give_item_button buttonSetAction "[] call SunriseClient_system_giveItem";
//_give_item_button ctrlSetPosition [0.75556 * safezoneW + safezoneX,0.705 * safezoneH + safezoneY,0.110138 * safezoneW,0.022 * safezoneH];
_give_item_button ctrlSetPosition [safeZoneX + safeZoneW * 0.80625,safeZoneY + safeZoneH * 0.67,safeZoneW * 0.120,safeZoneH * 0.025];
_give_item_button ctrlCommit 0;

private _delete_item_button = _display ctrlCreate ["RscButtonUC", 7217];
_delete_item_button ctrlSetText "Выбросить";
_delete_item_button buttonSetAction "[] call SunriseClient_system_yItemRemove";
//_delete_item_button ctrlSetPosition [0.75556 * safezoneW + safezoneX,0.7294 * safezoneH + safezoneY,0.110138 * safezoneW,0.022 * safezoneH];
_delete_item_button ctrlSetPosition [safeZoneX + safeZoneW * 0.80625,safeZoneY + safeZoneH * 0.70,safeZoneW * 0.120,safeZoneH * 0.025];
_delete_item_button ctrlCommit 0;

[_display] call SunriseClient_inventory_update;