/*class AL_Hud {
    idd = -1;
    duration = 1e+1000;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "AL_Hud";
    onLoad = "uiNamespace setVariable ['AL_Hud',_this select 0]";
    objects[] = {};
    controls[] = {
        ANZUS_BAR_FOOD_RING,
        ANZUS_BAR_WATER_RING,
        ANZUS_BAR_HEALTH_RING,
        ANZUS_BAR_Speaker,
        AnzusLife_ThreatLevelText,
    };

    class ANZUS_BAR_Speaker: life_RscPicture
    {
        idc = 3007;
        text = "";
        x = 0.952292 * safezoneW + safezoneX;
        y = 0.640333 * safezoneH + safezoneY;
        w = 0.0331042 * safezoneW;
        h = 0.0589743 * safezoneH;
    };
    class ANZUS_BAR_HEALTH_RING: life_RscPicture
    {
        idc = 3202;
        text = "";
        x = 0.860937 * safezoneW + safezoneX;
        y = 0.665 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.143 * safezoneH;
    };
    class ANZUS_BAR_FOOD_RING: life_RscPicture
    {
        idc = 3200;
        text = "";
        x = 0.860937 * safezoneW + safezoneX;
        y = 0.775 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.143 * safezoneH;
    };
    class ANZUS_BAR_WATER_RING: life_RscPicture
    {
        idc = 3201;
        text = "";
        x = 0.860937 * safezoneW + safezoneX;
        y = 0.72 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.143 * safezoneH;
    };
    class AnzusLife_ThreatLevelText: life_RscText
    {
        idc = 1251;
        text = "威胁等级";
        x = 0.936218 * safezoneW + safezoneX;
        y = 0.9752 * safezoneH + safezoneY;
        w = 0.061875 * safezoneW;
        h = 0.022 * safezoneH;
        colorText[] = {0.063,0.776,0,1};
        font = "PuristaSemiBold";
        SizeEx = 0.035;
    };
    class AnzusLife_ServerVersion: life_RscText
	{
		idc = 1252;
		font = "PuristaSemiBold";
		text = "v"; 
		x = 0.962 * safezoneW + safezoneX;
		y = 0.9554 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.022 * safezoneH;
		colorText[] = {1,1,1,1};
	};
};*/

#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_FOOD_RING 3200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_WATER_RING 3201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_BAR_HEALTH_RING 3202
//#define IDC_LIFE_BAR_POOP 4202
#define IDC_LIFE_BAR_Speaker 3007
#define IDC_LIFE_BAR_SeatBelt 4203


class AL_Hud {
	idd = -1;
	duration = INFINITE;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "AL_Hud";
	onLoad = "uiNamespace setVariable ['AL_Hud',_this select 0]";
	objects[] = {};
		controls[] = {
		LIFE_BAR_FOOD_RING,
		LIFE_BAR_WATER_RING,
		LIFE_BAR_HEALTH_RING,
		LIFE_BAR_Speaker,
		LIFE_BAR_SeatBelt
	};

		class LIFE_BAR_SeatBelt: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_SeatBelt;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.574333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
		class LIFE_BAR_Speaker: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_Speaker;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.640333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
		class LIFE_BAR_HEALTH_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_HEALTH_RING;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.706333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
		class LIFE_BAR_FOOD_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_FOOD_RING;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.772333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
		class LIFE_BAR_WATER_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_WATER_RING;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.838333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
};