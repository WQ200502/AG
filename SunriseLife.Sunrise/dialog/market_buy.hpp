class Market_buy 
{
	idd = 15100;
	name= "Market_buy";
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
			idc = 15101;
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
			text = "КУПИТЬ"; //--- ToDo: Localize;
			onButtonClick = "[] spawn SunriseClient_market_buy;";
			x = 0.399 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorBackground[] = {0.24,0.58,0,1};
		};
		class RscButtonMenu_2401: Life_V3_ButtonMenu
		{
			idc = -1;
			text = "МОИ ВЕЩИ"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] spawn SunriseClient_market_loadInventory;";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class textEdit : RscExtremoGui_Edit {
			idc = 15102;
			text = "";
			x = 0.594 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscButtonMenu_2404: Life_V3_ButtonMenu
		{
			idc = -1;
			text = "ПОИСК"; //--- ToDo: Localize;
			onButtonClick = "_search = ctrlText 15102;closeDialog 0;[_search] spawn SunriseClient_market_load;";
			x = 0.669 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};