class default
{
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=0;
	fadein=0;
	duration = 0;

	class controlsBackground {};

	class controls
	{};
};


class playerHUD {
	idd = 5100;
	name= "playerHUD";
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=0;
	fadein=0;
	duration = 86400;
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";

	class controlsBackground {};

	class controls {
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.863 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.135093 * safezoneW;
			h = 0.1012 * safezoneH;
			colorBackground[] = {0.12,0.14,0.16,0.8};
			shadow = 2;
		};
		class currentAmmo: RscText
		{
			idc = 100;
			text = "000"; //--- ToDo: Localize;
			x = 0.865064 * safezoneW + safezoneX;
			y = 0.894 * safezoneH + safezoneY;
			w = 0.0711564 * safezoneW;
			h = 0.055 * safezoneH;
			//sizeEx = 3.8 * GUI_GRID_H;
			sizeEx = /*safezoNeW/*/(3*0.04);
			shadow = 2;
		};
		class reserveAmmo: RscText
		{
			idc = 101;
			text = "000"; //--- ToDo: Localize;
			x = 0.952714 * safezoneW + safezoneX;
			y = 0.8982 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			//sizeEx = 1.9 * GUI_GRID_H;
			sizeEx = /*safezoNeW/*/(1.9*0.04);
			shadow = 2;
		};
		class RscText_1002: RscText
		{
			idc = 106;
			text = "/"; //--- ToDo: Localize;
			x = 0.940341 * safezoneW + safezoneX;
			y = 0.8982 * safezoneH + safezoneY;
			w = 0.0113438 * safezoneW;
			h = 0.0374 * safezoneH;
			//sizeEx = 1.5 * GUI_GRID_H;
			sizeEx = /*safezoNeW/*/(1.5*0.04);
			shadow = 2;
		};
		class firemode: Life_RscStructuredText
		{
			idc = 102;
			text = "[  自动  ]"; //--- ToDo: Localize;
			x = 0.93969 * safezoneW + safezoneX;
			y = 0.934852 * safezoneH + safezoneY;
			w = 0.0495002 * safezoneW;
			h = 0.0176 * safezoneH;
			//sizeEx = 1 * GUI_GRID_H;
			//sizeEx = /*safezoNeW/*/(1*0.04);
			shadow = 2;
		};
		class RscText_1004: RscText
		{
			idc = 103;
			text = "+"; //--- ToDo: Localize;
			x = 0.936218 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.033 * safezoneH;
			//sizeEx = 3 * GUI_GRID_H;
			sizeEx = /*safezoNeW/*/(3*0.04);
			shadow = 2;
		};
		class healthpoints: RscText
		{
			idc = 104;
			text = "000"; //--- ToDo: Localize;
			x = 0.952719 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0352 * safezoneH;
			//sizeEx = 1.9 * GUI_GRID_H;
			sizeEx = /*safezoNeW/*/(1.9*0.04);
			shadow = 2;
		};
        class Bearing: Life_RscStructuredText
        {
            idc=15023;
            text="";
            x="0.040625 * safezoneW + safezoneX";
            y="0.01 * safezoneH + safezoneY";
            w="0.938437 * safezoneW";
            h="0.042 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
        class SpeedInfo: Life_RscStructuredText
        {
            idc=15025;
            text="";
            show="false";
            x="0.902187 * safezoneW + safezoneX";
            y="0.764 * safezoneH + safezoneY";
            w="0.0876563 * safezoneW";
            h="0.055 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
        class speed: Life_RscStructuredText
        {
            idc = 1000;
            text = ""; //--- ToDo: Localize;
            show="false";
            x = 0.866017 * safezoneW + safezoneX;
            y = 0.83 * safezoneH + safezoneY;
            w = 0.0567068 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class fuel: Life_RscStructuredText
        {
        	idc = 1001;
        	text = ""; //--- ToDo: Localize;
        	show="false";
            x = 0.938189 * safezoneW + safezoneX;
            y = 0.83 * safezoneH + safezoneY;
            w = 0.0567068 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class FuelProgressBar: Life_RscProgress
        {
            idc=1605;
            show="false";
            x = 0.862923 * safezoneW + safezoneX;
            y = 0.885 * safezoneH + safezoneY;
            w = 0.134034 * safezoneW;
            h = 0.0055 * safezoneH;
            colorFrame[]={0,0,0,0};
            colorBackground[]={0,0,0,0};
            colorBar[]={0.95999998,0.64999998,0.12,0.80000001};
        };
		class grenades: RscText
		{
			idc = 105;
			text = "Gx01"; //--- ToDo: Localize;
			x = 0.86714 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0615625 * safezoneW;
			h = 0.0352 * safezoneH;
			//sizeEx = 1.9 * GUI_GRID_H;
			sizeEx = /*safezoNeW/*/(1.9*0.04);
			shadow = 2;
		};
	};
};