class SR_ctrlDefault
{
	access=0;
	idc=-1;
	style=0;
	default=0;
	show=1;
	fade=0;
	blinkingPeriod=0;
	deletable=0;
	x=0;
	y=0;
	w=0;
	h=0;
	tooltip="";
	tooltipMaxWidth=0.5;
	tooltipColorShade[]={0,0,0,1};
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={0,0,0,0};
	class ScrollBar
	{
		width=0;
		height=0;
		scrollSpeed=0.059999999;
		arrowEmpty="\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull="\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border="\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb="\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[]={1,1,1,1};
	};
};
class SR_ctrlStatic: SR_ctrlDefault
{
	idc=-1;
	type=0;
	colorBackground[]={0,0,0,0};
	text="";
	lineSpacing=1;
	fixedWidth=0;
	colorText[]={1,1,1,1};
	colorShadow[]={0,0,0,1};
	moving=0;
	autoplay=0;
	loops=0;
	tileW=1;
	tileH=1;
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onVideoStopped="";
	sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	font="RobotoCondensedLight";
	shadow=1;
};
class SR_ctrlStaticPictureKeepAspect: SR_ctrlStatic
{
	style="0x30 + 0x800";
};
class SR_ctrlStaticBackgroundDisableTiles: SR_ctrlStatic
{
	style=144;
	x=-4;
	y=-2;
	w=8;
	h=4;
	text="\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
	tileW="8 / (32 * pixelW)";
	tileH="4 / (32 * pixelH)";
	colorText[]={1,1,1,0.050000001};
};
class SR_ctrlProgress: SR_ctrlDefault
{
	type=8;
	colorBar[]=
	{
		"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])", 
		"(profilenamespace getvariable ['GUI_V3_BTBG_G',0])", 
		"(profilenamespace getvariable ['GUI_V3_BTBG_B',0])",
		"1"
	};
	colorFrame[]={0,0,0,0};
	texture="#(argb,8,8,3)color(1,1,1,1)";
	onCanDestroy="";
	onDestroy="";
};

class SR_displayInit
{
	idd=999210;
	onLoad="['onLoad', _this] call SunriseClient_init_loadingScreen; uiNamespace setVariable ['SR_displayInit',_this select 0];";
	onUnload="['onUnload', _this] call SunriseClient_init_loadingScreen";
	blockEscape=1;
	movingEnable=1;
	enableSimulation=0;
	enableDisplay=1;
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
        /*class MapView : RscMapControl
        {
           idc = -1;38502
           x = 0.395 * safezoneW + safezoneX;
           y = 0.157037037037037 * safezoneH + safezoneY;
           w = 0.4125 * safezoneW;
           h = 0.627909199522103 * safezoneH;
           maxsatellitealpha = 0.75;
           alphafadestartscale = 1.15;
           alphafadeendscale = 1.29;
       };*/
    };
	class Controls
	{
		class spawnButton : RscExtremoGui_ButtonGreen
		{
			idc = 16;			
			text = "$STR_Spawn_Spawn";
			sizeEx = 0.85 * GUI_GRID_H;

            x = 0.175 * safezoneW + safezoneX;
            y = 0.677783751493429 * safezoneH + safezoneY;
            w = 0.218125 * safezoneW;
            h = 0.05 * safezoneH;
			
			onButtonClick = "[] spawn SunriseClient_spawn_Confirm";
			show = "false";
		};
        class SpawnPointList: RscListNBox
		{
			idc = 15;
			style = 1;
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

			onLBSelChanged = "_this spawn SunriseClient_spawn_PointSelected;";
			show = "false";
		};

		class Logo: SR_ctrlStaticPictureKeepAspect
		{
			idc=10;
			x="0.25 * safezoneW + safezoneX";
			y="0.3125 * safezoneH + safezoneY";
			w="0.5 * safezoneW";
			h="0.25 * safezoneH";
		};
		class ProgressBarBackground: SR_ctrlStatic
		{
			idc=11;
			x="safezoneX";
			y="safezoneY + safezoneH - (3 * (pixelH * pixelGrid * 0.50))";
			w="safezoneW";
			h="3 * (pixelH * pixelGrid * 0.50)";
			colorBackground[]={0.2,0.2,0.2,0.9};
		};
		class ProgressBarBackgroundStriped: SR_ctrlStaticBackgroundDisableTiles
		{
			idc=12;
			x="safezoneX";
			y="safezoneY + safezoneH - (3 * (pixelH * pixelGrid * 0.50))";
			w="safezoneW";
			h="3 * (pixelH * pixelGrid * 0.50)";
		};
		class ProgressBar: SR_ctrlProgress
		{
			idc=13;
			x="safezoneX";
			y="safezoneY + safezoneH - (3 * (pixelH * pixelGrid * 0.50))";
			w="safezoneW";
			h="3 * (pixelH * pixelGrid * 0.50)";
		};
		class InitStateText: SR_ctrlStatic
		{
			idc=14;
			text="ЗАГРУЗКА ДАННЫХ...";
			sizeEx="11 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
			x="safezoneX + (2 * (pixelW * pixelGrid * 0.50))";
			y="(safezoneY + safezoneH) - (11 * (1 / (getResolution select 3)) * pixelGrid * 0.5) - (5 * (pixelH * pixelGrid * 0.50))";
			h="11 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
			w="safezoneW";
			shadow=0.6;
			font="RobotoCondensedBold";
		};

	};
};
