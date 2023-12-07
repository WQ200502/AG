closeDialog 0;
AnzusLife_HeroinIsActive = true;

["您注射了海洛因，感觉更强壮，感觉更慢","false","slow"] call ANZUS_fnc_notificationSystem;

sleep 300;
AnzusLife_HeroinIsActive = false;