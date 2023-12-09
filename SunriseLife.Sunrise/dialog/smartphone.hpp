class SunriseDialogSmartphone {
	idd = 88888;
	name = "SunriseDialogSmartphone";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;[] spawn SunriseClient_system_smartphone;";
	
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
			text = "СООБЩЕНИЯ";
			
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
		class MessagesTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = 88886;
			text = "";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			
			x = 0.299999;
			y = 0.1;
			w = 0.6625;
			h = 0.04;
		};		
		
		class MessageTextTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = 88890;
			text = "$STR_SMARTPHONE_SELTITLE";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			
			x = 0.299999;
			y = 0.44;
			w = 0.6625;
			h = 0.04;
		};
		
		class PlayerList : RscListBox
		{
			idc = 88881;
			onLBSelChanged = "[2] spawn SunriseClient_system_smartphone;";

			x = 0.0375;
			y = 0.21;
			w = 0.25;
			h = 0.55;
		};

		class PlayerSearch : RscEdit
		{
			idc = 888818;
			onKeyDown = "[5] spawn SunriseClient_system_smartphone;";
			text = "";
			
			x = 0.0375;
			y = 0.16;
			w = 0.25;
			h = 0.04;
		};

		class MessageList : RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] call SunriseClient_system_showMsg;";
			//sizeEx = 0.04;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3};
			
			x = 0.299999;
			y = 0.16;
			w = 0.6625;
			h = 0.26;
		};

		class TextShow : RscControlsGroup {
			x = 0.299999;
			y = 0.5;
			w = 0.6625;
			h = 0.26;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.6625;
					h = 1;
				};
			};
		};
				
		class NewMessageButton: RscExtremoGui_ButtonGreen
		{
			idc = 887892;
			text = "$STR_SMARTPHONE_SCHREIBEN";	
			onButtonClick = "[4] spawn SunriseClient_system_smartphone";			
			
			x = 0.0374988;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};
		
		class 911MessageButton: RscExtremoGui_ButtonRed
		{
			idc = -1;
			text = "$STR_SMARTPHONE_NOTRUF";	
			onButtonClick = "createDialog ""SunriseDialogSmartphoneNotruf""";			
			
			x = 0.299999;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};
		
		class ClearMessageButton: RscExtremoGui_ButtonRed
		{
			idc = -1;
			text = "$STR_SMARTPHONE_DELMESSAGES";	
			onButtonClick = "[3] spawn SunriseClient_system_smartphone";
			tooltip = "Очистить историю сообщений";
			
			x = 0.7125;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};

		class ContactsTitle : RscTitle {
			idc = -1;
			text = "$STR_SMARTPHONE_PLAYERLISTTITLE";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0374988;
			y = 0.1;
			w = 0.250001;
			h = 0.04;
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

class SunriseDialogSmartphoneTargetMessage
{
	idd = 88883;
	name = "SunriseDialogSmartphoneTargetMessage";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;";

	class controlsBackground {
		class MainBackground: RscExtremoGui_DialogBG
		{
			idc = -1;
		
			x = 0.242;
			y = 0.1692;
			w = 0.5125;
			h = 0.432;
		};
		class Title: Life_V3_Title
		{
			idc = 88886;
			colorBackground[] = {TLD_COLOR_1,0.9};
			text = "$STR_SMARTPHONE_NACHRICHTTITLE"; //--- ToDo: Localize;
			x = 0.24209;
			y = 0.0888;
			w = 0.5125;
			h = 0.08;
		};
	};
	class controls {
		class CloseImage: RscPicture
		{
			idc = -1;
		
			text = "\sunrise_gui\data\v3\button_close.paa";
			x = 0.70675;
			y = 0.104;
			w = 0.035;
			h = 0.045818;
		};
		class CloseButton: RscPictureButtonMenu
		{
			onButtonClick = "closeDialog 0";
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
		
			idc = -1;
			x = 0.70675;
			y = 0.104;
			w = 0.035;
			h = 0.045818;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.004};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * GUI_GRID_H;
		};
		class BackImage: RscPicture
		{
			idc = -1;
		
			text = "\sunrise_gui\data\v3\button_back.paa";
			x = 0.67;
			y = 0.104;
			w = 0.035;
			h = 0.045818;
		};
		class BackButton: RscButtonMenu
		{
			onButtonClick = "closeDialog 0";
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
		
			idc = -1;
			x = 0.67;
			y = 0.104;
			w = 0.035;
			h = 0.045818;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.004};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * GUI_GRID_H;
		};
		class EditBox: RscExtremoGui_Edit
		{
			idc = 88884;
			text = "";
			style = 16;
			maxChars = 320;
			
			x = 0.255;
			y = 0.1792;
			w = 0.4875;
			h = 0.336;
		};
		class Absenden: RscButton
		{
			idc = 1601;
			onButtonClick = "[1,-1,(ctrlText 88884)] call SunriseClient_system_newMsg;";
			text = "$STR_SMARTPHONE_ABSENDEN";
			
			x = 0.25275;
			y = 0.5296;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};

		};
		class AdminMsg: RscButton
		{
			idc = 1600;
			onButtonClick = "[5,-1,(ctrlText 88884)] call SunriseClient_system_newMsg;";
			text = "$STR_CELL_AdminMsg";
		
			x = 0.5375;
			y = 0.528;
			w = 0.205;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};

		};
	};
};

class SunriseDialogSmartphoneNotruf {
	idd = 887890;
	name= "SunriseDialogSmartphoneNotruf";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;[6] spawn SunriseClient_system_newMsg;";
	
