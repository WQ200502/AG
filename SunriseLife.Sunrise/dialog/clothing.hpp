class SunriseDialogClothingShop {
	idd = 3100;
	name= "SunriseDialogClothingShop";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['SunriseDialogClothingShop',_this select 0]";
	onUnload = "uiNamespace setVariable ['SunriseDialogClothingShop', objNull]";
	
	class controlsBackground {
		class bg: RscExtremoGui_DialogBG
		{
			idc = 3122;

			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.048 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.949 * safezoneH;
			//["0.0025625 * safezoneW + safezoneX","0.048 * safezoneH + safezoneY","0.18375 * safezoneW","0.949 * safezoneH"]
		};

		class bg2: RscExtremoGui_DialogBG//Корзина
		{
			idc = 3123;

			x = 0.812847 * safezoneW + safezoneX;
			y = 0.571333 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.424755 * safezoneH;
			//["0.812847 * safezoneW + safezoneX","0.571333 * safezoneH + safezoneY","0.18375 * safezoneW","0.424755 * safezoneH"]
		};
		
		class bg3: RscExtremoGui_DialogBG//Шаблон
		{
			idc = 3121;

			x = 0.812847 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.35 * safezoneH;
			//["0.812847 * safezoneW + safezoneX","0.115 * safezoneH + safezoneY","0.18375 * safezoneW","0.35 * safezoneH"]
		};
	};
	
	class controls 
	{
		class Title : Life_V3_Title 
		{
			idc = 3103;
			text = ""; //--- ToDo: Localize;
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.00440001 * safezoneH + safezoneY;
			w = 0.994876 * safezoneW;
			h = 0.042 * safezoneH;
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

		
		class ClothingList : Life_V3_RscListBox 
		{
			idc = 3101;
			text = "";
			onLBSelChanged = "[_this] call SunriseClient_system_changeClothes";
			
			x = 0.006499 * safezoneW + safezoneX;
			y = 0.0912 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.8092 * safezoneH;
		};
		
		class PriceTag : Life_V3_RscStructuredText
		{
			idc = 3102;
			text = "";		
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.906 * safezoneH + safezoneY;
			w = 0.175875 * safezoneW;
			h = 0.042 * safezoneH;
		};		
				
		class FilterList : Life_V3_RscCombo
		{
			idc = 3105;			
			onLBSelChanged  = "_this call SunriseClient_system_clothingFilter";
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.028 * safezoneH;
		};		

		class ButtonAddToCat : RscExtremoGui_ButtonGreen 
		{
			idc = 3106;
			text = "Добавить в корзину"; //Локализировать
			onButtonClick = "[] call SunriseClient_system_clothingAddToCart";
			x = 0.064 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.064 * safezoneW + safezoneX","0.9648 * safezoneH + safezoneY","0.12 * safezoneW","0.028 * safezoneH"]
		};
		
		class ButtonTemplates: RscExtremoGui_ButtonBlue {
			idc = -1;
			text = "Шаблоны";
			onButtonClick = "[] call SunriseClient_system_clothingInitTemplates";
			
			x = 0.00550001 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.055 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.00550001 * safezoneW + safezoneX","0.9648 * safezoneH + safezoneY","0.055 * safezoneW","0.028 * safezoneH"]
		};
		
		//---Корзина
		class BasketTitle : Life_V3_Title
		{
			idc = 3107;			
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
			idc = 3108;
			onMouseButtonDblClick = "_this call SunriseClient_system_clothingRemoveToCart;";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.576 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.352 * safezoneH;
			//["0.815104 * safezoneW + safezoneX","0.576 * safezoneH + safezoneY","0.177604 * safezoneW","0.352 * safezoneH"]
		};

		class BasketButtonBuy: RscExtremoGui_ButtonGreen {
			idc = 3109;
			//text = "$STR_Global_Buy";
			text = "Купить содержимое корзины";
			onButtonClick = "[] call SunriseClient_system_buyClothes";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.9325 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.815104 * safezoneW + safezoneX","0.9325 * safezoneH + safezoneY","0.177604 * safezoneW","0.028 * safezoneH"]
		};
		
		class BasketCount: RscExtremoGui_Edit {
			idc = 3110;
			text = "1";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.042 * safezoneW;
			h = 0.028 * safezoneH;	
            //["0.815104 * safezoneW + safezoneX","0.9648 * safezoneH + safezoneY","0.042 * safezoneW","0.028 * safezoneH"]			
		};
		
		class BasketButtonDelete: RscExtremoGui_ButtonRed {
			idc = 3111;
			text = "Удалить из корзины";
			onButtonClick = "[] call SunriseClient_system_clothingRemoveToCart";
			
			x = 0.86 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.133 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.86 * safezoneW + safezoneX","0.9648 * safezoneH + safezoneY","0.133 * safezoneW","0.028 * safezoneH"]
		};
		
		//----------Шаблоны
		class TemplatesTitle : RscExtremoGui_HeaderBG
		{
			idc = 3113;			
			text = "Шаблоны"; //--- ToDo: Localize;
			moving = 0;
			
			x = 0.812847 * safezoneW + safezoneX;
			y = 0.088 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.0264445 * safezoneH;
			//["0.812847 * safezoneW + safezoneX","0.088 * safezoneH + safezoneY","0.18375 * safezoneW","0.0264445 * safezoneH"]
		};
		
		class TemplatesList: Life_V3_RscListBox {
			idc = 3114;
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.28 * safezoneH;
			//["0.815104 * safezoneW + safezoneX","0.12 * safezoneH + safezoneY","0.177604 * safezoneW","0.28 * safezoneH"]
		};
		
		class TemplatesEditName : RscExtremoGui_Edit {
			idc = 3115;
			text = "Название шаблона";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.406 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.022 * safezoneH;	
            //["0.815104 * safezoneW + safezoneX","0.406 * safezoneH + safezoneY","0.177604 * safezoneW","0.022 * safezoneH"]				
		};
		
		class TemplatesButtonSave: RscExtremoGui_ButtonYellow {
			idc = 3116;
			text = "Сохранить";
			tooltip = "Сохраняет текущий список покупок";
			onButtonClick = "[] call SunriseClient_system_clothingSaveTemplates";
			
			x = 0.878125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0595833 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.878125 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.0595833 * safezoneW","0.028 * safezoneH"]
		};

		class TemplatesButtonLoad: RscExtremoGui_ButtonGreen {
			idc = 3117;
			text = "Загрузить";
			onButtonClick = "[] call SunriseClient_system_clothingLoadTemplates";
			
			x = 0.815104 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0595833 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.815104 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.0595833 * safezoneW","0.028 * safezoneH"]
		};
		
		class TemplatesButtonDelete: RscExtremoGui_ButtonRed {
			idc = 3118;
			text = "Удалить";
			onButtonClick = "[] call SunriseClient_system_clothingDelTemplates";
			
			x = 0.941146 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0527083 * safezoneW;
			h = 0.028 * safezoneH;
			//["0.941146 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.0527083 * safezoneW","0.028 * safezoneH"]
		};

		class TemplatesCloseImage : RscPicture {
			idc = 3119;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.979166 * safezoneW + safezoneX;
			y = 0.0885556 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
			//["0.979166 * safezoneW + safezoneX","0.0885556 * safezoneH + safezoneY","0.0144375 * safezoneW","0.0252 * safezoneH"]
		};
		
		class TemplatesCloseButton: RscPictureButtonMenu {
			idc = 3120;
			text = "";	
			onButtonClick = "[] call SunriseClient_system_clothingInitTemplates";
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