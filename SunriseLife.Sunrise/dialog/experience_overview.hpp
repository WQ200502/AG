class SunriseDialogExperienceOverview {
	idd = 6600;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;[_this, 'onLoad'] spawn SunriseClient_experiencegui_talentOverview;";

	class controls {
		class RscText_1000: RscText
		{
			idc = -1;

			x = 0;
			y = 0;
			w = 1;
			h = 0.9;
			///colorBackground[] = {0.12,0.14,0.16,0.8};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BG_R',1])", "(profilenamespace getvariable ['GUI_V3_BG_G',1])", "(profilenamespace getvariable ['GUI_V3_BG_B',1])", "(profilenamespace getvariable ['GUI_V3_BG_A',0.8])"};
		};
		class RscText_1003: RscText
		{
			idc = -1;
			x = 0; 
			y = 0.12; 
			w = 1; 
			h = 0.02;
			colorBackground[] = {1,1,1,1};
		};
		class RscText_1002: RscText
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 1;
			h = 0.14;
			//colorBackground[] = {0.98,0.74,0.1,1};
			////colorBackground[] = {1,1,1,0.5};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BG_R',1])", "(profilenamespace getvariable ['GUI_V3_BG_G',1])", "(profilenamespace getvariable ['GUI_V3_BG_B',1])", "(profilenamespace getvariable ['GUI_V3_BG_A',0.8])"};

		};
		class textRankName: RscText
		{
			idc = 4;
			text = ""; //--- ToDo: Localize;
			x = 0.0125;
			y = 0.02;
			w = 0.479925;
			h = 0.04;
			sizeEx = 1.5 * 0.04;
			shadow = 0;
		};
		class textStatusInfo: RscText
		{
			idc = 5;
			text = ""; //--- ToDo: Localize;
			x = 0.0125;
			y = 0.06;
			w = 0.678029;
			h = 0.04;
			shadow = 0;
		};
		class RscText_1700: RscText
		{
			idc = -1;
			x = 0;
			y = 0.12;
			w = 1;
			h = 0.02;
			colorBackground[] = {1,1,1,1};
		};		
		/*class skillsListBox: RscXListBox
		{
			idc = 12;
			x = 0;
			y = 0.14;
			w = 1;
			h = 0.044;
			onLBSelChanged = "systemChat str ['onLBSelChanged',_this]";
		};*/
		class progressRankProgress: RscProgress
		{
			idc = 6;
			x = 0;
			y = 0.12;
			w = 1;
			h = 0.02;
			colorFrame[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBar[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
		};
		class SkillOne: RscButtonMenu
		{
			idc = 12;
			text = "Сила"; //--- ToDo: Localize;
			onButtonClick = "[[findDisplay 6600,'Strength'], 'OnTabButtonClick'] call SunriseClient_experiencegui_talentOverview;";
			x = 0.02;
			y = 0.141;
			w = 0.16;
			h = 0.044;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};

			class Attributes {
				align = "center";
				shadow = 2;
			};
		};
		class SkillTwo: SkillOne
		{
			idc = 13;
			text = "Оружейник"; //--- ToDo: Localize;
			onButtonClick = "[[findDisplay 6600,'Gun'], 'OnTabButtonClick'] call SunriseClient_experiencegui_talentOverview;";
			x = 0.18;
		};
		class SkillThree: SkillOne
		{
			idc = 14;
			text = "Техник"; //--- ToDo: Localize;
			onButtonClick = "[[findDisplay 6600,'Tech'], 'OnTabButtonClick'] call SunriseClient_experiencegui_talentOverview;";
			x = 0.34;
		};
		class SkillFour: SkillOne
		{
			idc = 15;
			text = "Медицина"; //--- ToDo: Localize;
			onButtonClick = "[[findDisplay 6600,'Medic'], 'OnTabButtonClick'] call SunriseClient_experiencegui_talentOverview;";
			x = 0.5;
		};
		class SkillFive: SkillOne
		{
			idc = 16;
			text = "Добытчик"; //--- ToDo: Localize;
			onButtonClick = "[[findDisplay 6600,'Gather'], 'OnTabButtonClick'] call SunriseClient_experiencegui_talentOverview;";
			x = 0.66;
		};
		class SkillSix: SkillOne
		{
			idc = 17;
			text = "Бандитизм"; //--- ToDo: Localize;
			onButtonClick = "[[findDisplay 6600,'Thief'], 'OnTabButtonClick'] call SunriseClient_experiencegui_talentOverview;";
			x = 0.82;
		};
		class MyControlsTable {
			idc = 107;

			x = 0.0125;
			y = 0.208;
			w = 0.451;//оставить единичку иначе появляется скролл
			h = 0.665;
			 
			type=19;
			style=16;
			 
			lineSpacing = 0;
			rowHeight = 3 * 0.04;
			headerHeight = 1 * 0.04;
			 
			firstIDC = 7300;
			lastIDC = 7399;
			 
			// Colours which are used for animation (i.e. change of colour) of the selected line.
			selectedRowColorFrom[]  = {0, 0, 0, 0};
			selectedRowColorTo[]    = {0, 0, 0, 0};
			// Length of the animation cycle in seconds.
			selectedRowAnimLength = 0;
			 
			class VScrollBar: RscScrollBar
			{
				width = 0.021;
				autoScrollEnabled = 0;
				autoScrollDelay = 1;
				autoScrollRewind = 1;
				autoScrollSpeed = 1;
			};
			
			class HScrollBar: RscScrollBar
			{
				height = 0.028;
			};
			
			// Template for selectable rows
			class RowTemplate
			{
				class FirstBtn
				{
					controlBaseClassPath[] = {"RscPictureButtonMenu_TalentTree"};
					columnX = 0;
					columnW = 0.09;
					controlOffsetY = 0;
				};
				class FirstPic
				{
					controlBaseClassPath[] = {"RscPicture"};
					columnX = 0;
					columnW = 0.09;
					controlOffsetY = 0;
				};
				class SecondArrow
				{
					controlBaseClassPath[] = {"RscPicture"};
					columnX = 0.09;
					columnW = 0.09;
					controlOffsetY = 0;
				};
				class SecondBtn
				{
					controlBaseClassPath[] = {"RscPictureButtonMenu_TalentTree"};
					columnX = 0.18;
					columnW = 0.09;
					controlOffsetY = 0;
				};
				class SecondPic
				{
					controlBaseClassPath[] = {"RscPicture"};
					columnX = 0.18;
					columnW = 0.09;
					controlOffsetY = 0;
				};
				class ThirdArrow
				{
					controlBaseClassPath[] = {"RscPicture"};
					columnX = 0.27;
					columnW = 0.09;
					controlOffsetY = 0;
				};
				class ThirdBtn
				{
					controlBaseClassPath[] = {"RscPictureButtonMenu_TalentTree"};
					columnX = 0.36;
					columnW = 0.09;
					controlOffsetY = 0;
				};
				class ThirdPic
				{
					controlBaseClassPath[] = {"RscPicture"};
					columnX = 0.36;
					columnW = 0.09;
					controlOffsetY = 0;
				};
			};
			// Template for headers (unlike rows, cannot be selected)
			class HeaderTemplate
			{
				class RowBackground
				{
					controlBaseClassPath[] = {"RscStructuredText"};
					columnX = 0;
					columnW = 0.45;
					controlOffsetY = 0;
				};
			};	
		};
		class textPerkName: RscText
		{
			idc = 8;
			text = ""; //--- ToDo: Localize;
			x = 0.4875;
			y = 0.192;
			w = 0.4975;
			h = 0.06;
			sizeEx = 2 * 0.04;
			shadow = 2;
		};
		class textPerkSubtitle: RscText
		{
			idc = 9;
			text = ""; //--- ToDo: Localize;
			x = 0.4875;
			y = 0.26;
			w = 0.4975;
			h = 0.04;
			shadow = 2;
		};
		class textPerkDescription: RscStructuredText
		{
			idc = 11;
			x = 0.4875;
			y = 0.32;
			w = 0.4875;
			h = 0.46;
			shadow = 2;
		};
		class RscButton_1600: RscButtonMenu
		{
			idc = 10;
			text = ""; //--- ToDo: Localize;
			x = 0.4875;
			y = 0.8;
			w = 0.4875;
			h = 0.08;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};

			enabled = 0;

			class Attributes {
				align = "center";
			};
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
		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.95;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class BackButton: RscPictureButtonMenu {
			idc = -1;
			text = "";  
			onButtonClick = "closeDialog 0; [] spawn SunriseClient_pad_openMain";
			tooltip = "$STR_PM_BackToMainMenu";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.9125;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class BackImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_back.paa";
			
			x = 0.9125;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
	};
};
