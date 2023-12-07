class AnzusLife_ThreatLevel {
	idd = 15212;
	name = "AnzusLife_ThreatLevel";
	class controlsBackground
	{
		class AnzusLife_TopBar: Life_RscText
		{
			idc = 1201;
			colorBackground[] = {0,0,0,0.8};
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.34137 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.0266296 * safezoneH;
		};
		class AnzusLife_Background: Life_RscText
		{
			idc = 1200;
			colorBackground[] = {0,0,0,0.7};
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class AnzusLife_ThreatLevelTopText: Life_RscText
		{
			idc = 1000;
			text = "选择威胁等级";
			x = 0.370061 * safezoneW + safezoneX;
			y = 0.3438 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			font = "PuristaSemiBold";
			SizeEx = 0.035;
		};
	};
	class controls
    {
    	class AnzusLife_ChooseThreatLevelText: Life_RscCombo
		{
			idc = 2100;
			x = 0.379113 * safezoneW + safezoneX;
			y = 0.397881 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class AnzusLife_SetThreatLevel: Life_RscButtonMenu
		{
			idc = 2400;
			text = "设置威胁级别";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			class Attributes {
				font = "PuristaSemiBold";
				align = "center";
			};
		};
    };
};