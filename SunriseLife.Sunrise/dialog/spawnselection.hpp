class SunriseDialogSpawnSelection {
   idd = 38500;
   name = "SunriseDialogSpawnSelection";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class MainBackground : RscText
       {
           colorBackground[] = { 0, 0, 0, 0.8 };
           idc = -1;
           x = 0.173125 * safezoneW + safezoneX;
           y = 0.154647550776583 * safezoneH + safezoneY;
           w = 0.63625 * safezoneW;
           h = 0.633882915173238 * safezoneH;
       };
       class MapView : RscMapControl
       {
           idc = 38502;
           x = 0.395 * safezoneW + safezoneX;
           y = 0.157037037037037 * safezoneH + safezoneY;
           w = 0.4125 * safezoneW;
           h = 0.627909199522103 * safezoneH;
           maxsatellitealpha = 0.75;
           alphafadestartscale = 1.15;
           alphafadeendscale = 1.29;
       };
   };
   class controls
   {
       class SpawnPointList : RscListNBox
       {
           idc = 38510;
           text = "";
           sizeex = 0.041;
		   coloumns[] = {0,0,0.9};
           drawsidearrows = false;
           idcleft = -1;
           idcright = -1;
           rowheight = 0.055;
		   
           x = 0.175 * safezoneW + safezoneX;
           y = 0.157037037037037 * safezoneH + safezoneY;
           w = 0.218125 * safezoneW;
           h = 0.517992831541219 * safezoneH;
           onlbselchanged = "_this call SunriseClient_spawn_PointSelected;";
       };
       class spawnButton : RscExtremoGui_ButtonGreen
       {
           idc = -1;
           text = "Появиться";
           onbuttonclick = "[] spawn SunriseClient_spawn_Confirm";
           x = 0.175 * safezoneW + safezoneX;
           y = 0.677783751493429 * safezoneH + safezoneY;
           w = 0.218125 * safezoneW;
           h = 0.05 * safezoneH;   
		};
       class closeButton : RscExtremoGui_ButtonRed
       {
           idc = -1;
           text = "Выход";
           onbuttonclick = "life_is_cancel= false;[] call BIS_fnc_endMission; closeDialog 0;";
           x = 0.175 * safezoneW + safezoneX;
           y = 0.733225806451613 * safezoneH + safezoneY;
           w = 0.218125 * safezoneW;
           h = 0.05 * safezoneH;  
		};
   };
};