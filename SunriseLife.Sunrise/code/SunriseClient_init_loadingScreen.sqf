/*

	Filename:   SunriseClient_init_loadingScreen.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/


scriptName "SunriseClient_init_loadingScreen: main";
scopeName "main";

disableSerialization;

if (
	!params
	[
		["_event", "", [""]],
		["_args", [], [[]]]
	]
) throw "Param error";

switch (_event) do
{
	case "onLoad":
	{
		_args params [ ["_display", displayNull, [displayNull]] ];

		// Play music
		0 fadeMusic 0;
		//playMusic "more_start";
		5 fadeMusic 0.5;

		// Play music as soon as it stops
		loadingProgress = 0;
		SR_displayInit_musicStopHandle = addMusicEventHandler ["MusicStop", { playMusic "AmbientTrack01_F_Orange"; }];

		// Setup camera
		"SPLASHNOISE" cutRsc ["SPLASHNOISE", "PLAIN", 10e10];
		["setupCamera", []] spawn SunriseClient_init_loadingScreen;

		{_x hideObject true} forEach allPlayers;
	};
	case "loadIn":
	{
		_args params [ ["_display", displayNull, [displayNull]] ];
		
		// Notify
		_ctrlLoadingText ctrlSetText "ЗАГРУЖАЕМСЯ...";

		// Spawn
		[] spawn SunriseClient_init_loadIn
	};
	case "modifyInitStatus":
	{
		_args params [
			["_incrementation", 0, [0]],
			["_loadingText", "", [""]],
			["_softLogFinished", false, [false]]
		];

		private _display = uiNamespace getVariable ["SR_displayInit", displayNull];
		private _ctrlLoadingText = _display displayCtrl 14;
		private _ctrlProgressBar = _display displayCtrl 13;

		loadingProgress = loadingProgress + _incrementation;
		if (_incrementation >= 0.01) then
		{
			if (_incrementation > 1 || {_incrementation < 0.1}) exitWith {};
			uiSleep 0.35;

			// Update loading text
			_ctrlLoadingText ctrlSetText (toUpper _loadingText);

			private _progressPosition = progressPosition _ctrlProgressBar;
			private _progressToAdd = (loadingProgress - _progressPosition) / 30;
			for "_i" from 0 to 30 do
			{
				_progressPosition = progressPosition _ctrlProgressBar;
				_ctrlProgressBar progressSetPosition (_progressPosition + _progressToAdd);
				uiSleep 0.01;
			};
		};
		if (loadingProgress >= 1) then {["loadIn", []] call SunriseClient_init_loadingScreen};
		
		/*private _aliveState = missionNamespace getVariable ["AV_player_alive", 0];
		кд при релоге
		if (loadingProgress >= 1) then
		{
			if (_aliveState isEqualTo 0) then
			{
				["loadIn", []] call SunriseClient_init_loadingScreen;
			}
			else
			{
				_ctrlLoadingText ctrlSetText "COOLDOWN TRIGGERED, PLEASE WAIT...";
				uiSleep 2;

				// Play cooldown track
				4 fadeMusic 0;
				sleep 4;
				playMusic "AmbientTrack01_F_Orange";
				4 fadeMusic 0.5;

				private _startTime = time;
				private _cooldown = 5 * 60;
				for "_i" from 0 to 1 step 0 do {
					private _timePassed = round (time - _startTime);
					private _time = [_cooldown - _timePassed, "MM:SS"] call BIS_fnc_secondsToString;
					_ctrlLoadingText ctrlSetText format ["COOLDOWN - %1", _time];

					// Timer finished (load in)
					if (_cooldown - _timePassed < 0) exitWith { ["loadIn", []] call SunriseClient_init_loadingScreen; };
				};
			};
		};*/
	};
	case "setupCamera":
	{
		private _camTargets = [];
		private _camTarget = [];
		private _camStart = [];

		_camTarget = [3644.95, 13109, 0];
		{_camTargets pushBack ((_camTarget getPos [500,_x]) select [0,2])} forEach [0,36,72,108,144,180,216,252,288,0,36,72,108,144,180,216,252,288,0];
		_camStart = (_camTargets select 0);
		_camTargets = _camTargets select [1,5];

		// No target
		if (count _camTargets < 1) throw "No configuration for targets of world";

		private _duration = 1.5;
		private _altitude = 180;
		private _commitTime = (_duration * 60) / count _camTargets;

		SR_displayInit_cameraHandle = "camera" camCreate (_camStart + [_altitude]);
		showCinemaBorder true;
		camUseNVG (sunOrMoon < 1);
		private _camera = SR_displayInit_cameraHandle;
		_camera cameraEffect ["INTERNAL", "BACK"];
		_camera camSetTarget _camTarget;
		_camera camCommit 0;

		showCinemaBorder false;

		// Loop through cam targets
		{
			private _new = _x + [_altitude];
			_new params [
				["_posX", 0, [0]],
				["_posY", 0, [0]],
				["_posZ", 0, [0]]
			];

			_camera camSetPos [_posX, _posY, _posZ];
			_camera camCommit _commitTime;

			waitUntil { camCommitted _camera; };
		} forEach _camTargets;
	};
	case "onUnload":
	{
		// No longer use NVGs
		camUseNVG false;

		// Destroy camera
		SR_displayInit_cameraHandle cameraEffect ["TERMINATE", "BACK"];
		camDestroy SR_displayInit_cameraHandle;

		// Remove music stop eventhandler
		"SPLASHNOISE" cutText ["", "PLAIN"];
		removeMusicEventHandler ["MusicStop", SR_displayInit_musicStopHandle];
	};
};
