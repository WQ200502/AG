/*

	Filename: 	SunriseClient_experiencegui_talentOverview.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
scriptName "RscDisplayTalentOverview";
#define __filename "RscDisplayTalentOverview.sqf"

disableSerialization;

try {
	// -- Parameters
	params [
		["_parameters", [], [[]]],
		["_mode", "", [""]]
	];
	private _caller = _parameters select 0;
	private _display = displayNull;

	switch (typeName _caller) do
	{
		case "DISPLAY":
		{
			["Control was DISPLAY"] call BIS_fnc_log;
			_display = _caller;
		};

		case "CONTROL": {
			["Control was CONTROL"] call BIS_fnc_log;
			_display = ctrlParent _caller;
		};

		default
		{
			throw "Caller isn't display or control";
		};
	};

	// -- No display found
	if (_display == displayNull) throw "Assosiated display cannot be found";

	// -- Controls
	_ctrlTextRankName = _display displayCtrl 4;
	_ctrlTextStatusInfo = _display displayCtrl 5;
	_ctrlProgress = _display displayCtrl 6;
	_ctrlTreeOverview = _display displayCtrl 7;
	_ctrlTextPerkName = _display displayCtrl 8;
	_ctrlTextPerkSubtitle = _display displayCtrl 9;
	_ctrlBtnPurchase = _display displayCtrl 10;
	_ctrlStrucTextDescription = _display displayCtrl 11;
	_ctrlSkillsListBox = _display displayCtrl 12;
	_ctrlPerksTable = _display displayCtrl 107;

	_updateGUI = {
		private _currentLevelConfig = missionConfigFile >> "Experience" >> "Levels" >> format["Level_%1", life_currentExpLevel];
		private _nextLevelConfig = missionConfigFile >> "Experience" >> "Levels" >> format["Level_%1", life_currentExpLevel + 1];
		private _currentLevelBottomExp = getNumber (_currentLevelConfig >> "expRequired");
		private _currentLevelTopExp = getNumber (_nextLevelConfig >> "expRequired");
		private _currentLevelRelativeExp = (life_currentExp - _currentLevelBottomExp);
		private _currentLevelProgress = if (_currentLevelRelativeExp != 0) then {((life_currentExp - _currentLevelBottomExp) / (_currentLevelTopExp - _currentLevelBottomExp))} else {0};

		// -- Display data
		_ctrlTextRankName ctrlSetText getText (_currentLevelConfig >> "displayName");

		if (isClass _nextLevelConfig) then {
			_ctrlTextStatusInfo ctrlSetText format ["XP: %1/%2, Очков навыков доступно: %3", life_currentExp - _currentLevelBottomExp, _currentLevelTopExp - _currentLevelBottomExp, life_currentPerkPoints];
			_ctrlProgress progressSetPosition _currentLevelProgress;
		} else {
			_ctrlTextStatusInfo ctrlSetText format ["XP: %1, Макс. Уровень, очков навыков доступно: %2", life_currentExp - _currentLevelBottomExp, life_currentPerkPoints];
			_ctrlProgress progressSetPosition 1;
		};

		private _ctrlPerksTableCountRows = ctRowCount _ctrlPerksTable - 1;
		for "_i" from 0 to _ctrlPerksTableCountRows do {
			(_ctrlPerksTable ctRowControls _i) params ["_firstBtn","_firstPic","_secondArrow","_secondBtn","_secondPic","_thirdArrow","_thirdBtn","_thirdPic"];
			{	
				_lvl = _forEachIndex + 1;
				_x params ["_btn","_pic",["_arrow",controlNull,[controlNull]]];
				private _perk = _ctrlPerksTable ctData _i;

				private _perkConfig = missionConfigFile >> "Experience" >> "Perks" >> (uiNamespace getVariable "TalentOverview_Tab") >> _perk;
				private _currentPerkLevel = [_perk] call SunriseClient_experience_getPerkLevel;
				
				if ((getArray (_perkConfig >> "requiredLevel") # _forEachIndex) <= life_currentExpLevel) then { // есть ли необходимый уровень
					if ((_currentPerkLevel + 2) > _lvl) then {//есть ли остальиные
						if !(_currentPerkLevel >= _lvl) then {//имеет ли перк
							if ((getArray (_perkConfig >> "requiredPerkPoints") # _forEachIndex) > life_currentPerkPoints) then {
								_pic ctrlSetTextColor [0.5,0.5,0.5,1];
								if !(isNull _arrow) then {_arrow ctrlSetTextColor [0.5,0.5,0.5,1]};
							} else {
								_pic ctrlSetTextColor [1,1,1,1];
								if !(isNull _arrow) then {_arrow ctrlSetTextColor [1,1,1,1]};
							};
						} else {
							_pic ctrlSetTextColor [0,0.8,0,1];
							if !(isNull _arrow) then {_arrow ctrlSetTextColor [0,0.8,0,1]};
						};
					} else {
						_pic ctrlSetTextColor [0.5,0.5,0.5,1];
						if !(isNull _arrow) then {_arrow ctrlSetTextColor [0.5,0.5,0.5,1]};
					};
				} else {
					_pic ctrlSetTextColor [0.5,0.5,0.5,1];
					if !(isNull _arrow) then {_arrow ctrlSetTextColor [0.5,0.5,0.5,1]};
				};
			} forEach [[_firstBtn,_firstPic],[_secondBtn,_secondPic,_secondArrow],[_thirdBtn,_thirdPic,_thirdArrow]];
		};

	};

	// -- Master switch depending on mode
	switch (_mode) do
	{
		case "onLoad":
		{

			private _currentLevelConfig = missionConfigFile >> "Experience" >> "Levels" >> format["Level_%1", life_currentExpLevel];
			private _nextLevelConfig = missionConfigFile >> "Experience" >> "Levels" >> format["Level_%1", life_currentExpLevel + 1];
			private _currentLevelBottomExp = getNumber (_currentLevelConfig >> "expRequired");
			private _currentLevelTopExp = getNumber (_nextLevelConfig >> "expRequired");
			private _currentLevelRelativeExp = (life_currentExp - _currentLevelBottomExp);
			private _currentLevelProgress = if (_currentLevelRelativeExp != 0) then {((life_currentExp - _currentLevelBottomExp) / (_currentLevelTopExp - _currentLevelBottomExp))} else {0};
	
			// -- Display data
			_ctrlTextRankName ctrlSetText getText (_currentLevelConfig >> "displayName");
	
			if (isClass _nextLevelConfig) then {
				_ctrlTextStatusInfo ctrlSetText format ["XP: %1/%2, Очков навыков доступно: %3", life_currentExp - _currentLevelBottomExp, _currentLevelTopExp - _currentLevelBottomExp, life_currentPerkPoints];
				_ctrlProgress progressSetPosition _currentLevelProgress;
			} else {
				_ctrlTextStatusInfo ctrlSetText format ["XP: %1, Макс. Уровень, очков навыков доступно: %2", life_currentExp - _currentLevelBottomExp, life_currentPerkPoints];
				_ctrlProgress progressSetPosition 1;
			};

			_ctrlBtnPurchase ctrlSetStructuredText parsetext "<t shadow='2' valign='middle' size='2'>ВЫБЕРИТЕ ПЕРК</t>";

		};
		case "OnTabButtonClick":
		{

			_parameters params ["", "_skill"];
			uiNamespace setVariable ["TalentOverview_Tab",_skill];
			ctClear _ctrlPerksTable;
			private _perkSkill = missionConfigFile >> "Experience" >> "Perks" >> _skill;
			{	
				private _perk = configName _x;
				private _perkConfig = _perkSkill >> _perk;
				//делаем заголовок
				_header = ctAddHeader _ctrlPerksTable;
				(_header#1#0) ctrlSetStructuredText parseText format["<t align='center'>%1</t>",getText (_perkConfig >> "displayName")];
				//делаем ряд
				_row = ctAddRow _ctrlPerksTable;
				_row#1 params ["_firstBtn","_firstPic","_secondArrow","_secondBtn","_secondPic","_thirdArrow","_thirdBtn","_thirdPic"];
				_ctrlPerksTable ctSetData [_row#0, _perk];
				{
					_lvl = _forEachIndex + 1;
					_x params ["_btn","_pic"];
					_btn buttonSetAction format["[[findDisplay 6600,%1,'%2'], 'onButtonClick'] call SunriseClient_experiencegui_talentOverview;",_lvl, _perk];
					_pic ctrlSetText ("\sunrise_config\perks\"+_perk+".paa"); // массив с картинками в конфиге
				} forEach [[_firstBtn,_firstPic],[_secondBtn,_secondPic],[_thirdBtn,_thirdPic]];
				_secondArrow ctrlSetText "\sunrise_config\perks\strelka.paa";
				_thirdArrow ctrlSetText "\sunrise_config\perks\strelka.paa";

			} forEach ("true" configClasses _perkSkill);

			[] call _updateGUI;

		};

		case "onButtonClick":
		{
			_parameters params ["", "_lvl", "_perk"];
			private _lvl_selection = _lvl - 1;
			private _selectedPerkConfig = missionConfigFile >> "Experience" >> "Perks" >> (uiNamespace getVariable "TalentOverview_Tab") >> _perk;
			private _currentPerkLevel = [_perk] call SunriseClient_experience_getPerkLevel;
			private _requiredLevel = (getArray (_selectedPerkConfig >> "requiredLevel") # _lvl_selection);
			private _requiredPerkPoints = getArray (_selectedPerkConfig >> "requiredPerkPoints") # _lvl_selection;

			_ctrlTextPerkName ctrlSetText getText (_selectedPerkConfig >> "displayName");
			_ctrlTextPerkSubtitle ctrlSetText format ["Нужно %1 очков навыков и %2 уровень",_requiredPerkPoints, _requiredLevel];
			_ctrlStrucTextDescription ctrlSetStructuredText parseText (getArray (_selectedPerkConfig >> "description") # _lvl_selection);

			if (_requiredLevel <= life_currentExpLevel) then { // имеет ли уровень
				if ((_currentPerkLevel + 2) > _lvl) then { //есть ли остальные
					if !(_currentPerkLevel >= _lvl) then { //имеет ли этот
						if (_requiredPerkPoints > life_currentPerkPoints) then {
							_ctrlBtnPurchase ctrlSetStructuredText parsetext "<t shadow='2' valign='middle' size='2'>НЕТ ОЧКОВ</t>";
							_ctrlBtnPurchase ctrlEnable false;
						} else {
							_ctrlBtnPurchase ctrlSetStructuredText parsetext "<t shadow='2' valign='middle' size='2'>ОТКРЫТЬ</t>";
							_ctrlBtnPurchase ctrlEnable true;
							_ctrlBtnPurchase buttonSetAction format["[[findDisplay 6600,%1,'%2'], 'onButtonPurchaseClick'] call SunriseClient_experiencegui_talentOverview;",_lvl,_perk];
						};
					} else {
						_ctrlBtnPurchase ctrlSetStructuredText parsetext "<t shadow='2' valign='middle' size='2'>УЖЕ ОТКРЫТО</t>";
						_ctrlBtnPurchase ctrlEnable false;
					};
				} else {
					_ctrlBtnPurchase ctrlSetStructuredText parsetext "<t shadow='2' valign='middle' size='2'>НЕЛЬЗЯ ОТКРЫТЬ</t>";
					_ctrlBtnPurchase ctrlEnable false;
				};
			} else {
				_ctrlBtnPurchase ctrlSetStructuredText parsetext "<t shadow='2' valign='middle' size='2'>МАЛЕНЬКИЙ УРОВЕНЬ</t>";
				_ctrlBtnPurchase ctrlEnable false;
			};
		};

		case "onButtonPurchaseClick":
		{
			_parameters params ["", "_lvl", "_perk"];
			private _selectedPerkConfig = missionConfigFile >> "Experience" >> "Perks" >> (uiNamespace getVariable "TalentOverview_Tab") >> _perk;

			{
			if (_x#0 isEqualTo _perk) exitWith {life_currentExpPerks set [_forEachIndex,[_perk,_lvl]]};
			} forEach life_currentExpPerks;


			hint "Вы успешно открыли навык!";

			// -- Disable purchase button
			_ctrlBtnPurchase ctrlSetText "ОТКРЫТ!";
			_ctrlBtnPurchase ctrlEnable false;

			// -- Subtract perk points
			life_currentPerkPoints = life_currentPerkPoints - (getArray (_selectedPerkConfig >> "requiredPerkPoints") # (_lvl - 1));

			// -- Update GUI
			[] call _updateGUI;

			// -- Display notification
			[_selectedPerkConfig] call SunriseClient_experiencegui_perkUnlocked;

			// -- Run perk init script
		    [] call SunriseClient_experience_initPerks;

			// -- Update to database
			[1] call SunriseClient_experience_clientSendUpdateToServer;
		};
	};
} catch {
	[format ["[%1] %2", __filename, _exception]] call BIS_fnc_error;
};