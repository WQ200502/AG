class RscNewUiMessageChat: RscControlsGroupNoScrollbars
{
	idc=-1;
	x=0;
	y=0;
	w="475 * pixelW";
	h="20 * pixelH";
	fade=1;
	class controls
	{
		class Background: RscExtremoGui_HudBG
		{
			idc=100;
			x=0;
			y=0;
			w="475 * pixelW";
			h="15 * pixelH";
			//colorBackground[]={"19/255","22/255","27/255",0.80000001};
		};
		class Stripe: RscText
		{
			idc=101;
			x=0;
			y=0;
			w="5 * pixelW";
			h="15 * pixelH";
			colorBackground[]=
			{
				"199/255",
				"38/255",
				"81/255",
				1
			};
		};
		class Text: RscStructuredText
		{
			idc=102;
			text="<t size='22' font='PuristaMedium'>Building disallowed!</t><br/><t color='#ff979ba1' size='19' font='PuristaLight'>Concrete mixer is nearby.</t>";
			x="10 * pixelW";
			y=0;
			w="(475 - 10) * pixelW";
			h="15 * pixelH";
			size="1 * pixelH";
			shadow=0;
			colorBackground[]={0,0,0,0};
			class Attributes
			{
				shadow=0;
			};
		};
	};
};