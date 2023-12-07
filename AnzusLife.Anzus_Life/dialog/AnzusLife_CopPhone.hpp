class AnzusLife_CopPhone
{
  idd = 199311;
  name = "AnzusLife_CopPhone";
  movingEnable = 0;
  enableSimulation = 1;
  class controlsBackground
  {
    class AnzusLife_Background: AnzusLife_PhoneRscPicture
    {
      idc = -1;
      text = "\AnzusLifeCore\images\phone\background.paa";
      x = 0.318499 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
    };
  };
  class controls
  {
    class AnzusLife_ConvictionLog_Background : AnzusLife_PhoneRscPicture
    {
          idc = 1210001;
          text = "\AnzusLifeCore\images\phone\backgrounds\appbackground.paa";
          x = 0.3185 * safezoneW + safezoneX;
          y = 0.159 * safezoneH + safezoneY;
          w = 0.360937 * safezoneW;
          h = 0.638 * safezoneH;
    };
    class AnzusLife_ConvictionLog_SuspectName : AnzusLife_PhoneRscEdit
    {
          idc = 1210002;
          x = 0.42575 * safezoneW + safezoneX;
          y = 0.269 * safezoneH + safezoneY;
          w = 0.148542 * safezoneW;
          h = 0.0374074 * safezoneH;
          text = "";
    };
    class AnzusLife_ConvictionLog_TimeOfArrest : AnzusLife_PhoneRscEdit
    {
          idc = 1210003;
          x = 0.425208 * safezoneW + safezoneX;
          y = 0.334074 * safezoneH + safezoneY;
          w = 0.148542 * safezoneW;
          h = 0.0374074 * safezoneH;
          text = "";
    };
    class AnzusLife_ConvictionLog_ListOfCharges : AnzusLife_PhoneRscEdit
    {
          idc = 1210004;
          x = 0.425781 * safezoneW + safezoneX;
          y = 0.39637 * safezoneH + safezoneY;
          w = 0.148021 * safezoneW;
          h = 0.142037 * safezoneH;
          text = "";
    };
    class AnzusLife_ConvictionLog_SentencingLength : AnzusLife_PhoneRscEdit
    {
          idc = 1210005;
          x = 0.425729 * safezoneW + safezoneX;
          y = 0.560556 * safezoneH + safezoneY;
          w = 0.148542 * safezoneW;
          h = 0.0374074 * safezoneH;
          text = "";
    };
    class AnzusLife_ConvictionLog_PleaDealTime : AnzusLife_PhoneRscEdit
    {
          idc = 1210006;
          x = 0.42575 * safezoneW + safezoneX;
          y = 0.617526 * safezoneH + safezoneY;
          w = 0.148021 * safezoneW;
          h = 0.0364815 * safezoneH;
          text = "";
    };
    class AnzusLife_ConvictionLog_AssistingOfficers : AnzusLife_PhoneRscEdit  
    {
          idc = 1210007;
          x = 0.425 * safezoneW + safezoneX;
          y = 0.675 * safezoneH + safezoneY;
          w = 0.148542 * safezoneW; 
          h = 0.0374074 * safezoneH;
          text = "";
    };
    class AnzusLife_ConvictionLog_SubmitButton : AnzusLife_PhoneIconControlButton
    {
          idc = 1210008;
          x = 0.45052 * safezoneW + safezoneX;
          y = 0.720371 * safezoneH + safezoneY;
          w = 0.105834 * safezoneW;
          h = 0.0281481 * safezoneH;
          onButtonClick = "[] call anzus_fnc_convictionLog;";
    };
  };
};