class SunriseDialogSettings
{
	idd = 2900;
	name = "SunriseDialogSettings";
	movingEnabled = 1;
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
			text = "НАСТРОЙКИ";
			
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

	class controls
	{	

		class Title : RscTitle
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_SM_Title";

			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};

		class VDonFoot : RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";

			x = 0.0374988;
			y = 0.16;
			w = 0.0875;
			h = 0.04;
		};

		class VDinCar : RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";

			x = 0.0374988;
			y = 0.22;
			w = 0.0875;
			h = 0.04;
		};

		class VDinAir : RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";

			x = 0.0374988;
			y = 0.28;
			w = 0.0875;
			h = 0.04;
		};

		class VD_onfoot_slider : RscXSliderH
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call SunriseClient_system_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";

			x = 0.137499;
			y = 0.16;
			w = 0.2625;
			h = 0.04;
		};

		class VD_onfoot_value : RscText
		{
			idc = 2902;
			text = "";

			x = 0.412499;
			y = 0.16;
			w = 0.1125;
			h = 0.04;
		};

		class VD_car_slider : RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call SunriseClient_system_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";

			x = 0.137499;
			y = 0.22;
			w = 0.2625;
			h = 0.04;
		};

		class VD_car_value : RscText
		{
			idc = 2912;
			text = "";

			x = 0.412499;
			y = 0.22;
			w = 0.1125;
			h = 0.04;
		};

		class VD_air_slider : RscXSliderH
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call SunriseClient_system_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";

			x = 0.137499;
			y = 0.28;
			w = 0.2625;
			h = 0.04;
		};

		class VD_air_value : RscText
		{
			idc = 2922;
			text = "";

			x = 0.412499;
			y = 0.28;
			w = 0.1125;
			h = 0.04;
		};



		class PlayerTagsHeader : RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0375;
			y = 0.38;
			w = 0.3875;
			h = 0.04;
		};

		class PlayerTagsONOFF : RscActiveText
		{
			text = "";
			tooltip = "$STR_GUI_PlayTags";
			idc = 2970;
			sizeEx = 0.04;

			x = 0.4375;
			y = 0.38;
			w = 0.0875;
			h = 0.04;
		};

		class GrassHeader : RscText
		{
			idc = -1;
			text = "Прорисовка травы";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0375;
			y = 0.44;
			w = 0.3875;
			h = 0.04;
		};

		class GrassONOFF : RscActiveText
		{
			tooltip = "Полная прорисовка травы. Выключение данного параметра может увеличить производительность";
			idc = 2972;

			x = 0.4375;
			y = 0.44;
			w = 0.0875;
			h = 0.04;
		};

		class HUDHeader : RscText
		{
			idc = -1;
			text = "Отображение HUD";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0375;
			y = 0.568;
			w = 0.3875;
			h = 0.04;
		};

		class HUDONOFF : RscActiveText
		{
			tooltip = "Отображение информации о персонаже на экране";
			idc = 2979;

			x = 0.4375;
			y = 0.568;
			w = 0.0875;
			h = 0.04;
		};
		
		class FPSHeader : RscText
		{
			idc = -1;
			text = "Отображение FPS (кадры в сек)";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0375;
			y = 0.632;
			w = 0.3875;
			h = 0.04;
		};

		class FPSONOFF : RscActiveText
		{
			tooltip = "Отображение количества кадров в секунду";
			idc = 2980;

			x = 0.4375;
			y = 0.632;
			w = 0.0875;
			h = 0.04;
		};
		
		class TraderHeader : RscText
		{
			idc = -1;
			text = "Отображение NPC продавцов";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0375;
			y = 0.696;
			w = 0.3875;
			h = 0.04;
		};

		class TraderONOFF : RscActiveText
		{
			tooltip = "Заменяет продавцов на таблички (необходимо перезайти)";
			idc = 2976;

			x = 0.4375;
			y = 0.696;
			w = 0.0875;
			h = 0.04;
		};

		class weaponHudStatus : RscText
		{
			idc = -1;
			text = "Оружейный HUD";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0375;
			y = 0.76;
			w = 0.3875;
			h = 0.04;
		};

		class weaponHudStatusONOFF : RscActiveText
		{
			text = "";
			tooltip = "Постоянно / на клавишу ё";
			idc = 2924;
			
			x = 0.4375;
			y = 0.76;
			w = 0.0875;
			h = 0.04;
		};
		
		class saveBind : RscText
		{
			idc = -1;
			text = "Сохранение биндов";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0375;
			y = 0.824;
			w = 0.3875;
			h = 0.04;
		};

		class saveBindONOFF : RscActiveText
		{
			text = "";
			tooltip = "При включении не будет обновлять оружейный HUD. Таким образом вы можете выставить какой-либо бинд и он сохранится независимо от наличия предмета";
			idc = 2923;
			
			x = 0.4375;
			y = 0.824;
			w = 0.0875;
			h = 0.04;
		};

		/*class ColorTitle : RscStructuredText
		{
			idc = -1;
			text = "Планшет:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.16;
			w = 0.1125;
			h = 0.04;
		};

		class ColorList : RscCombo
		{
			idc = 2973;
			onLBSelChanged = "_this call SunriseClient_system_savePadSkin";

			x = 0.65;
			y = 0.16;
			w = 0.3125;
			h = 0.04;
		};*/

		class PassTitle : RscStructuredText
		{
			idc = -1;
			text = "Паспорт:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.22;
			w = 0.1125;
			h = 0.04;
		};

		class PassList : RscCombo
		{
			idc = 2977;
			onLBSelChanged = "_this call SunriseClient_system_savePassport";

			x = 0.65;
			y = 0.22;
			w = 0.3125;
			h = 0.04;
		};

		class TagTitle : RscStructuredText
		{
			idc = -1;
			text = "Титул:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.28;
			w = 0.1125;
			h = 0.04;
		};

		class TagList : RscCombo
		{
			idc = 2978;
			onLBSelChanged = "_this call SunriseClient_system_saveTitle";

			x = 0.65;
			y = 0.28;
			w = 0.3125;
			h = 0.04;
		};

		/*class b_skin: RscExtremoGui_ButtonYellow
		{
			idc = -1;
			text = "Настройка окон"; //--- ToDo: Localize;
			x = 0.65;
			y = 0.36;
			w = 0.3125;
			h = 0.05;

			onButtonClick = "closeDialog 0; [] spawn SunriseClient_hud_skinMenu";
		};*/
		
		class NameTitle : RscStructuredText
		{
			idc = 29786;
			show = "false";
			text = "Имя:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.58;
			w = 0.1125;
			h = 0.04;
		};
		class EditName : RscEdit 
		{
			idc = 29781;
			show = "false";
			x = 0.65;
			y = 0.58;
			w = 0.2125;
			h = 0.04;
			text = "";
		};
		class EditNameConfirm : RscExtremoGui_ButtonDark
		{
			idc = 29782;
			show = "false";
			x = 0.875;
			y = 0.58;
			w = 0.1;
			h = 0.04;
			text = "Сменить имя";
			onButtonClick = "['name',(ctrlText 29781)] call SunriseClient_system_changeSideName;";
			
		};

		class SideTitle : RscStructuredText
		{
			idc = 29785;
			text = "Фракция:";
			sizeEx = 0.020;
			show = "false";
			x = 0.525;
			y = 0.64;
			w = 0.1125;
			h = 0.04;
		};
		class EditSide : RscExtremoGui_ButtonDark 
		{
			idc = 29783;
			show = "false";
			x = 0.65;
			y = 0.64;
			w = 0.2125;
			h = 0.04;
			text = "Сменить фракцию";
			onButtonClick = "['side'] call SunriseClient_system_changeSideName;";
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