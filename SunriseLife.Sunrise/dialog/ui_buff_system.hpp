class RscNewUiBuff: RscControlsGroupNoScrollbars {
    idc = -1;
    x = 0;
    y = 0;
    w = "0.167 * safezoneW";
    h = "0.032 * safezoneH";
    fade = 1;
    class controls {
        class Background: RscExtremoGui_HudBG {
            idc = 100;
            x = 0;
            y = 0;
            w = "0.169271 * safeZoneW";
            h = "0.032 * safezoneH";
			//["0.802906 * safezoneW + safezoneX","0.9542 * safezoneH + safezoneY","0.169271 * safezoneW","0.032 * safezoneH"]
        };
        class image_background: RscText {
            idc = 101;
            text = "";
            x = 0;
            y = 0;
            w = "0.0025 * safezoneW";
            h = "0.032 * safezoneH";
            //colorBackground[] = {"19/255","22/255","27/255",0.80000001};
        };
        class image: RscPicture {
            idc = 102;
            text = "";
            x = 0;
            y = 0;
            w = "0.022 * safezoneW";
            h = "0.032 * safezoneH";
        };
        class ProgressBar: RscExtremoGui_Buff {
            idc = 103;
            x = 0;
            y = 0;
            w = "0.139 * safezoneW";
            h = "0.004 * safezoneH";
            //colorFrame[] = {0,0,0,0};
            //colorBar[] = {1,1,1,1};
        };
        class Text: RscText {
            idc = 104;
            text = "";
            x = 0;
            y = 0;
            w = "0.145 * safezoneW";
            h = "0.026 * safezoneH";
            size = "1 * pixelH";

            font = "RobotoCondensed";
            shadow = 0;

            colorBackground[] = {0,0,0,0};
            class Attributes {
                shadow = 0;
            };
        };
    };
};