class life_progress {
	idd = 38200;
	fadeout=0;
	fadein=0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	onUnload = "uiNamespace setVariable ['life_progress', displayNull]";
	duration = 10e10;
	name= "life_progress";
	controlsBackground[] = {};
	objects[] = {};
	
	class controls
	{
		class progressBack: RscExtremoGui_HudBG
		{
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.034 * safezoneH;
			//colorBackground[] = {1,1,1,0.35};
			//[0.345312 * safezoneW + safezoneX,0.863 * safezoneH + safezoneY,0.309375 * safezoneW,0.034 * safezoneH]
		};
		class textExpInfo: RscStructuredText
		{
			idc = 38202;
			text = ""; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			//[0.345312 * safezoneW + safezoneX,0.863 * safezoneH + safezoneY,0.309375 * safezoneW,0.022 * safezoneH]
		};
		class progressLevelProgress: RscProgress
		{
			idc = 38201;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.8878 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.008 * safezoneH;
			colorFrame[] = {0,0,0,0};
    		colorBackground[] = {0,0,0,0};
   	 		colorBar[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',1])", "(profilenamespace getvariable ['GUI_V3_BTBG_G',1])", "(profilenamespace getvariable ['GUI_V3_BTBG_B',1])", "(profilenamespace getvariable ['GUI_V3_BTBG_A',0.8])"};
			
			//["0.345312 * safezoneW + safezoneX","0.8878 * safezoneH + safezoneY","0.309375 * safezoneW","0.009 * safezoneH"]
		};
	};
};

class life_timer
{
	idd = -1;
	fadeIn = 1;
	duration = 10e+10;
	fadeout = 1;
	movingEnable = 0;
	name = "life_timer";
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['life_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = 38300;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0140625 * safezoneW;
			h = 0.025 * safezoneH;
		};

		class TimerText : RscText
		{
			idc = 38301;
			text = "";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
};
class death_timer
{
	name = "death_timer";
	idd = 38302;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['death_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['death_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TimerText : RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38303;
			text = "";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class jail_timer
{
	name = "jail_timer";
	idd = 38304;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['jail_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['jail_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		/*class TimerIcon : RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};*/
		
		class bg1: RscExtremoGui_HudBG
		{
			idc = -1;
			x = 0.719187 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			//[0.719187 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY,0.1 * safezoneW,0.04 * safezoneH]
		};
		class bg2: RscExtremoGui_HudBG
		{
			idc = -1;
			x = 0.719187 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.067 * safezoneH;
			//[0.719187 * safezoneW + safezoneX,0.878 * safezoneH + safezoneY,0.1 * safezoneW,0.067 * safezoneH]
		};
		class bg3: RscExtremoGui_HudBG
		{
			idc = -1;
			x = 0.719187 * safezoneW + safezoneX;
			y = 0.9508 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			//[0.719187 * safezoneW + safezoneX,0.9508 * safezoneH + safezoneY,0.1 * safezoneW,0.04 * safezoneH]
		};

		class JailName : RscExtremoGui_TextCenter
		{
			idc = -1;
			text = "ТЮРЬМА";
			sizeEx = 0.9 * GUI_GRID_H;
			x = 0.719187 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			//[0.719187 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY,0.1 * safezoneW,0.04 * safezoneH]
		};
		class TimerText : RscExtremoGui_TextCenter
		{
			idc = 38305;
			text = "";
			sizeEx = 2 * GUI_GRID_H;
			x = 0.719187 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.067 * safezoneH;
		};
		class JailText : RscExtremoGui_TextCenter
		{
			idc = -1;
			sizeEx = 0.8 * GUI_GRID_H;
			text = "min/sec";
			x = 0.719187 * safezoneW + safezoneX;
			y = 0.9508 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
	};
};
