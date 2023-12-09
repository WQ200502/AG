class Market_vsell 
{
	idd = 15600;
	name= "Market_vsell";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.25 };
		};
		class Tiles: RscTiles {};
		class padImage : RscExtremoGui_DialogBG {
			idc = -1;
			text = "";

			x = 0.263205 * safezoneW + safezoneX;
			y = 0.225045 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.54 * safezoneH;
		};
		class Title : Life_V3_Title {			
			idc = -1;
			text = "Торговая площадка";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};

	class controls {
		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.716562 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.02475 * safezoneH;
		};
		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.716562 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.02475 * safezoneH;
		};
		class RscListbox_1500: Life_V3_RscListBox
		{
			idc = 15601;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.461447 * safezoneW;
			h = 0.440074 * safezoneH;
			sizeEx = 0.04;
			onLBSelChanged = "_this spawn SunriseClient_market_select";
		};
		class RscButtonMenu_2400: Life_V3_ButtonMenu
		{
			idc = -1;
			text = "ПРОДАТЬ"; //--- ToDo: Localize;
			onButtonClick = "[] spawn SunriseClient_market_sell;";
			x = 0.669 * safezoneW + safezoneX; //399 - 604
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorBackground[] = {0.24,0.58,0,1};
		};
		class RscButtonMenu_2401: Life_V3_ButtonMenu
		{
			idc = -1;
			text = "НАЗАД"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] spawn SunriseClient_market_load;";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = -1;
			text = "КОЛИЧЕСТВО"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.731004 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class textEdit : RscExtremoGui_Edit {
			idc = 15602;
			text = "1";
			x = 0.49 * safezoneW + safezoneX; //464
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.022 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = -1;
			text = "ЦЕНА $"; //--- ToDo: Localize;
			x = 0.55 * safezoneW + safezoneX; //334
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.062 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class textEdit2 : RscExtremoGui_Edit {
			idc = 15603;
			text = "50";
			x = 0.604 * safezoneW + safezoneX; //464
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		
		class RscButtonMenu_2404: Life_V3_ButtonMenu
		{
			idc = -1;
			text = "ВЕРНУТЬ"; //--- ToDo: Localize;
			onButtonClick = "[] spawn SunriseClient_market_takeBack;";
			x = 0.334 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	
	};
};