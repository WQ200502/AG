class playerSettingsWZ
{
	idd = 9701;
	movingEnable = false;
	enableSimulation = true;
	onUnload = "deleteMarkerLocal life_warzone_markerName; deleteMarkerLocal life_warzone_markerName2;";
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;[_this] call SunriseClient_martiallaw_initControls";
	class controlsBackground
	{
		class padImage : RscExtremoGui_DialogBG {
			idc = 2001;
			text = "";

			x = 0;
			y = 0.084;
			w = 1;
			h = 0.84;
		};
		class bgButton2 : RscExtremoGui_DialogBG {			
			idc = -1;
			text = "";

			x = 0;
			y = 0.007;
			w = 0.688;
			h = 0.07;
		};
	
		class Title2 : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "ВОЕННОЕ ПОЛОЖЕНИЕ";
			
			x = 0.7;
			y = 0.007;
			w = 0.3;
			h = 0.07;
		};
		
		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.95;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";  
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.95;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class map: RscMapControl
		{
			idc = 4001;
			x = 0.025;
			y = 0.098;
			w = 0.9525;
			h = 0.764;
			scaleMin = 0.03;
			scaleMax = 0.6;
			scaleDefault = 0.3;
			onMouseButtonDown = "[_this,""mouseButtonDown""] call SunriseClient_martiallaw_mouseEventsHandler";
			onMouseButtonUp = "[_this,""mouseButtonUp""] call SunriseClient_martiallaw_mouseEventsHandler";
		};
	};
	class controls
	{
		class wzControls: RscControlsGroup
		{
			idc = 4002;
			x = 0.095;
			y = 0.756;
			w = 0.945;
			h = 0.14;
			class Controls
			{
				class wzControlBackground: RscText
				{
					idc = -1;
					x = 0;
					y = 0;
					w = 0.807;
					h = 0.105;
					colorBackground[] = {0,0,0,0.8};
				};
				class wzControlPlace: RscText
				{
					idc = 4003;
					x = 0;
					y = 0;
					w = 0.6;
					h = 0.04;
					text = "";
					sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					colorText[] = {1,1,1,1};
					colorBackground[] = {0,0,0,0};
				};
				class wzControlRadius: RscText
				{
					idc = 4004;
					x = 0;
					y = 0.045;
					w = 0.6;
					h = 0.04;
					text = "";
					sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					colorText[] = {1,1,1,1};
					colorBackground[] = {0,0,0,0};
				};
				class wzControlCreateButton: RscExtremoGui_ButtonRed
				{
					idc = 4005;
					x = 0.653;
					y = 0.05;
					w = 0.145;
					h = 0.04;
					text = " ОБЪЯВИТЬ";
					colorBackground[] = {0.75,0,0,1};
					onMouseButtonClick = "[] call SunriseClient_martiallaw_create";
				};
				class wzControlRevokeButton: RscExtremoGui_ButtonBlue
				{
					idc = 4006;
					x = 0.653;
					y = 0.05;
					w = 0.145;
					h = 0.04;
					text = " Отменить";
					colorBackground[] = {0,0,0,1};
					onMouseButtonClick = "[] call SunriseClient_martiallaw_delete";
				};
		};
		};
	};
};