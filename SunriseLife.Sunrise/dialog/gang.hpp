class SunriseDialogMyGang {
	idd = 2620;
	name= "SunriseDialogMyGang";
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
			text = "ГРУППИРОВКА";
			
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
			idc = 2629;
			text = "";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};
		
		class GangMemberList : RscListBox 
		{
			idc = 2621;
			text = "";
			
			x = 0.0374988;
			y = 0.16;
			w = 0.65;
			h = 0.68;
		};

		
		class GangLeave : RscExtremoGui_ButtonRed {
			idc = 2636;
			text = "$STR_Gang_Leave";
			onButtonClick = "[] spawn SunriseClient_gangs_Leave";
			
			x = 0.699998;
			y = 0.16;
			w = 0.2625;
			h = 0.05;
		};
		
		class DisbandGang : RscExtremoGui_ButtonRed
		{
			idc = 2631;
			text = "$STR_Gang_Disband_Gang";
			onButtonClick = "[] spawn SunriseClient_gangs_Disband";			
			
			x = 0.699998;
			y = 0.16;
			w = 0.2625;
			h = 0.05;
		};
		
		class GangLock : RscExtremoGui_ButtonGreen 
		{
			idc = 2622;
			text = "$STR_Gang_UpgradeSlots";
			onButtonClick = "[] spawn SunriseClient_gangs_Upgrade";
			
			x = 0.700001;
			y = 0.218;
			w = 0.2625;
			h = 0.05;
		};
		
		
		class GangLeader : RscExtremoGui_ButtonGreen 
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			onButtonClick = "[] spawn SunriseClient_gangs_NewLeader";
			
			x = 0.700001;
			y = 0.276;
			w = 0.2625;
			h = 0.05;
		};
		
		class GangDeputy : RscExtremoGui_ButtonGreen 
		{
			idc = 2637;
			text = "$STR_Gang_SetDeputy";
			onButtonClick = "[] spawn SunriseClient_gangs_NewDeputy";
			
			x = 0.700001;
			y = 0.334;
			w = 0.2625;
			h = 0.05;
		};
				
		class GangKick : RscExtremoGui_ButtonRed 
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			onButtonClick = "[] spawn SunriseClient_gangs_Kick";
			
			x = 0.700001;
			y = 0.392;
			w = 0.2625;
			h = 0.05;
		};
		
		
		class MoneyEdit : RscEdit 
		{
			idc = 2633;			
			text = "10000";
			colorBackground[] = {0,0,0,0.5};			
			
			x = 0.700001;
			y = 0.45;
			w = 0.125;
			h = 0.05;
		};
		
		class TakeMoney : RscExtremoGui_ButtonRed 
		{
			idc = 2626;
			text = "Снять";
			onButtonClick = "[] call SunriseClient_gangs_Withdraw";
			
			x = 0.8375;
			y = 0.45;
			w = 0.125;
			h = 0.05;
		};
		
		class LvlDOWN : RscExtremoGui_ButtonRed 
		{
			idc = 2628;
			text = "Урв -";
			onButtonClick = "[0] spawn SunriseClient_gangs_Lvl";
			
			x = 0.700001;
			y = 0.506;
			w = 0.125;
			h = 0.05;
		};
		
		class LvlUP : RscExtremoGui_ButtonGreen 
		{
			idc = 2627;
			text = "Урв +";
			onButtonClick = "[1] spawn SunriseClient_gangs_Lvl";
			
			x = 0.8375;
			y = 0.506;
			w = 0.125;
			h = 0.05;
		};
		
		class GangLicense : RscExtremoGui_ButtonGreen 
		{
			idc = 2635;
			text = "Лицензия";
			onButtonClick = "";
			
			x = 0.700001;
			y = 0.564;
			w = 0.2625;
			h = 0.05;
		};
		
		class OfflineList : RscExtremoGui_ButtonGreen 
		{
			idc = 2638;
			text = "Оффлайн";
			onButtonClick = "[] spawn SunriseClient_gangs_Offline";
			
			x = 0.700001;
			y = 0.622;
			w = 0.2625;
			h = 0.05;
		};
		
		class GangInfo : RscExtremoGui_ButtonBlue
		{
			idc = -1;
			text = "Частоты";
			onButtonClick = "[] call SunriseClient_gangs_Info";
			
			x = 0.7;
			y = 0.678;
			w = 0.2;
			h = 0.05;
		};
		
		class GangInfoAdd : RscExtremoGui_ButtonGreen 
		{
			idc = 2639;
			text = "+";
			onButtonClick = "[] spawn SunriseClient_gangs_OpenInfoMenu";
			
			x = 0.9125;
			y = 0.678;
			w = 0.05;
			h = 0.05;
		};
		
		
		class InviteMember : RscExtremoGui_ButtonGreen
		{
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			onButtonClick = "[] spawn SunriseClient_gangs_InvitePlayer";
			

			x = 0.700001;
			y = 0.736;
			w = 0.2625;
			h = 0.05;
		};
		
		class PlayersInviteList : RscCombo
		{
			idc = 2632;
			
			x = 0.700001;
			y = 0.794;
			w = 0.2625;
			h = 0.05;
		};
		
		
		
		class GangBank : Title {
			idc = 601;
			style = 1;
			text = "";
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

class SunriseDialogMyGangCreate {
	idd = 2520;
	name= "SunriseDialogMyGangCreate";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;";
	
	class controlsBackground {		
		class MainBackground:RscExtremoGui_DialogBG {			
			idc = -1;
			x = 0.368722 * safezoneW + safezoneX;
			y = 0.37394 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.1454 * safezoneH;
		};
	};

	class controls {
		class Title : RscExtremoGui_HeaderBG {
			idc = -1;
			text = "Создание группировки";
			
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.606313 * safezoneW + safezoneX;
			y = 0.3404 * safezoneH + safezoneY;
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
					
			x = 0.606313 * safezoneW + safezoneX;
			y = 0.3404 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class BackImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_back.paa";
			
			x = 0.589433 * safezoneW + safezoneX;
			y = 0.3404 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class BackButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; [] spawn SunriseClient_pad_openMain";
			tooltip = "$STR_PM_BackToMainMenu";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.589433 * safezoneW + safezoneX;
			y = 0.3404 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class infoText: Life_V3_RscStructuredText
		{
			idc = 2523;			
			x = 0.374 * safezoneW + safezoneX;
			y = 0.3824 * safezoneH + safezoneY;
			w = 0.24675 * safezoneW;
			h = 0.0596 * safezoneH;
		};

		class name_e: RscExtremoGui_Edit
		{
			idc = 2522;
			text = "Название вашей группировки";
			x = 0.374 * safezoneW + safezoneX;
			y = 0.4504 * safezoneH + safezoneY;
			w = 0.24675 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class regButton: RscExtremoGui_ButtonDark
		{
			idc = -1;
			text = "Создать";
			onButtonClick = "[] call SunriseClient_gangs_Create";			
			x = 0.496063 * safezoneW + safezoneX;
			y = 0.4868 * safezoneH + safezoneY;
			w = 0.124687 * safezoneW;
			h = 0.028 * safezoneH;

		};		
	};
};

class SunriseDialogMyGangAddInfo {
	idd = 4200;
	name= "SunriseDialogMyGangAddInfo";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class MainBackground: RscExtremoGui_DialogBG {
			idc = -1;
			x = 0.18175;
			y = 0.2708;
			w = 0.620453;
			h = 0.37;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BG_R',1])","(profilenamespace getvariable ['GUI_V3_BG_G',1])","(profilenamespace getvariable ['GUI_V3_BG_B',1])","(profilenamespace getvariable ['GUI_V3_BG_A',0.8])"};
		};
	};
	
	class controls {
		
		class Title: RscExtremoGui_HeaderBG {
			idc = -1;
			text = "Укажите частоты рации"; //--- ToDo: Localize;
			
			x = 0.18175;
			y = 0.1944;
			w = 0.620453;
			h = 0.0763636;
			colorText[] = {0.95,0.95,0.95,1};
		};

		class CloseImage: Life_V3_CloseButton
		{
			x = 0.75775;
			y = 0.21;
			w = 0.035;
			h = 0.045818;
		};

		class MWText: Life_V3_RscText {
			idc = -1;
		
			text = "Средние волны:"; //--- ToDo: Localize;
			x = 0.2;
			y = 0.32;
			w = 0.1625;
			h = 0.04;
		};

		class MWtextEdit: RscExtremoGui_Edit {
			idc = 4202;
			text = ""; //--- ToDo: Localize;
			maxChars = 14;
			
			x = 0.365;
			y = 0.392;
			w = 0.275;
			h = 0.06;
		};

		class LWText: Life_V3_RscText {
			idc = -1;
		
			text = "Длинные волны:"; //--- ToDo: Localize;
			x = 0.2;
			y = 0.4;
			w = 0.1625;
			h = 0.04;
		};

		class LWtextEdit : RscExtremoGui_Edit
		{
			idc = 4201;
			text = "";
			maxChars = 14;

			x = 0.365;
			y = 0.312;
			w = 0.275;
			h = 0.06;
		};

		class InfoText: Life_V3_RscText {
			idc = -1;
		
			text = "Информация:"; //--- ToDo: Localize;
			x = 0.2;
			y = 0.48;
			w = 0.1625;
			h = 0.04;
		};

		class InfotextEdit : RscExtremoGui_Edit
		{
			idc = 4203;
			text = "";
			maxChars = 140;

			x = 0.365;
			y = 0.472;
			w = 0.275;
			h = 0.06;
		};
		
		class AddinfoButton : RscExtremoGui_ButtonDark {
			idc = -1;
			text = "Установить";
			onButtonClick = "[] call SunriseClient_gangs_InfoAdd";
			x = 0.4875;
			y = 0.56;
			w = 0.302273;
			h = 0.06;
		};
	};
};