
  class AL_Hud {
    idd = -1;
    duration = 10e10;
    movingEnable = 0;
    enableSimulation = 1;
    fadein = 0;
    fadeout = 0;
    name = "AL_Hud";
    onLoad = "uiNamespace setVariable ['AL_Hud',_this select 0]";
    class controls
    {
        class HealthBackground: Life_RscPictureKeepAspect
        {
            idc=-1;
            text="ui\background\healthBackground.paa";
            x="0.0153125 * safezoneW + safezoneX";
            y="0.797 * safezoneH + safezoneY";
            w="0.113437 * safezoneW";
            h="0.044 * safezoneH";
        };
        class HungerBackground: Life_RscPictureKeepAspect
        {
            idc=-1;
            text="ui\background\hungerBackground.paa";
            x="0.0153125 * safezoneW + safezoneX";
            y="0.852 * safezoneH + safezoneY";
            w="0.113437 * safezoneW";
            h="0.044 * safezoneH";
        };
        class ThirstBackground: Life_RscPictureKeepAspect
        {
            idc=-1;
            text="ui\background\thirstBackground.paa";
            x="0.0153125 * safezoneW + safezoneX";
            y="0.907 * safezoneH + safezoneY";
            w="0.113437 * safezoneW";
            h="0.044 * safezoneH";
        };
        class HealthBar: Life_RscPictureKeepAspect
        {
            idc=15020;
            text="ui\progressBar\health\health_100.paa";
            x="0.0153125 * safezoneW + safezoneX";
            y="0.797 * safezoneH + safezoneY";
            w="0.113437 * safezoneW";
            h="0.044 * safezoneH";
        };
        class HungerBar: Life_RscPictureKeepAspect
        {
            idc=15021;
            text="ui\progressBar\hunger\hunger_100.paa";
            x="0.0153125 * safezoneW + safezoneX";
            y="0.852 * safezoneH + safezoneY";
            w="0.113437 * safezoneW";
            h="0.044 * safezoneH";
        };
        class ThirstBar: Life_RscPictureKeepAspect
        {
            idc=15022;
            text="ui\progressBar\thirst\thirst_100.paa";
            x="0.0153125 * safezoneW + safezoneX";
            y="0.907 * safezoneH + safezoneY";
            w="0.113437 * safezoneW";
            h="0.044 * safezoneH";
        };
        class Watermark_ALPHA_1: Life_RscStructuredText
        {
            idc=15026;
            text="";
            x="0.381406 * safezoneW + safezoneX";
            y="0.423 * safezoneH + safezoneY";
            w="0.237187 * safezoneW";
            h="0.253 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
        class Watermark_ALPHA_2: Life_RscStructuredText
        {
            idc=15027;
            text="";
            x="0.762969 * safezoneW + safezoneX";
            y="0.819 * safezoneH + safezoneY";
            w="0.237187 * safezoneW";
            h="0.253 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
        class Watermark_ALPHA_3: Life_RscStructuredText
        {
            idc=15028;
            text="";
            x="0.0875 * safezoneW + safezoneX";
            y="0.544 * safezoneH + safezoneY";
            w="0.237187 * safezoneW";
            h="0.253 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
        class Watermark_ALPHA_4: Life_RscStructuredText
        {
            idc=15029;
            text="";
            x="0.164844 * safezoneW + safezoneX";
            y="0.137 * safezoneH + safezoneY";
            w="0.237187 * safezoneW";
            h="0.253 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
        class Watermark_ALPHA_5: Life_RscStructuredText
        {
            idc=15030;
            text="";
            x="0.0204687 * safezoneW + safezoneX";
            y="0.863 * safezoneH + safezoneY";
            w="0.237187 * safezoneW";
            h="0.253 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
        class Watermark_ALPHA_6: Life_RscStructuredText
        {
            idc=15031;
            text="";
            x="0.83 * safezoneW + safezoneX";
            y="0.522 * safezoneH + safezoneY";
            w="0.237187 * safezoneW";
            h="0.253 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
        class Watermark_ALPHA_7: Life_RscStructuredText
        {
            idc=15032;
            text="";
            x="0.840312 * safezoneW + safezoneX";
            y="0.115 * safezoneH + safezoneY";
            w="0.237187 * safezoneW";
            h="0.253 * safezoneH";
            colorBackground[]={-1,-1,-1,0};
        };
    };
};