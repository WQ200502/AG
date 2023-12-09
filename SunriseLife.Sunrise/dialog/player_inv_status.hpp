class SunriseDialogPadStatus {
	idd = 7200;
	name= "SunriseDialogPadStatus";
	movingEnable = 1;
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
			text = "МЕНЮ ИГРОКА";
			
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
		class finance_title: RscText
		{
			idc = 7202;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_PM_MoneyStats";
			sizeEx = 0.03;

			x = 0.0375;
			y = 0.096;
			w = 0.3;
			h = 0.04;			
		};
		class money_status: RscStructuredText
		{
			idc = 7203;
			
			x = 0.0375;
			y = 0.152;
			w = 0.3;
			h = 0.18;
		};
		class money_edit: RscEdit
		{
			idc = 7204;
			text = "1";

			x = 0.0375;
			y = 0.338;
			w = 0.1125;
			h = 0.05;
		};
		class money_players_combo: RscCombo
		{
			idc = 7205;

			x = 0.1625;
			y = 0.338;
			w = 0.175;
			h = 0.05;
		};
		class give_money_button: RscExtremoGui_ButtonGreen
		{
			idc = 7206;
			text = "$STR_PM_SendMoney";	
			onButtonClick = "[] call SunriseClient_system_giveMoney";

			x = 0.0375;
			y = 0.4;
			w = 0.3;
			h = 0.052;
		};



		class licenses_title: RscText
		{
			idc = 7207;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_PM_Licenses";
			sizeEx = 0.03;

			x = 0.0375;
			y = 0.468;
			w = 0.3;
			h = 0.04;			
		};
		class licenses_list: RscListbox
		{
			idc = 7208;

			x = 0.0375;
			y = 0.524;
			w = 0.3;
			h = 0.27;				
		};


		class notifications_title: RscText
		{
			idc = 7209;
			colorBackground[] = {1,1,1,0.1};
			text = "История оповещений";
			sizeEx = 0.03;

			x = 0.3475;
			y = 0.096;
			w = 0.62;
			h = 0.04;			
		};
		
		class notifications_list: RscListbox
		{
			idc = 7211;
			onLBSelChanged="hint (_this#0 lbText _this#1)";

			x = 0.3475;
			y = 0.152;
			w = 0.62;
			h = 0.305;
		};	
		
		class keys_title: RscText
		{
			idc = 7212;
			colorBackground[] = {1,1,1,0.1};
			text = "Ключи";
			sizeEx = 0.03;

			x = 0.3475;
			y = 0.468;
			w = 0.62;
			h = 0.04;			
		};
		
		class KeyChainList : RscListBox 
		{
			idc = 7213;
			text = "";
			
			x = 0.3475;
			y = 0.524;
			w = 0.62;
			h = 0.27;			
		};		
		
		class NearPlayers : RscCombo {
		
			idc = 7214;
		
			x = 0.3475;
			y = 0.804;
			w = 0.2;
			h = 0.05;
		
		};
		
		class DropKey : RscExtremoGui_ButtonRed {
			idc = -1;			
			text = "$STR_Keys_DropKey";
			onButtonClick = "[] call SunriseClient_system_keyDrop";
			
			x = 0.7675;
			y = 0.804;
			w = 0.2;
			h = 0.05;
		};
		
		class GiveKey : RscExtremoGui_ButtonGreen {
			idc = 7215;			
			text = "$STR_Keys_GiveKey";			
			onButtonClick = "[] call SunriseClient_system_keyGive";
			
			x = 0.5575;
			y = 0.804;
			w = 0.2;
			h = 0.05;
		};
		
		class ExitWork : RscExtremoGui_ButtonRed {
		
			idc = 7216;
			text = "Завершить работу";			
			onButtonClick = "[] call SunriseClient_jobs_endJob";
			
			x = 0.0374988;
			y = 0.804;
			w = 0.3;
			h = 0.05;
		
		};
		
		class donate_status_text: RscStructuredText
		{
			idc = 7218;
			text = "";

			x = 0.7175;
			y = 0.85;
			w = 0.25;
			h = 0.036;			
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