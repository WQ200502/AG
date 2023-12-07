// Mark close ATM by Doug and Dillon
private ["_atmMarker","_atmLocation"];

  if (time - life_atmTimer > 60) then {
    life_atmTimer = time;
    ["最近的自动取款机已在地图上用绿色圆圈标出.","green","slow"] call ANZUS_fnc_notificationSystem;
    _atmLocation = (nearestObjects [player,["Land_Mattaust_ATM"],4500] select 0);
    _atmmarker = createMarkerLocal ["nearestAtm2me", _atmLocation];
    _atmmarker setMarkerShapeLocal "ICON";
    _atmmarker setMarkerTypeLocal "Mil_Warning";
    _atmmarker setMarkerColorLocal "ColorGreen";
    _atmmarker setMarkerTextLocal "ATM";
    sleep 60;
    deleteMarkerLocal _atmMarker;
  } else {
    ["您最近使用过此按钮，请等待60秒后再重新使用.","false","slow"] call ANZUS_fnc_notificationSystem;
  };
