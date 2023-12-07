closeDialog 0;

AnzusLife_WeedIsActive = true;
["你抽了一些大麻，现在会慢慢恢复健康。尽管你的饥饿感在迅速加快.","false","slow"] call ANZUS_fnc_notificationSystem;
[player,"weed"] remoteexeccall ["say3D",-2];

sleep 300;
AnzusLife_WeedIsActive = false;