	class controlsBackground {
		class MainBackground: RscExtremoGui_DialogBG
		{
			idc = -1;
			x = 0.242;
			y = 0.1692;
			w = 0.5125;
			h = 0.728;
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BG_R',1])","(profilenamespace getvariable ['GUI_V3_BG_G',1])","(profilenamespace getvariable ['GUI_V3_BG_B',1])","(profilenamespace getvariable ['GUI_V3_BG_A',0.8])"};
		};
		class Title: Life_V3_Title
		{
			idc = 88886;
			
			text = "$STR_SMARTPHONE_NOTRUF";
			x = 0.242;
			y = 0.0888;
			w = 0.5125;
			h = 0.08;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_TITLE_R',0.216])","(profilenamespace getvariable ['GUI_V3_TITLE_G',0.31])","(profilenamespace getvariable ['GUI_V3_TITLE_B',0.4])","(profilenamespace getvariable ['GUI_V3_TITLE_A',0.8])"};
		};
	};

	class controls {
		class CloseImage: RscPicture
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			text = "\sunrise_gui\data\v3\button_close.paa";
			x = 0.70675;
			y = 0.104;
			w = 0.035;
			h = 0.045818;
		};
		class CloseButton: RscPictureButtonMenu
		{
			onButtonClick = "closeDialog 0";
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
			idc = -1;
		
			x = 0.70675;
			y = 0.104;
			w = 0.035;
			h = 0.045818;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.004};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * GUI_GRID_H * GUI_GRID_H;
		};
		class BackImage: RscPicture
		{
			idc = -1;
			
			tooltip = "$STR_PM_BackToMainMenu";
			text = "\sunrise_gui\data\v3\button_back.paa";
			x = 0.6625;
			y = 0.104;
			w = 0.035;
			h = 0.045818;
		};
		class BackButton: RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
			idc = -1;
			
			x = 0.66;
			y = 0.104;
			w = 0.035;
			h = 0.045818;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.004};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * GUI_GRID_H * GUI_GRID_H;
		};
		class EditBox: RscExtremoGui_Edit
		{
			idc = 888894;
			text = "";
			style = 16;
			maxChars = 320;
			
			x = 0.255;
			y = 0.1792;
			w = 0.4875;
			h = 0.144;
			colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])","(profilenamespace getvariable ['GUI_V3_TXT_G',0])","(profilenamespace getvariable ['GUI_V3_TXT_B',0])","(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBG_R',1])","(profilenamespace getvariable ['GUI_V3_ELBG_G',1])","(profilenamespace getvariable ['GUI_V3_ELBG_B',1])","(profilenamespace getvariable ['GUI_V3_ELBG_A',0.5])"};
		};
		class FirstLeftBtn: RscButton
		{
			idc = 888900;
			onButtonClick = "[4,-1,(ctrlText 888894)] call SunriseClient_system_newMsg";
			text = "EMS";

			x = 0.255;
			y = 0.34;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class SecondLeftBtn: RscButton
		{
			idc = 888902;
			onButtonClick = "[11,-1,(ctrlText 888894)] call SunriseClient_system_newMsg";
			text = "Группа";
			
			x = 0.255;
			y = 0.42;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class ThirdLeftBtn: RscButton
		{
			idc = 888904;
			onButtonClick = "";
			text = "";
			
			x = 0.255;
			y = 0.5;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class FourthLeftBtn: RscButton
		{
			idc = 888906;
			onButtonClick = "";
			text = "";
			
			x = 0.255;
			y = 0.58;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class FifthLeftBtn: RscButton
		{
			idc = 888908;
			onButtonClick = "";
			text = "";
			
			x = 0.255;
			y = 0.66;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class SixthLeftBtn: RscButton
		{
			idc = 888910;
			onButtonClick = "";
			text = "";
			
			x = 0.255;
			y = 0.74;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class SevethLeftBtn: RscButton
		{
			idc = 888912;
			onButtonClick = "";
			text = "";
			
			x = 0.255;
			y = 0.82;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		
		///RIGHT SIDE
		class FirstRightBtn: RscButton
		{
			idc = 888901;
			text = "Полиция";
			onButtonClick = "[2,-1,(ctrlText 888894)] call SunriseClient_system_newMsg";
		
			x = 0.5325;
			y = 0.34;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class SecondRightBtn: RscButton
		{
			idc = 888903;
			text = "Администрация";
			onButtonClick = "[3,-1,(ctrlText 888894)] call SunriseClient_system_newMsg";

			x = 0.5325;
			y = 0.42;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class ThirdRightBtn: RscButton
		{
			idc = 888905;
			text = "";
			onButtonClick = "";

			x = 0.5325;
			y = 0.5;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class FourthRightBtn: RscButton
		{
			idc = 888907;
			text = "";
			onButtonClick = "";

			x = 0.5325;
			y = 0.58;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class FifthRightBtn: RscButton
		{
			idc = 888909;
			text = "";
			onButtonClick = "";

			x = 0.5325;
			y = 0.66;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class SixthRightBtn: RscButton
		{
			idc = 888911;
			text = "";
			onButtonClick = "";

			x = 0.5325;
			y = 0.74;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class SevethRightBtn: RscButton
		{
			idc = 888913;
			text = "";
			onButtonClick = "";

			x = 0.5325;
			y = 0.82;
			w = 0.2075;
			h = 0.06;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])","(profilenamespace getvariable ['GUI_V3_BTBG_G',0])","(profilenamespace getvariable ['GUI_V3_BTBG_B',0])","(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		
	};
};