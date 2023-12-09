class SunriseDialogLTDShop {
	idd = 7400;
	name= "SunriseDialogLTDShop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_Tiles";

	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};
		class Tiles: RscTiles {};

		class MainBackground:Life_V3_BackGround {
			idc = -1;
			x = 0.287361 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.368818 * safezoneW;
			h = 0.4116 * safezoneH;
		};
	};

	class controls {
		class Title : Life_V3_Title {
			idc = 7401;
			text = "";
			x = 0.287361 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.36882 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\Sunrise_gui\data\v3\button_close.paa";

			x = 0.636416 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";

			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.636416 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class shopItemsTitle: Life_V3_RscText {
			idc = -1;
			text = "Магазин";
			x = 0.291308 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.129937 * safezoneW;
			h = 0.0224 * safezoneH;
		};

		class shopItemlist : Life_V3_RscListBox 
		{
			idc = 7402;
			text = "";

			x = 0.291309 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
			w = 0.360977 * safezoneW;
			h = 0.3276 * safezoneH;
		};

		class EditBuy : RscExtremoGui_Edit 
		{
			idc = 7403;
			text = "1";
			x = 0.291288 * safezoneW + safezoneX;
			y = 0.690433 * safezoneH + safezoneY;
			w = 0.0485599 * safezoneW;
			h = 0.030801 * safezoneH;
		};

		class ButtonBuy : Life_V3_ButtonMenu
		{
			idc = -1;
			text = "$STR_VS_BuyItem";
			onButtonClick = "[] spawn SunriseClient_ltd_shopBuy";

			x = 0.34514 * safezoneW + safezoneX;
			y = 0.6904 * safezoneH + safezoneY;
			w = 0.307135 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	};
};