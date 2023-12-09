class SunriseDialogWeaponShop {
	idd = 38400;
	name= "SunriseDialogWeaponShop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['SunriseDialogWeaponShop',_this select 0]";
	onUnload = "uiNamespace setVariable ['SunriseDialogWeaponShop', objNull]";

	class controlsBackground {
		class bg: RscExtremoGui_DialogBG
		{
			idc = 38427;

			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.0492 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.9492 * safezoneH;
			//[0.00256251 * safezoneW + safezoneX,0.0492 * safezoneH + safezoneY,0.18375 * safezoneW,0.9492 * safezoneH]
		};
		
		class bg2: RscExtremoGui_DialogBG//Корзина
		{
			idc = 38426;

			x = 0.812847 * safezoneW + safezoneX;
			y = 0.571333 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.424755 * safezoneH;
			//["0.812847 * safezoneW + safezoneX","0.571333 * safezoneH + safezoneY","0.18375 * safezoneW","0.424755 * safezoneH"]
		};
		
		class bg3: RscExtremoGui_DialogBG//Шаблон
		{
			idc = 38425;

			x = 0.812847 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.35 * safezoneH;
			//["0.812847 * safezoneW + safezoneX","0.115 * safezoneH + safezoneY","0.18375 * safezoneW","0.35 * safezoneH"]
		};
		
		class MagsBg: RscExtremoGui_DialogBG//Потроны
		{
			idc = 38410;
			x = 0.18894 * safezoneW + safezoneX;
			y = 0.8416 * safezoneH + safezoneY;
			w = 0.182437 * safezoneW;
			h = 0.1568 * safezoneH;	
            //[0.18894 * safezoneW + safezoneX,0.8416 * safezoneH + safezoneY,0.182437 * safezoneW,0.1568 * safezoneH]			
		};
		
	};

	class controls {
		
		class Title : Life_V3_Title
		{
			idc = 38401;			
			text = ""; //--- ToDo: Localize;
			
			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.00440001 * safezoneH + safezoneY;
			w = 0.994876 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {TLD_COLOR_1,0.9};
			//[0.00256251 * safezoneW + safezoneX,0.00440001 * safezoneH + safezoneY,0.994876 * safezoneW,0.042 * safezoneH]
		};

		class Cash : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
			//["0.979062 * safezoneW + safezoneX","0.0128 * safezoneH + safezoneY","0.0144375 * safezoneW","0.0252 * safezoneH"]
		};
		
		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class FilterList: Life_V3_RscCombo {
			idc = 38402;
			onLBSelChanged = "_this call SunriseClient_system_weaponShopFilter";
			
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.028 * safezoneH;
			//[0.0051875 * safezoneW + safezoneX,0.0576 * safezoneH + safezoneY,0.178499 * safezoneW,0.028 * safezoneH]
		};
		
		class itemList: Life_V3_RscListBox {
			idc = 38403;
			onLBSelChanged = "_this call SunriseClient_system_weaponShopSelection";
			onMouseButtonDblClick = "_this call SunriseClient_system_weaponAddToCart;";
			
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.2564 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.7028 * safezoneH;
			//[0.0051875 * safezoneW + safezoneX,0.2555 * safezoneH + safezoneY,0.178499 * safezoneW,0.7028 * safezoneH]
		};

		class itemInfo: Life_V3_RscStructuredText {
			idc = 38404;
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.0912 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.1596 * safezoneH;	
			//[0.0051875 * safezoneW + safezoneX,0.0912 * safezoneH + safezoneY,0.178499 * safezoneW,0.1596 * safezoneH]
		};	

		class ItemButtonAddCat: RscExtremoGui_ButtonGreen {
			idc = 38405;
			//text = "$STR_Global_Buy";
			text = "Добавить в корзину";
			onButtonClick = "[] call SunriseClient_system_weaponAddToCart";
			
			x = 0.0835 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.028 * safezoneH;
			//[0.0835 * safezoneW + safezoneX,0.9648 * safezoneH + safezoneY,0.1 * safezoneW,0.028 * safezoneH]	
		};
	
		class ItemCount: RscExtremoGui_Edit {
			idc = 38406;
			text = "1";
			
			x = 0.0588542 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.021 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.0588542 * safezoneW + safezoneX","0.962 * safezoneH + safezoneY","0.021 * safezoneW","0.028 * safezoneH"]
		};

		class MagsList: Life_V3_RscListBox {
			idc = 38407;
			onLBSelChanged = "_this call SunriseClient_system_weaponShopBoxSelection";
			onMouseButtonDblClick = "_this call SunriseClient_system_weaponAddToCartMags;";
			
			x = 0.191564 * safezoneW + safezoneX;
			y = 0.8472 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.112 * safezoneH;
			//[0.191564 * safezoneW + safezoneX,0.8472 * safezoneH + safezoneY,0.177188 * safezoneW,0.112 * safezoneH]		
		};	

		class MagsCount: RscExtremoGui_Edit {
			idc = 38408;
			text = "1";
			
			x = 0.191563 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.049875 * safezoneW;
			h = 0.028 * safezoneH;	
            //[0.191563 * safezoneW + safezoneX,0.9648 * safezoneH + safezoneY,0.049875 * safezoneW,0.028 * safezoneH]					
		};

		class MagsButtonAddCat: RscExtremoGui_ButtonGreen {
			idc = 38409;
			text = "Добавить в корзину";
			onButtonClick = "[] call SunriseClient_system_weaponAddToCartMags";
			
			x = 0.244058 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.124688 * safezoneW;
			h = 0.028 * safezoneH;
			//[0.244058 * safezoneW + safezoneX,0.9648 * safezoneH + safezoneY,0.124688 * safezoneW,0.028 * safezoneH]	
		};
		
		class BasketButtonTemplates: RscExtremoGui_ButtonBlue {
			idc = -1;
			text = "Шаблоны";
			onButtonClick = "[] call SunriseClient_system_weaponInitTemplates";
			tooltip = "Открывает/закрывает меню шаблонов, в котором можно сохранить текущее состояние корзины или загрузить прошлое.";

			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.0051875 * safezoneW + safezoneX","0.962 * safezoneH + safezoneY","0.05 * safezoneW","0.028 * safezoneH"]
		};
		
		//---Корзина
		class BasketTitle : Life_V3_Title
		{
			idc = 38411;			
			text = "Корзина"; //--- ToDo: Localize;
			colorBackground[] = {TLD_COLOR_1,0.9};
			
			x = 0.812847 * safezoneW + safezoneX;
			y = 0.545 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.0264445 * safezoneH;
			//["0.812847 * safezoneW + safezoneX","0.545 * safezoneH + safezoneY","0.18375 * safezoneW","0.0264445 * safezoneH"]
		};
		
		class Total : BasketTitle {
			idc = 602;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};
 
		class BasketList: Life_V3_RscListBox {
			idc = 38412;
			onLBSelChanged = "_this call SunriseClient_system_weaponShopBoxSelection";
			onMouseButtonDblClick = "_this call SunriseClient_system_weaponRemoveToCart;";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.576 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.352 * safezoneH;
			//["0.815104 * safezoneW + safezoneX","0.576 * safezoneH + safezoneY","0.177604 * safezoneW","0.352 * safezoneH"]
		};

		class BasketButtonBuy: RscExtremoGui_ButtonGreen {
			idc = 38413;
			//text = "$STR_Global_Buy";
			text = "Купить содержимое корзины";
			onButtonClick = "[] call SunriseClient_system_weaponShopBuySell";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.9325 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.815104 * safezoneW + safezoneX","0.9325 * safezoneH + safezoneY","0.177604 * safezoneW","0.028 * safezoneH"]
		};
		
		class BasketCount: RscExtremoGui_Edit {
			idc = 38414;
			text = "1";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.042 * safezoneW;
			h = 0.028 * safezoneH;	
            //["0.815104 * safezoneW + safezoneX","0.9648 * safezoneH + safezoneY","0.042 * safezoneW","0.028 * safezoneH"]			
		};
		
		class BasketButtonDelete: RscExtremoGui_ButtonRed {
			idc = 38415;
			text = "Удалить из корзины";
			onButtonClick = "[] call SunriseClient_system_weaponRemoveToCart";
			
			x = 0.86 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.133 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.86 * safezoneW + safezoneX","0.9648 * safezoneH + safezoneY","0.133 * safezoneW","0.028 * safezoneH"]
		};
		
		
		//----------Шаблоны
		class TemplatesTitle : Life_V3_Title
		{
			idc = 38417;			
			text = "Шаблоны"; //--- ToDo: Localize;
			colorBackground[] = {TLD_COLOR_1,0.9};
			
			x = 0.812847 * safezoneW + safezoneX;
			y = 0.088 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.0264445 * safezoneH;
			//["0.812847 * safezoneW + safezoneX","0.088 * safezoneH + safezoneY","0.18375 * safezoneW","0.0264445 * safezoneH"]
		};
		
		class TemplatesList: Life_V3_RscListBox {
			idc = 38418;
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.28 * safezoneH;
			//["0.815104 * safezoneW + safezoneX","0.12 * safezoneH + safezoneY","0.177604 * safezoneW","0.28 * safezoneH"]
		};
		
		class TemplatesEditName : RscExtremoGui_Edit {
			idc = 38419;
			text = "Название шаблона";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.406 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.022 * safezoneH;	
            //["0.815104 * safezoneW + safezoneX","0.406 * safezoneH + safezoneY","0.177604 * safezoneW","0.022 * safezoneH"]				
		};
		
		class TemplatesButtonSave: RscExtremoGui_ButtonYellow {
			idc = 38420;
			text = "Сохранить";
			tooltip = "Сохраняет текущий список покупок";
			onButtonClick = "[] call SunriseClient_system_weaponSaveTemplates";
			
			x = 0.878125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0595833 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.878125 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.0595833 * safezoneW","0.028 * safezoneH"]
		};

		class TemplatesButtonLoad: RscExtremoGui_ButtonGreen {
			idc = 38421;
			text = "Загрузить";
			onButtonClick = "[] call SunriseClient_system_weaponLoadTemplates";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0595833 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.815104 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.0595833 * safezoneW","0.028 * safezoneH"]
		};
		
		class TemplatesButtonDelete: RscExtremoGui_ButtonRed {
			idc = 38422;
			text = "Удалить";
			onButtonClick = "[] call SunriseClient_system_weaponDelTemplates";
			
			colorBackground[] = {TLD_COLOR_BUTTON_RED,1};
			x = 0.941146 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0527083 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.941146 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.0527083 * safezoneW","0.028 * safezoneH"]
		};

		class TemplatesCloseImage : RscPicture {
			idc = 38423;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.979166 * safezoneW + safezoneX;
			y = 0.0885556 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
			//["0.979166 * safezoneW + safezoneX","0.0885556 * safezoneH + safezoneY","0.0144375 * safezoneW","0.0252 * safezoneH"]
		};
		
		class TemplatesCloseButton: RscPictureButtonMenu {
			idc = 38424;
			text = "";	
			onButtonClick = "[] call SunriseClient_system_weaponInitTemplates";
			tooltip = "Закрыть меню шаблонов";
			
			colorBackground[] = {1,1,1,0};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.979166 * safezoneW + safezoneX;
			y = 0.0885556 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
	};
};