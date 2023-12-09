class SunriseDialogGov {
	idd = 3200;
	name= "SunriseDialogGov";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;";
	
	class controlsBackground {
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
			y = 0.007;
			w = 0.688;
			h = 0.07;
		};
		
		class Title : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "ПРИЛОЖЕНИЯ";
			
			x = -0.275;
			y = 0.007;
			w = 0.26;
			h = 0.07;
		};
		class Title2 : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "ПРАВИТЕЛЬСТВО";
			
			x = 0.7;
			y = 0.007;
			w = 0.3;
			h = 0.07;
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
			h = 0.07;
		};
		class Button_4: RscPictureButtonMenu {
			idc = 2019;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.16;
			w = 0.21;
			h = 0.07;
		};
		class Button_5: RscPictureButtonMenu {
			idc = 2021;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.23;
			w = 0.21;
			h = 0.07;
		};
		class Button_6: RscPictureButtonMenu {
			idc = 2023;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.3;
			w = 0.21;
			h = 0.07;
		};
		class Button_7: RscPictureButtonMenu {
			idc = 2025;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.37;
			w = 0.21;
			h = 0.07;
		};
		class Button_8: RscPictureButtonMenu {
			idc = 2027;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.44;
			w = 0.21;
			h = 0.07;
		};
		class Button_9: RscPictureButtonMenu {
			idc = 2029;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.51;
			w = 0.21;
			h = 0.07;
		};
		class Button_10: RscPictureButtonMenu {
			idc = 2031;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.58;
			w = 0.21;
			h = 0.07;
		};
		class Button_11: RscPictureButtonMenu {
			idc = 2033;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.65;
			w = 0.21;
			h = 0.07;
		};
		class Button_12: RscPictureButtonMenu {
			idc = 2035;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.72;
			w = 0.21;
			h = 0.07;
		};
		class Button_13: RscPictureButtonMenu {
			idc = 2037;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.79;
			w = 0.21;
			h = 0.07;
		};
		class Button_14: RscPictureButtonMenu {
			idc = 2039;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.86;
			w = 0.21;
			h = 0.07;
		};
		class Button_15: RscPictureButtonMenu {
			idc = 2041;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 0.93;
			w = 0.21;
			h = 0.07;
		};
		class Button_16: RscPictureButtonMenu {
			idc = 2043;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 1;
			w = 0.21;
			h = 0.07;
		};
		class Button_17: RscPictureButtonMenu {
			idc = 2045;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = -0.25;
			y = 1.07;
			w = 0.21;
			h = 0.07;
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
	};
	
	class controls {

		class Title : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "Правительство Алтиса";
			
			x = 0.0375;
			y = 0.1;
			w = 0.3;
			h = 0.04;
		};

		class PricesTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "Цены";
			
			x = 0.375;
			y = 0.1;
			w = 0.5875;
			h = 0.04;
		};
		
		class BankBalance : RscStructuredText
		{
			idc = 3202;			
			text = "";
			sizeEx = 0.020;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.0375;
			y = 0.16;
			w = 0.3025;
			h = 0.536;
		};

		class PricesList : RscListBox
		{
			idc = 3205;		
			
			x = 0.375;
			y = 0.16;
			w = 0.5875;
			h = 0.68;
		};
				
		class WantedButton : RscExtremoGui_ButtonRed {
			idc = -1;
			text = "Розыск";
			onButtonClick = "if (time - life_check_timer < 10) exitWith {['Подождите и повторите через пару секунд','error'] call SunriseClient_gui_BottomNotification};[[player],""wantedCheck""] call SunriseClient_system_hcExec; ['Запрос отправлен...','info'] call SunriseClient_gui_BottomNotification;life_check_timer = time";
			
			x = 0.0374988;
			y = 0.8;
			w = 0.2375;
			h = 0.05;
		};
		
		class BankButton : RscExtremoGui_ButtonBlue {
			idc = 3203;
			text = "Казна";
			onButtonClick = "[] call SunriseClient_system_openGovBankMenu";
			
			x = 0.0375;
			y = 0.74;
			w = 0.2375;
			h = 0.05;
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