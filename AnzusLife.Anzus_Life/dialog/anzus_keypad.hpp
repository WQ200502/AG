
class Life_KeypadButtonMenu : Life_RscButtonMenu {
    idc = -1;
    type = 16;
    style = "0x02 + 0xC0";
    default = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    colorBackground[] = {0,0,0,0.8};
    colorBackgroundFocused[] = {1,1,1,1};
    colorBackground2[] = {0.75,0.75,0.75,1};
    color[] = {1,1,1,1};
    colorFocused[] = {0,0,0,1};
    color2[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    period = 1.2;
    periodFocus = 1.2;
    periodOver = 1.2;
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 3)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 3)";
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    class TextPos
    {
        left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0.0;
    };
    class Attributes
    {
        font = "RobotoCondensedLight";
        color = "#E5E5E5";
        align = "center";
        shadow = "false";
    };
    class ShortcutPos
    {
        left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
        top = 0.005;
        w = 0.0225;
        h = 0.03;
    };
    soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
    textureNoShortcut = "";
};

class anzus_keypad
{
	idd = 3366991;
	name = "anzus_keypad";
	movingEnabled = false;
	enableSimulation = true;
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Kamdan Navy笔记本解锁键盘"; //--- ToDo: Localize;
			x = 0.420672 * safezoneW + safezoneX;
			y = 0.302518 * safezoneH + safezoneY;
			w = 0.16747 * safezoneW;
			h = 0.0188079 * safezoneH;
            colorBackground[]   = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "1"};
      	};
		class IGUIBack_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.420672 * safezoneW + safezoneX;
			y = 0.321325 * safezoneH + safezoneY;
			w = 0.16747 * safezoneW;
			h = 0.347945 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class RscButtonMenu_2400: Life_KeypadButtonMenu
		{
			idc = 2400;
			text = "1"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[1] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2401: Life_KeypadButtonMenu
		{
			idc = 2401;
			text = "2"; //--- ToDo: Localize;
			x = 0.48061 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[2] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2402: Life_KeypadButtonMenu
		{
			idc = 2402;
			text = "3"; //--- ToDo: Localize;
			x = 0.535257 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[3] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2403: Life_KeypadButtonMenu
		{
			idc = 2403;
			text = "4"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.415365 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[4] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2404: Life_KeypadButtonMenu
		{
			idc = 2404;
			text = "5"; //--- ToDo: Localize;
			x = 0.480608 * safezoneW + safezoneX;
			y = 0.415366 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[5] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2405: Life_KeypadButtonMenu
		{
			idc = 2405;
			text = "6"; //--- ToDo: Localize;
			x = 0.535257 * safezoneW + safezoneX;
			y = 0.415366 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[6] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2406: Life_KeypadButtonMenu
		{
			idc = 2406;
			text = "7"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.501881 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[7] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2407: Life_KeypadButtonMenu
		{
			idc = 2407;
			text = "8"; //--- ToDo: Localize;
			x = 0.480608 * safezoneW + safezoneX;
			y = 0.501882 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[8] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2408: Life_KeypadButtonMenu
		{
			idc = 2408;
			text = "0"; //--- ToDo: Localize;
			x = 0.535255 * safezoneW + safezoneX;
			y = 0.501881 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[0] spawn ANZUS_fnc_shipkey;";
		};
		class RscButtonMenu_2409: Life_RscButtonMenu
		{
			idc = 2409;
			text = "进入"; //--- ToDo: Localize;
			x = 0.482372 * safezoneW + safezoneX;
			y = 0.631655 * safezoneH + safezoneY;
			w = 0.0440709 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "['enter'] spawn ANZUS_fnc_shipkey;";
		};
	};
};

class anzus_dodkeypad
{
	idd = 3366991;
	name = "anzus_dodkeypad";
	movingEnabled = false;
	enableSimulation = true;
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Kamdan Navy笔记本解锁键盘"; //--- ToDo: Localize;
			x = 0.420672 * safezoneW + safezoneX;
			y = 0.302518 * safezoneH + safezoneY;
			w = 0.16747 * safezoneW;
			h = 0.0188079 * safezoneH;
            colorBackground[]   = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "1"};
      	};
		class IGUIBack_2200: Life_RscBackground
		{
			idc = 2200;
			x = 0.420672 * safezoneW + safezoneX;
			y = 0.321325 * safezoneH + safezoneY;
			w = 0.16747 * safezoneW;
			h = 0.347945 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class RscButtonMenu_2400: Life_KeypadButtonMenu
		{
			idc = 2400;
			text = "1"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[1] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2401: Life_KeypadButtonMenu
		{
			idc = 2401;
			text = "2"; //--- ToDo: Localize;
			x = 0.48061 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[2] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2402: Life_KeypadButtonMenu
		{
			idc = 2402;
			text = "3"; //--- ToDo: Localize;
			x = 0.535257 * safezoneW + safezoneX;
			y = 0.330729 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[3] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2403: Life_KeypadButtonMenu
		{
			idc = 2403;
			text = "4"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.415365 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[4] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2404: Life_KeypadButtonMenu
		{
			idc = 2404;
			text = "5"; //--- ToDo: Localize;
			x = 0.480608 * safezoneW + safezoneX;
			y = 0.415366 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[5] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2405: Life_KeypadButtonMenu
		{
			idc = 2405;
			text = "6"; //--- ToDo: Localize;
			x = 0.535257 * safezoneW + safezoneX;
			y = 0.415366 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[6] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2406: Life_KeypadButtonMenu
		{
			idc = 2406;
			text = "7"; //--- ToDo: Localize;
			x = 0.425079 * safezoneW + safezoneX;
			y = 0.501881 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[7] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2407: Life_KeypadButtonMenu
		{
			idc = 2407;
			text = "8"; //--- ToDo: Localize;
			x = 0.480608 * safezoneW + safezoneX;
			y = 0.501882 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[8] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2408: Life_KeypadButtonMenu
		{
			idc = 2408;
			text = "0"; //--- ToDo: Localize;
			x = 0.535255 * safezoneW + safezoneX;
			y = 0.501881 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0752314 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "[0] spawn ANZUS_fnc_openDOD;";
		};
		class RscButtonMenu_2409: Life_RscButtonMenu
		{
			idc = 2409;
			text = "进入"; //--- ToDo: Localize;
			x = 0.482372 * safezoneW + safezoneX;
			y = 0.631655 * safezoneH + safezoneY;
			w = 0.0440709 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			onButtonDown = "['enter'] spawn ANZUS_fnc_openDOD;";
		};
	};
};