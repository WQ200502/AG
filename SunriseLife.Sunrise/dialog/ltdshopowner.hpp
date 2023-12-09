class SunriseDialogLTDShopOwner {
	idd = 7800;
	name= "SunriseDialogLTDShopOwner";
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
			x = 0.272918 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.455482 * safezoneW;
			h = 0.400484 * safezoneH;
		};
	};

	class controls {
		class Title : Life_V3_Title {
			idc = 7801;
			text = "";
			x = 0.272918 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.456791 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\Sunrise_gui\data\v3\button_close.paa";

			x = 0.709944 * safezoneW + safezoneX;
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

			x = 0.709944 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class shopItemsTitle: Life_V3_RscText {
			idc = -1;
			text = "Товары на продажу";
			x = 0.276865 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.129937 * safezoneW;
			h = 0.0224 * safezoneH;
		};

		class shopItemlist : Life_V3_RscListBox 
		{
			idc = 7802;
			text = "";

			x = 0.276866 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
			w = 0.262527 * safezoneW;
			h = 0.355662 * safezoneH;

			onLBSelChanged = "_this call SunriseClient_ltd_shopMenuOwnerLBChange";
		};

		class add_item_title: Life_V3_RscText
		{
			idc = -1;
			text = "Добавить товар"; //--- ToDo: Localize;
			x = 0.544617 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.175892 * safezoneW;
			h = 0.0224 * safezoneH;
		};
		class user_items_list: Life_V3_RscListBox
		{
			idc = 7803;
			x = 0.545942 * safezoneW + safezoneX;
			y = 0.354376 * safezoneH + safezoneY;
			w = 0.177205 * safezoneW;
			h = 0.140024 * safezoneH;
		};
		class t_counttoAdd: Life_V3_RscText
		{
			idc = -1;
			text = "Количество:"; //--- ToDo: Localize;
			x = 0.544629 * safezoneW + safezoneX;
			y = 0.5028 * safezoneH + safezoneY;
			w = 0.118137 * safezoneW;
			h = 0.0224038 * safezoneH;
		};
		class e_counttoAdd: RscExtremoGui_Edit
		{
			idc = 7804;
			text = "1";
			x = 0.670642 * safezoneW + safezoneX;
			y = 0.500002 * safezoneH + safezoneY;
			w = 0.0525053 * safezoneW;
			h = 0.0280048 * safezoneH;
		};
		class t_pricePerOne: Life_V3_RscText
		{
			idc = -1;
			text = "Цена за штуку:"; //--- ToDo: Localize;
			x = 0.544629 * safezoneW + safezoneX;
			y = 0.536406 * safezoneH + safezoneY;
			w = 0.118137 * safezoneW;
			h = 0.0224038 * safezoneH;
		};
		class e_pricePerOne: RscExtremoGui_Edit
		{
			idc = 7805;
			text = "100";
			tooltip = "Учитывается только если это новый товар в магазине";
			x = 0.670642 * safezoneW + safezoneX;
			y = 0.533606 * safezoneH + safezoneY;
			w = 0.0525053 * safezoneW;
			h = 0.0280048 * safezoneH;
		};
		class sell_b: Life_V3_ButtonMenu
		{
			idc = 7806;
			text = "Добавить"; //--- ToDo: Localize;
			x = 0.545942 * safezoneW + safezoneX;
			y = 0.570012 * safezoneH + safezoneY;
			w = 0.177205 * safezoneW;
			h = 0.0280048 * safezoneH;
			onButtonClick = "[] spawn SunriseClient_ltd_shopSubmit";
		};

		class t_ChangePriceTitle: Life_V3_RscText
		{
			idc = -1;
			text = "Изменить цену товара"; //--- ToDo: Localize;
			x = 0.544629 * safezoneW + safezoneX;
			y = 0.612019 * safezoneH + safezoneY;
			w = 0.171965 * safezoneW;
			h = 0.0224 * safezoneH;
		};
		class t_priceSelected: Life_V3_RscText
		{
			idc = -1;
			text = "Новая цена:"; //--- ToDo: Localize;
			x = 0.544629 * safezoneW + safezoneX;
			y = 0.651226 * safezoneH + safezoneY;
			w = 0.118137 * safezoneW;
			h = 0.0224038 * safezoneH;
		};
		class e_priceSelected: RscExtremoGui_Edit
		{
			idc = 7807;
			text = "100";
			tooltip = "Цена для товара, который выбран в магазине";
			x = 0.671008 * safezoneW + safezoneX;
			y = 0.647843 * safezoneH + safezoneY;
			w = 0.0525053 * safezoneW;
			h = 0.0280048 * safezoneH;
		};
		class b_edit_selected: Life_V3_ButtonMenu
		{
			idc = 7808;
			text = "Изменить"; //--- ToDo: Localize;
			x = 0.545942 * safezoneW + safezoneX;
			y = 0.682031 * safezoneH + safezoneY;
			w = 0.177205 * safezoneW;
			h = 0.0280048 * safezoneH;	
			onButtonClick = "[] spawn SunriseClient_ltd_shopEditPrice";		
		};
	};
};