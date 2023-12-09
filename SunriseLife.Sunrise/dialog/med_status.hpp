class SunriseDialogMedStatus
{
	idd = 39001;
	name = "SunriseDialogMedStatus";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;";
		
	class controlsBackground
	{
		class padImage : RscExtremoGui_DialogBG {
			idc = 2001;
			text = "";

			x = 0;
			y = 0.084;
			w = 1;
			h = 0.82;
		};
		class bgButton1 : RscExtremoGui_DialogBG {			
			idc = -1;
			text = "";

			x = -0.275;
			y = 0.084;
			w = 0.26;
			h = 0.82;
		};
		class bgButton2 : RscExtremoGui_DialogBG {			
			idc = -1;
			text = "";

			x = 0;
			y = 0;
			w = 0.67;
			h = 0.08;
		};
		
		class Title : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "Приложения";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = -0.275;
			y = 0;
			w = 0.26;
			h = 0.08;
		};
		class Title2 : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "Меню EMS";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.68;
			y = 0;
			w = 0.32;
			h = 0.08;
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
		
		
		class Button_0: RscPictureButtonMenu {
			idc = 2011;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.01;
			y = 0.012;
			w = 0.21;
			h = 0.06;
		};
		class Button_1: RscPictureButtonMenu {
			idc = 2013;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.23;
			y = 0.012;
			w = 0.21;
			h = 0.06;
		};
		class Button_2: RscPictureButtonMenu {
			idc = 2015;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.45;
			y = 0.012;
			w = 0.21;
			h = 0.06;
		};
		class Button_3: RscPictureButtonMenu {
			idc = 2017;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.09;
			w = 0.21;
			h = 0.06;
		};
		class Button_4: RscPictureButtonMenu {
			idc = 2019;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.16;
			w = 0.21;
			h = 0.06;
		};
		class Button_5: RscPictureButtonMenu {
			idc = 2021;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.23;
			w = 0.21;
			h = 0.06;
		};
		class Button_6: RscPictureButtonMenu {
			idc = 2023;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.3;
			w = 0.21;
			h = 0.06;
		};
		class Button_7: RscPictureButtonMenu {
			idc = 2025;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.37;
			w = 0.21;
			h = 0.06;
		};
		class Button_8: RscPictureButtonMenu {
			idc = 2027;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.44;
			w = 0.21;
			h = 0.06;
		};
		class Button_9: RscPictureButtonMenu {
			idc = 2029;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.51;
			w = 0.21;
			h = 0.06;
		};
		class Button_10: RscPictureButtonMenu {
			idc = 2031;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.58;
			w = 0.21;
			h = 0.06;
		};
		class Button_11: RscPictureButtonMenu {
			idc = 2033;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.65;
			w = 0.21;
			h = 0.06;
		};
		class Button_12: RscPictureButtonMenu {
			idc = 2035;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.72;
			w = 0.21;
			h = 0.06;
		};
		class Button_13: RscPictureButtonMenu {
			idc = 2037;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.79;
			w = 0.21;
			h = 0.06;
		};
		class Button_14: RscPictureButtonMenu {
			idc = 2039;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.86;
			w = 0.21;
			h = 0.06;
		};
		class Button_15: RscPictureButtonMenu {
			idc = 2041;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.93;
			w = 0.21;
			h = 0.06;
		};
		class Button_16: RscPictureButtonMenu {
			idc = 2043;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 1;
			w = 0.21;
			h = 0.06;
		};
		class Button_17: RscPictureButtonMenu {
			idc = 2045;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 1.07;
			w = 0.21;
			h = 0.06;
		};
	};
	
	class Controls
	{
		class RscTitleText : RscTitle
		{
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "Меню медика";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};
		
		
		class PlayersList : RscListBox
		{
			idc = 39002;
			text = "";
			
			onLBSelChanged = "[] call SunriseClient_system_medicInfo";
			x = 0.0374988;
			y = 0.16;
			w = 0.449999;
			h = 0.68;
		};
			
		
		class ButtonAccept : RscButtonUC 
		{
			idc = 39003;			
			text = "Принять вызов";
			onButtonClick = "[2] call SunriseClient_system_medicSend;";
			colorBackground[] = {0.102,0.643,0.278,1};		
			
			x = 0.5;
			y = 0.16;
			w = 0.462501;
			h = 0.06;
		};
		
		class ButtonDenied : RscButtonUC 
		{
			idc = 39004;			
			text = "Отказать";
			onButtonClick = "[1] call SunriseClient_system_medicSend;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			
			x = 0.5;
			y = 0.308;
			w = 0.225;
			h = 0.06;
		};
		
		class ButtonFight : RscButtonUC 
		{
			idc = 39005;			
			text = "Ждите. Идет бой";
			onButtonClick = "[3] call SunriseClient_system_medicSend;";
			colorBackground[] = {0.773,0.522,0.031,1};	
			
			x = 0.5;
			y = 0.244;
			w = 0.225;
			h = 0.06;
		};
		
		class ButtonVoenPol : RscButtonUC 
		{
			idc = 39006;			
			text = "Военное положение";
			onButtonClick = "[4] call SunriseClient_system_medicSend;";
			colorBackground[] = {0.773,0.522,0.031,1};
			
			x = 0.737499;
			y = 0.244;
			w = 0.225;
			h = 0.06;
		};
		
		
		class ButtonRedZone : RscButtonUC 
		{
			idc = 39007;			
			text = "Красная зона";
			onButtonClick = "[5] call SunriseClient_system_medicSend;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};	
			
			x = 0.5;
			y = 0.372;
			w = 0.225;
			h = 0.06;
		};
		
		class ButtonBlack : RscButtonUC 
		{
			idc = 39008;			
			text = "Черный список";
			onButtonClick = "[6] call SunriseClient_system_medicSend;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			
			x = 0.737499;
			y = 0.372;
			w = 0.225;
			h = 0.06;
		};
		
		class ButtonWanted : RscButtonUC 
		{
			idc = 39009;			
			text = "Розыск";
			onButtonClick = "[7] call SunriseClient_system_medicSend;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			
			x = 0.737499;
			y = 0.308;
			w = 0.225;
			h = 0.06;
		};

		class WantedInfo: RscStructuredText
		{
			idc = 39011;
			sizeEx = 0.03;
			text = "";
			x = 0.5;
			y = 0.46;
			w = 0.4625;
			h = 0.38;
		};
		
		
		//иконки кнопок
		class ButtonPicture_0 : RscPicture {
			idc = 2010;
			text = "";

			x = 0.01;
			y = 0.012;
			w = 0.21;
			h = 0.06;
		};

		class ButtonPicture_1 : RscPicture {
			idc = 2012;
			text = "";

			x = 0.23;
			y = 0.012;
			w = 0.21;
			h = 0.06;
		};

		class ButtonPicture_2 : RscPicture {
			idc = 2014;
			text = "";

			x = 0.45;
			y = 0.012;
			w = 0.21;
			h = 0.06;
		};

		class ButtonPicture_3 : RscPicture {
			idc = 2016;
			text = "";

			x = -0.25;
			y = 0.09;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_4 : RscPicture {
			idc = 2018;
			text = "";

			x = -0.25;
			y = 0.16;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_5 : RscPicture {
			idc = 2020;
			text = "";

			x = -0.25;
			y = 0.23;
			w = 0.21;
			h = 0.07;
		};

		//второй ряд
		class ButtonPicture_6 : RscPicture {
			idc = 2022;
			text = "";

			x = -0.25;
			y = 0.3;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_7 : RscPicture {
			idc = 2024;
			text = "";

			x = -0.25;
			y = 0.37;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_8 : RscPicture {
			idc = 2026;
			text = "";

			x = -0.25;
			y = 0.44;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_9 : RscPicture {
			idc = 2028;
			text = "";

			x = -0.25;
			y = 0.51;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_10 : RscPicture {
			idc = 2030;
			text = "";

			x = -0.25;
			y = 0.58;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_11 : RscPicture {
			idc = 2032;
			text = "";

			x = -0.25;
			y = 0.65;
			w = 0.21;
			h = 0.07;
		};

		//третий ряд
		class ButtonPicture_12 : RscPicture {
			idc = 2034;
			text = "";

			x = -0.25;
			y = 0.72;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_13 : RscPicture {
			idc = 2036;
			text = "";

			x = -0.25;
			y = 0.79;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_14 : RscPicture {
			idc = 2038;
			text = "";

			x = -0.25;
			y = 0.86;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_15 : RscPicture {
			idc = 2040;
			text = "";

			x = -0.25;
			y = 0.93;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_16 : RscPicture {
			idc = 2042;
			text = "";

			x = -0.25;
			y = 1;
			w = 0.21;
			h = 0.07;
		};

		class ButtonPicture_17 : RscPicture {
			idc = 2044;
			text = "";

			x = -0.25;
			y = 1.07;
			w = 0.21;
			h = 0.07;
		};
	};
};