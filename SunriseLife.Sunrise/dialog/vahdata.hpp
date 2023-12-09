class SunriseDialogVehData
{
	idd = 5600;
	name = "SunriseDialogVehData";
	movingEnabled = 0;
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

			colorBackground[] = { 0, 0, 0, 0.25 };
		};
		class Tiles: RscTiles {};


		class MainBackground: RscExtremoGui_DialogBG {
			idc = -1;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.308 * safezoneH;
		};
	};

	class controls
	{
		class Title : RscExtremoGui_HeaderBG {
			idc = 5601;
			text = "";
			
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";

			x = 0.591875 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
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

			x = 0.591875 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class t_plate: Life_V3_RscText {
			idc = -1;
			text = "Номер:";
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0406875 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class e_plate: RscExtremoGui_Edit {
			idc = 5602;
			text = "AAAAA99";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class b_search: RscExtremoGui_ButtonDark {
			idc = 5603;
			text = "Поиск";
			onButtonClick = "[] call SunriseClient_vehdatabase_Search";
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class st_data: Life_V3_RscStructuredText {
			idc = 5604;
			text = "";
			x = 0.381873 * safezoneW + safezoneX;
			y = 0.444 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.252 * safezoneH;
		};
	};
};