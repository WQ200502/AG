class Help_MainMenu
{
   idd = 5000;
   duration = 1e+009;
   onLoad = "uiNamespace setVariable ['Help_MainMenu', _this select 0]; [] spawn ANZUS_fnc_init_HelpGui;";
   movingEnable = false;
   enableSimulation = true;

   class controlsBackground
   {

     class BackgroundGreen: life_RscText
     {
     	idc = 10;
     	x = 0.29375 * safezoneW + safezoneX;
     	y = 0.225 * safezoneH + safezoneY;
     	w = 0.4125 * safezoneW;
     	h = 0.022 * safezoneH;
     	colorBackground[] = {0,0.306,1,1};
     };
     class BackgroundBlack: life_RscText
     {
     	idc = -1;
     	x = 0.29375 * safezoneW + safezoneX;
     	y = 0.247 * safezoneH + safezoneY;
     	w = 0.4125 * safezoneW;
     	h = 0.528 * safezoneH;
     	colorBackground[] = {0,0,0,0.6};
     };

   }

   class Controls
   {

    class TopText: life_RscStructuredText
    {
     idc = 101;
     text = "<t font='RobotoCondensed' align='left'>Left text</t>  <t font='RobotoCondensed' align='center'>Center text</t> <t font='RobotoCondensed' align='right'>Right text</t>";
     x = 0.29375 * safezoneW + safezoneX;
     y = 0.225 * safezoneH + safezoneY;
     w = 0.407344 * safezoneW;
     h = 0.022 * safezoneH;
     colorBackground[] = {-1,-1,-1,0};
     tooltip = "";
    };
    class TitleText: life_RscStructuredText
    {
    	idc = 102;
    	text = "<t font='RobotoCondensedBold' size='1.75' align='center'>Help, Information &amp;  FAQ</t><br /><t font='RobotoCondensed' align='center'>Click on a topic to view more details</t>";
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.077 * safezoneH;
    	colorBackground[] = {-1,-1,-1,0};
    };
    class randomControlGroup: Life_RscControlsGroup
    {
    idc = -1;
    x = 0.402031 * safezoneW + safezoneX;
    y = 0.324 * safezoneH + safezoneY;
    w = 0.299062 * safezoneW;
    h = 0.44 * safezoneH;
    class Controls
    {
      class TopicInformation: life_RscStructuredText
      {
      	idc = 103;
      	x = 0;
      	y = 0;
      	w = 0.299062 * safezoneW;
      	h = 0.44 * safezoneH;
      	colorBackground[] = {-1,-1,-1,0.3};
      };
    };
    };

    class TopicListbox: asaayu_RscListBox_topics
    {
    	idc = 104;
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.0979687 * safezoneW;
    	h = 0.44 * safezoneH;
    	colorBackground[] = {-1,-1,-1,0.3};
    };

   };
};
