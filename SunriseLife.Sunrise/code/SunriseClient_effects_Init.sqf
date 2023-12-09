/*

	Filename: 	SunriseClient_effects_Init.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
//не наркоман ли ты случаем?
if (LIFE_HANDLE_DRUGS isEqualTo -1 && {life_drug_light OR life_drug_hard}) then {call SunriseClient_effects_Drugs};

//паспорта и взломанные дома
if (LIFE_HANDLE_TEMPVARS isEqualTo -1 && {!(life_ids isEqualTo []) OR !(life_tempHouses isEqualTo [])}) then {call SunriseClient_effects_TempVars};

//если не полная жизнь
if (LIFE_HANDLE_DMG isEqualTo -1 && {damage player > 0.25}) then {call SunriseClient_effects_Dmg};

//болеем ли мы
if (LIFE_HANDLE_SICK isEqualTo -1 && {life_sickness}) then {call SunriseClient_effects_Sick};

//бухлишко
if (LIFE_HANDLE_DRUNK isEqualTo -1 && {life_drink > 0}) then {call SunriseClient_effects_Drunk};

if (LIFE_HANDLE_CIRRHOSIS isEqualTo -1 && {"cirrhosis" in life_array_problem}) then {call SunriseClient_cirrhosis};

//еда и вода
if (LIFE_HANDLE_FOODWATER isEqualTo -1) then {call SunriseClient_effects_FoodWater};

//рюкзак и макс вес
if (LIFE_HANDLE_WEIGHT isEqualTo -1) then {call SunriseClient_effects_Weight};

//пвп режим
if (LIFE_HANDLE_PVP isEqualTo -1 && life_pvp) then {call SunriseClient_effects_PvP};

//внутри зоны боя
if (LIFE_HANDLE_WARZONES isEqualTo -1 && {life_inwarzone OR !(EQUAL(server_warzones,[]))}) then {call SunriseClient_effects_WarZones};

//TeamSpeak
if (LIFE_HANDLE_TEAMSPEAK isEqualTo -1 && {!server_ddos_ts}) then {call SunriseClient_effects_TeamSpeak};

//Regeneration
if (LIFE_HANDLE_REGEN isEqualTo -1 && {perk_metabolism > 0}) then {call SunriseClient_effects_Regen};

if (time - life_lastSync > 15*60) then {
	[] call SunriseClient_session_updateRequest;
	["info","",format["Автоматическое сохранение. Следующее сохранение через 15 минут."],true] call SunriseClient_message;
	life_lastSync = time;
};