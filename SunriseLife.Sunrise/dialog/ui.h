class playerHUD
{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	onUnload = "uiNamespace setVariable ['playerHUD', objNull]";
	onDestroy = "uiNamespace setVariable ['playerHUD', objNull]";
	objects[]={};

	class controlsBackground 
	{
//["0.824844 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.169271 * safezoneW","0.162037 * safezoneH"]
		class Blackout: RscExtremoGui_HudBG
		{
			idc = -1;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW;
			h = 0.162037 * safezoneH;
			//colorBackground[] = {0, 0, 0, 0.6};
		};
		class gas_mask : RscPicture
	    {
		   idc = 23520;
		   x = safezoneX;
		   y = safezoneY;
		   w = safezoneW;
		   h = safezoneH;
		   text = "";
		   show = false;
	    };
		class polosa1_r: RscText
		{
			idc = -1;
			colorBackground[] = {0.541,0.522,0.306,1};
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW;
			h = 0.0046296 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class polosa2_r: RscText
		{
			idc = -1;
			colorBackground[] = {0.431,0.478,0.235,1};
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW;
			h = 0.0046296 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class polosa3_r: RscText
		{
			idc = -1;
			colorBackground[] = {0.318,0.188,0.114,1};
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW;
			h = 0.0046296 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class polosa4_r: RscText
		{
			idc = -1;
			colorBackground[] = {0.212,0.384,0.435,1};
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW;
			h = 0.0046296 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
//["0.83 * safezoneW + safezoneX","0.869 * safezoneH + safezoneY","0.013125 * safezoneW","0.0252 * safezoneH"]	
		class icon_health_r: RscPicture {
			idc = 23515;
			x = 0.83 * safezoneW + safezoneX;
			y = 0.869 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.0252 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			text = "";
		};
		class icon_health: icon_health_r
		{
			idc = 23509;
			text = "";
		};
//["0.83 * safezoneW + safezoneX","0.935 * safezoneH + safezoneY","0.013125 * safezoneW","0.0252 * safezoneH"]
		class icon_food_r: RscPicture {
			idc = 23517;
			x = 0.83 * safezoneW + safezoneX;
			y = 0.935 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.0252 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			text = "";
		};
		class icon_food: icon_food_r
		{
			idc = 23511;
			text = "";				
		};
//["0.83 * safezoneW + safezoneX","0.903 * safezoneH + safezoneY","0.013125 * safezoneW","0.0252 * safezoneH"]
		class icon_drink_r: RscPicture {
			idc = 23518;
			x = 0.83 * safezoneW + safezoneX;
			y = 0.903 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.0252 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			text = "";
		};
		class icon_drink: icon_drink_r
		{
			idc = 23512;
			text = "";						
		};
//["0.845469 * safezoneW + safezoneX","0.874 * safezoneH + safezoneY","0.0425 * safezoneW","0.015 * safezoneH"]
		class zdor: RscExtremoGui_Text
		{
			idc = 23521;
			text = "健康";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.068 * safezoneW;
			h = 0.015 * safezoneH;
			//sizeEx = 0.8 * GUI_GRID_H;
		};
//["0.845469 * safezoneW + safezoneX","0.907 * safezoneH + safezoneY","0.0425 * safezoneW","0.015 * safezoneH"]
		class voda: RscExtremoGui_Text
		{
			idc = 23522;
			text = "水分";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0425 * safezoneW;
			h = 0.015 * safezoneH;
			//sizeEx = 0.8 * GUI_GRID_H;
		};
//["0.845469 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0425 * safezoneW","0.015 * safezoneH"]
		class eda: RscExtremoGui_Text
		{
			idc = 23523;
			text = "食物";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0425 * safezoneW;
			h = 0.015 * safezoneH;
			//sizeEx = 0.8 * GUI_GRID_H;
		};
	};
	class controls
	{
//["0.824844 * safezoneW + safezoneX","0.841 * safezoneH + safezoneY","0.128906 * safezoneW","0.014 * safezoneH"]
		class name: RscExtremoGui_Text
		{
			idc = 23524;
			text = "";
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.836 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.0273 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
//["0.963 * safezoneW + safezoneX","0.875 * safezoneH + safezoneY","0.027 * safezoneW","0.014 * safezoneH"]
		class health: RscExtremoGui_Text
		{
			idc = 23500;
			text = "";
			x = 0.963 * safezoneW + safezoneX;
			y = 0.875 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.014 * safezoneH;
			//sizeEx = 0.8 * GUI_GRID_H;
		};
//["0.963 * safezoneW + safezoneX","0.841 * safezoneH + safezoneY","0.027 * safezoneW","0.014 * safezoneH"]
		class fatig: RscExtremoGui_Text
		{
			idc = 23501;
			text = "";
			x = 0.963 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.014 * safezoneH;
			//sizeEx = 0.8 * GUI_GRID_H;
		};
//["0.963 * safezoneW + safezoneX","0.941 * safezoneH + safezoneY","0.027 * safezoneW","0.014 * safezoneH"]
		class food_pb_value: RscExtremoGui_Text
		{
			idc = 23507;
			text = "";
			x = 0.963 * safezoneW + safezoneX;
			y = 0.9077 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.014 * safezoneH;
			//sizeEx = 0.8 * GUI_GRID_H;
		};
//["0.963 * safezoneW + safezoneX","0.9077 * safezoneH + safezoneY","0.027 * safezoneW","0.014 * safezoneH"]
		class water_pb_value: RscExtremoGui_Text
		{
			idc = 23508;
			text = "";
			x = 0.963 * safezoneW + safezoneX;
			y = 0.941 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.014 * safezoneH;
			//sizeEx = 0.8 * GUI_GRID_H;
		};
//["0.824844 * safezoneW + safezoneX","0.972 * safezoneH + safezoneY","0.125 * safezoneW","0.015 * safezoneH"]
		class server_nmb: RscExtremoGui_Text
		{
			idc = 23505;
			text = "";
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.972 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.015 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
//["0.958906 * safezoneW + safezoneX","0.966 * safezoneH + safezoneY","0.032 * safezoneW","0.014 * safezoneH"]
		class fps_info: RscExtremoGui_StructuredText
		{
			idc = 23506;
			x = 0.96 * safezoneW + safezoneX;
			y = 0.97 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.019 * safezoneH;
			text = "";
			sizeEx = 0.8 * GUI_GRID_H;
			//["0.963 * safezoneW + safezoneX","0.968 * safezoneH + safezoneY","0.04 * safezoneW","0.019 * safezoneH"]
		};
//789
		class fatige_pb: RscExtremoGui_HudStaminaPb
		{
			idc = 23519;
			//colorBar[] = {0.631,0.596,0.333,1};
			x = 0.824844 * safezoneW + safezoneX; 
			y = 0.863 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW; 
			h = 0.0046296 * safezoneH; 
			sizeEx = 1 * GUI_GRID_H;
		};
		class health_pb: RscExtremoGui_HudHealthPb
		{
			idc = 23516;
			//colorBar[] = {0.671,0.714,0.416,1};
			x = 0.824844 * safezoneW + safezoneX; 
			y = 0.896 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW; 
			h = 0.0046296 * safezoneH; 
			sizeEx = 1 * GUI_GRID_H;
		};
		class food_pb: RscExtremoGui_HudFoodPb
		{
			idc = 23513;
			colorBar[] = {0.545,0.333,0.192,1};
			x = 0.824844 * safezoneW + safezoneX; 
			y = 0.929 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW; 
			h = 0.0046296 * safezoneH; 
			sizeEx = 1 * GUI_GRID_H;
		};
		class water_pb: RscExtremoGui_HudFoodPb
		{
			idc = 23514;
			//colorBar[] = {0.125,0.631,0.678,1};
			x = 0.824844 * safezoneW + safezoneX; 
			y = 0.962 * safezoneH + safezoneY;
			w = 0.169271 * safezoneW; 
			h = 0.0046296 * safezoneH; 
			sizeEx = 1 * GUI_GRID_H;
		};
	};   
};

class RscBuffUiArea
{
	idd=24035;
	onLoad="uiNamespace setVariable ['RscBuffUiArea', _this select 0];";
	onUnload="uiNamespace setVariable ['RscBuffUiArea', displayNull]";
	duration=999999;
	class controls{};
};

class SunriseNotification
{
	idd=24500;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="SunriseNotification";
	onLoad="uiNamespace setVariable ['SunriseNotification',_this select 0]";
	onUnload = "uiNamespace setVariable ['SunriseNotification', objNull]";
	onDestroy = "uiNamespace setVariable ['SunriseNotification', objNull]";
	objects[]={};
	
	class controls
	{
		class message1: RscStructuredText
		{
			idc = 24501;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
			//["0.990934 * safezoneW + safezoneX","0.7828 * safezoneH + safezoneY","0.23625 * safezoneW","0.028 * safezoneH"]
		};
		class message2: RscStructuredText
		{
			idc = 24502;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class message3: RscStructuredText
		{
			idc = 24503;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.7212 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class message4: RscStructuredText
		{
			idc = 24504;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.6904 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class message5: RscStructuredText
		{
			idc = 24505;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.6596 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
	};   
};

class RscNewUiMessageArea
{
	idd=24034;
	onLoad="uiNamespace setVariable ['RscNewUiMessageArea', _this select 0];";
	onUnload="uiNamespace setVariable ['RscNewUiMessageArea', displayNull]";
	duration=999999;
	class controls{};
};
class RscNewUiMessageChatArea
{
	idd=24036;
	onLoad="uiNamespace setVariable ['RscNewUiMessageChatArea', _this select 0];";
	onUnload="uiNamespace setVariable ['RscNewUiMessageChatArea', displayNull]";
	duration=999999;
	class controls{};
};

class SunriseHint
{
	idd=24800;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="SunriseHint";
	onLoad="uiNamespace setVariable ['SunriseHint',_this select 0]";
	onUnload = "uiNamespace setVariable ['SunriseHint', objNull]";
	onDestroy = "uiNamespace setVariable ['SunriseHint', objNull]";
	objects[]={};

	class controls
	{
		class hint_message: RscStructuredText
		{
			idc = 24801;
			text = "<t size='1' align='left'>+2 item of smthi??</t>"; //--- ToDo: Localize;
			x = 0.855781 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.33 * safezoneH;
			//[0.855781 * safezoneW + safezoneX,0.159 * safezoneH + safezoneY,0.139219 * safezoneW,0.33 * safezoneH]
			colorBackground[] = {0,0,0,1};
		};		
		class hint_top: RscText
		{
			idc = 24803;
			x = 0.855781 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
			//[0.855781 * safezoneW + safezoneX,0.126 * safezoneH + safezoneY,0.139219 * safezoneW,0.033 * safezoneH]
			colorBackground[] = {0,0,0,1};
		};
		class hint_icon: RscPicture
		{
			idc = 24802;
			text = "\Sunrise_gui\data\gui_newmessage.paa";
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.1018 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
			//[0.9125 * safezoneW + safezoneX,0.1018 * safezoneH + safezoneY,0.0309375 * safezoneW,0.055 * safezoneH]
		};
	};   
};

class SunriseBottomNotification
{
	idd=24900;
	movingEnable=0;
	fadein=1;
	duration = 4;
	fadeout=1;
	name="SunriseBottomNotification";
	onLoad="uiNamespace setVariable ['SunriseBottomNotification',_this select 0]";
	onUnload = "uiNamespace setVariable ['SunriseBottomNotification', objNull]";
	onDestroy = "uiNamespace setVariable ['SunriseBottomNotification', objNull]";
	objects[]={};

	class controls
	{
		class message: RscStructuredText
		{
			idc = 24901;
			text = ""; //--- ToDo: Localize;
			x = 0.0104375 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.084 * safezoneH;
			//["0.0104375 * safezoneW + safezoneX","0.29 * safezoneH + safezoneY","0.242812 * safezoneW","0.084 * safezoneH"]
			
			//[0.345312 * safezoneW + safezoneX,0.775 * safezoneH + safezoneY,0.309375 * safezoneW,0.0792 * safezoneH]
			colorText[] = {0,0,0,1};
			colorBackground[] = {0.188,0.188,0.212,0.75};
		};
		class tile: RscText
		{
			idc = 24902;
			text = ""; //--- ToDo: Localize;
			x = 0.0104375 * safezoneW + safezoneX;
			y = 0.2816 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.009 * safezoneH;
			//["0.0104375 * safezoneW + safezoneX","0.2816 * safezoneH + safezoneY","0.242812 * safezoneW","0.009 * safezoneH"]
			
			//[0.345312 * safezoneW + safezoneX,0.76378 * safezoneH + safezoneY,0.309375 * safezoneW,0.011 * safezoneH]
			colorText[] = {0,0,0,1};
			colorBackground[] = {0.188,0.188,0.212,0.75};
		};		
	};   
};

class SunriseBuffs
{
	idd=24600;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="SunriseBuffs";
	onLoad="uiNamespace setVariable ['SunriseBuffs',_this select 0]";
	onUnload = "uiNamespace setVariable ['SunriseBuffs', objNull]";
	onDestroy = "uiNamespace setVariable ['SunriseBuffs', objNull]";
	objects[]={};

	class controls {
    class debuff1_icon_r: RscPicture {
        idc = 24601;
        text = "";
        x = 0.802438 * safezoneW + safezoneX;
		y = 0.864 * safezoneH + safezoneY;
		w = 0.021 * safezoneW;
		h = 0.0392 * safezoneH;
		colorBackground[] = {1,1,1,0};
		sizeEx = 1;
    };
    class debuff1_icon: debuff1_icon_r {
        idc = 24601 + 10;
    };

    class debuff1_time
	{
		type=0;
		idc = 24601+20;
		style=0;
		x = 0.801876 * safezoneW + safezoneX;
		y = 0.84 * safezoneH + safezoneY;
		w = 0.0218436 * safezoneW;
		h = 0.0206 * safezoneH;
		sizeEx=0.025;
		size=1;
		font="PuristaLight";
		colorBackground[]={0,0,0,0};
		colorText[] = { 1 , 1 , 1 , 1 };
		shadow=true;
		text="";
	};

    class debuff2_icon_r: debuff1_icon_r {
        idc = 24602;
        x = 0.776188 * safezoneW + safezoneX;
    };
    class debuff2_icon: debuff2_icon_r {
        idc = 24602 + 10;
    };
    class debuff2_time: debuff1_time {
        idc = 24602 + 20;
        x = 0.775624 * safezoneW + safezoneX;
    };
    class debuff3_icon_r: debuff1_icon_r {
        idc = 24603;
        x = 0.749937 * safezoneW + safezoneX;
    };
    class debuff3_icon: debuff3_icon_r {
        idc = 24603 + 10;
    };
    class debuff3_time: debuff1_time {
        idc = 24603 + 20;
        x = 0.749372 * safezoneW + safezoneX;
    };
    class debuff4_icon_r: debuff1_icon_r {
        idc = 24604;
        x = 0.723688 * safezoneW + safezoneX;
    };
    class debuff4_icon: debuff4_icon_r {
        idc = 24604 + 10;
    };
    class debuff4_time: debuff1_time {
        idc = 24604 + 20;
        x = 0.725124 * safezoneW + safezoneX;
    };
    class debuff5_icon_r: debuff1_icon_r {
        idc = 24605;
        x = 0.697437 * safezoneW + safezoneX;
    };
    class debuff5_icon: debuff5_icon_r {
        idc = 24605 + 10;
    };
    class debuff5_time: debuff1_time {
        idc = 24605 + 20;
        x = 0.697154 * safezoneW + safezoneX;
    };

	//buffs
    class buff1_icon_r: RscPicture {
        idc = 24701;
        text = "";
        x = 0.802438 * safezoneW + safezoneX;
        y = 0.9116 * safezoneH + safezoneY;
        w = 0.021 * safezoneW;
        h = 0.0392 * safezoneH;
        sizeEx = 1;
    };
    class buff1_icon: buff1_icon_r {
        idc = 24701 + 10;
    };

    class buff1_time
	{
		type=0;
		idc = 24701 + 20;
		style=0;
		x = 0.802906 * safezoneW + safezoneX;
		y = 0.9542 * safezoneH + safezoneY;
		w = 0.0208123 * safezoneW;
		h = 0.0206 * safezoneH;
		sizeEx=0.025;
		size=1;
		font="PuristaLight";
		colorBackground[]={0,0,0,0};
		colorText[] = { 1 , 1 , 1 , 1 };
		shadow=true;
		text="";
	};

    class buff2_icon_r: buff1_icon_r {
        idc = 24702;
        x = 0.776188 * safezoneW + safezoneX;
    };
    class buff2_icon: buff2_icon_r {
        idc = 24702 + 10;
    };
    class buff2_time: buff1_time {
        idc = 24702 + 20;
        x = 0.776655 * safezoneW + safezoneX;
    };

    class buff3_icon_r: buff1_icon_r {
        idc = 24703;
        x = 0.749937 * safezoneW + safezoneX;
    };
    class buff3_icon: buff3_icon_r {
        idc = 24703 + 10;
    };
    class buff3_time: buff1_time {
        idc = 24703 + 20;
        x = 0.749654 * safezoneW + safezoneX;
    };

    class buff4_icon_r: buff1_icon_r {
        idc = 24704;
        x = 0.723688 * safezoneW + safezoneX;
    };
    class buff4_icon: buff4_icon_r {
        idc = 24704 + 10;
    };
    class buff4_time: buff1_time {
        idc = 24704 + 20;
        x = 0.723405 * safezoneW + safezoneX;
    };

    class buff5_icon_r: buff1_icon_r {
        idc = 24705;
        x = 0.697437 * safezoneW + safezoneX;
    };
    class buff5_icon: buff5_icon_r {
        idc = 24705 + 10;
    };
    class buff5_time: buff1_time {
        idc = 24705 + 20;
        x = 0.697157 * safezoneW + safezoneX;
    };
};
};
