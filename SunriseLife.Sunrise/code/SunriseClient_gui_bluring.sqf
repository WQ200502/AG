/*

	Filename: 	SunriseClient_gui_bluring.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
with uinamespace do {
	_display = _this param [0,displaynull,[displaynull]];
	_opening = _this param [1,false,[false]];

	if !(isnull _display) then {
		_ppDynamicBlur = missionNamespace getVariable "SunriseClient_gui_Tiles_ppDynamicBlur";
		if (isnil "_ppDynamicBlur") then {
			_ppDynamicBlur = ppeffectcreate ["DynamicBlur",213];
			missionNamespace setVariable ["SunriseClient_gui_Tiles_ppDynamicBlur",_ppDynamicBlur];
		};

		_display displayaddeventhandler ["unload","[] call SunriseClient_gui_bluring; false"];
		_ppDynamicBlur ppEffectEnable true;
		_ppDynamicBlur ppEffectAdjust [3];
		if (_opening) then {
			_ppDynamicBlur ppEffectCommit 0.5;
		} else {
			_ppDynamicBlur ppEffectCommit 0;
		};
	} else {
		_ppDynamicBlur = missionNamespace getVariable "SunriseClient_gui_Tiles_ppDynamicBlur";
		if !(isnil "_ppDynamicBlur") then {
			ppEffectDestroy _ppDynamicBlur;
			missionNamespace setVariable ["SunriseClient_gui_Tiles_ppDynamicBlur",nil];
		};
	};
};
true