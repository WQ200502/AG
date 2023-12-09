#include "3den_rsc.hpp"
// BIS
class ctrlDefault {
	access = 0;
	idc = -1;
	style = ST_LEFT;
	default = 0;
	show = 1;
	fade = 0;
	blinkingPeriod = 0;
	deletable = 0;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	tooltip = "";
	tooltipMaxWidth = 0.5;
	tooltipColorShade[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {0,0,0,0};
	class ScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.06;
		arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[] = {1,1,1,1};
	};
};
class ctrlControlsGroup: ctrlDefault
{
	type = CT_CONTROLS_GROUP;
	style = ST_MULTI;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	class VScrollBar: ScrollBar
	{
		width = 2 * GRID_W;
		height = 0;
		autoScrollEnabled = 0;
		autoScrollDelay = 1;
		autoScrollRewind = 1;
		autoScrollSpeed = 1;
	};
	class HScrollBar: ScrollBar
	{
		width = 0;
		height = 2 * GRID_H;
	};
	onCanDestroy = "";
	onDestroy = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
};
class ctrlDefaultText: ctrlDefault
{
	sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	font = "RobotoCondensedLight";
	shadow = 1;
};
class ctrlCheckbox: ctrlDefault
{
	type = CT_CHECKBOX;
	checked = 0;
	color[] = {1,1,1,0.7};
	colorFocused[] = {1,1,1,1};
	colorHover[] = {1,1,1,1};
	colorPressed[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0,0,0};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackgroundHover[] = {0,0,0,0};
	colorBackgroundPressed[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	textureChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureFocusedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureFocusedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureHoverChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureHoverUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	texturePressedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	texturePressedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureDisabledChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureDisabledUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	soundClick[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEnter[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundEscape[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onCheckedChanged = "";
};
class ctrlCheckboxBaseline: ctrlCheckbox
{
	textureChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureFocusedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureFocusedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureHoverChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureHoverUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	texturePressedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	texturePressedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureDisabledChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureDisabledUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
};
class ctrlDefaultButton: ctrlDefaultText
{
	soundClick[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEnter[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundEscape[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
};
class ctrlActiveText: ctrlDefaultButton
{
	type = CT_ACTIVETEXT;
	text = "";
	color[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		0.75
	};
	colorActive[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onButtonClick = "";
	onButtonDown = "";
	onButtonUp = "";
};
class ctrlActivePicture: ctrlActiveText
{
	style = ST_MULTI + ST_TITLE_BAR;
	color[] = {1,1,1,1};
};

class ctrlStatic: ctrlDefaultText
{
	type = CT_STATIC;
	colorBackground[] = {0,0,0,0};
	text = "";
	lineSpacing = 1;
	fixedWidth = 0;
	colorText[] = {1,1,1,1};
	colorShadow[] = {0,0,0,1};
	moving = 0;
	autoplay = 0;
	loops = 0;
	tileW = 1;
	tileH = 1;
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onVideoStopped = "";
};
class ctrlControlsGroupNoScrollbars: ctrlControlsGroup
{
	class VScrollbar: VScrollBar
	{
		width = 0;
	};
	class HScrollbar: HScrollBar
	{
		height = 0;
	};
};
class ctrlStructuredText: ctrlDefaultText
{
	type = CT_STRUCTURED_TEXT;
	colorBackground[] = {0,0,0,0};
	size = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	text = "";
	class Attributes
	{
		align = "left";
		color = "#ffffff";
		colorLink = "";
		size = 1;
		font = "RobotoCondensedLight";
	};
	onCanDestroy = "";
	onDestroy = "";
};

class ctrlStaticPicture: ctrlStatic
{
	style = ST_MULTI + ST_TITLE_BAR;
};
class ctrlStaticPictureKeepAspect: ctrlStaticPicture
{
	style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class ctrlStaticPictureTile: ctrlStatic
{
	style = ST_MULTI + ST_HUD_BACKGROUND;
};
class ctrlStaticFrame: ctrlStatic
{
	style = ST_FRAME;
};
class ctrlStaticLine: ctrlStatic
{
	style = ST_MULTI + ST_TITLE_BAR + ST_HUD_BACKGROUND;
};
class ctrlStaticMulti: ctrlStatic
{
	style = ST_MULTI + ST_NO_RECT;
};
class ctrlStaticBackground: ctrlStatic
{
	colorBackground[] = {0.2,0.2,0.2,1};
};
class ctrlStaticOverlay: ctrlStatic
{
	colorBackground[] = {0,0,0,0.5};
};
class ctrlStaticTitle: ctrlStatic
{
	moving = 1;
	colorBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[] = {1,1,1,1};
};
class ctrlStaticFooter: ctrlStatic
{
	colorBackground[] = {0,0,0,0.3};
};
class ctrlStaticBackgroundDisable: ctrlStatic
{
	x = -4;
	y = -2;
	w = 8;
	h = 4;
	colorBackground[] = {1,1,1,0.5};
};
class ctrlStaticBackgroundDisableTiles: ctrlStaticPictureTile
{
	x = -4;
	y = -2;
	w = 8;
	h = 4;
	text = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
	tileW = "8 / (32 * pixelW)";
	tileH = "4 / (32 * pixelH)";
	colorText[] = {1,1,1,0.05};
};
class ctrlButton: ctrlDefaultButton
{
	type = CT_BUTTON;
	style = ST_CENTER + ST_FRAME + ST_HUD_BACKGROUND;
	colorBackground[] = {0,0,0,1};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorBackgroundActive[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorFocused[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	font = "PuristaLight";
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	borderSize = 0;
	colorBorder[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = "pixelW";
	offsetPressedY = "pixelH";
	period = 0;
	periodFocus = 2;
	periodOver = 0.5;
	class KeyHints
	{
		class A
		{
			key = "0x00050000 + 0";
			hint = "KEY_XBOX_A";
		};
	};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onButtonClick = "";
	onButtonDown = "";
	onButtonUp = "";
};
class ctrlButtonPicture: ctrlButton
{
	style = ST_CENTER + ST_MULTI + ST_TITLE_BAR;
};
class ctrlButtonPictureKeepAspect: ctrlButton
{
	style = ST_CENTER + ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class ctrlButtonOK: ctrlButton
{
	default = 1;
	idc = 1;
	text = "ÐžÐš";
};
class ctrlButtonCancel: ctrlButton
{
	idc = 2;
	text = "ÐžÑ‚Ð¼ÐµÐ½Ð°";
};
class ctrlButtonClose: ctrlButtonCancel
{
	text = "Ð—Ð°ÐºÑ€Ñ‹Ñ‚ÑŒ";
};
class ctrlButtonToolbar: ctrlButtonPictureKeepAspect
{
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
};
class ctrlButtonSearch: ctrlButton
{
	style = ST_CENTER + ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
	text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
	textSearch = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
	tooltip = "ÐŸÐ¾Ð¸ÑÐº";
};
class ctrlButtonExpandAll: ctrlButtonToolbar
{
	style = ST_CENTER + ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
	text = "\a3\3DEN\Data\Displays\Display3DEN\tree_expand_ca.paa";
	tooltip = "Ð Ð°Ð·Ð²ÐµÑ€Ð½ÑƒÑ‚ÑŒ Ð²ÑÐµ";
};
class ctrlButtonCollapseAll: ctrlButtonToolbar
{
	style = ST_CENTER + ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
	text = "\a3\3DEN\Data\Displays\Display3DEN\tree_collapse_ca.paa";
	tooltip = "Ð¡Ð²ÐµÑ€Ð½ÑƒÑ‚ÑŒ Ð²ÑÐµ";
};
class ctrlButtonFilter: ctrlButton
{
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {1,1,1,0.3};
	colorFocused[] = {0,0,0,0};
};
class ctrlEdit: ctrlDefaultText
{
	type = CT_EDIT;
	colorBackground[] = {0,0,0,0.5};
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelection[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	canModify = 1;
	autocomplete = "";
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
};
class ctrlEditMulti: ctrlEdit
{
	style = ST_MULTI;
};
class ctrlSliderV: ctrlDefault
{
	type = CT_SLIDER;
	style = SL_VERT;
	color[] = {0,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorActive[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	sliderRange[] = {0,1};
	sliderPosition = 1;
	lineSize = 0.1;
	pageSize = 3;
	class Title
	{
		idc = -1;
		colorBase[] = {1,1,1,1};
		colorActive[] =
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	class Value
	{
		idc = -1;
		format = "%.f";
		type = CT_STATIC;
		colorBase[] = {1,1,1,1};
		colorActive[] =
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onSliderPosChanged = "";
};
class ctrlSliderH: ctrlSliderV
{
	style = SL_HORZ;
};
class ctrlCombo: ctrlDefaultText
{
	type = CT_COMBO;
	style = ST_MULTI + ST_NO_RECT;
	colorBackground[] = {0.05,0.05,0.05,1};
	colorSelectBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelect[] = {0,0,0,1};
	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {1,1,1,0.25};
	colorSelect2Right[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmpty_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowFull_ca.paa";
	wholeHeight = 12 * 5 * GRID_H;
	maxHistoryDelay = 1;
	soundExpand[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	class ComboScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01;
		arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[] = {1,1,1,1};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onLBSelChanged = "";
};
class ctrlComboToolbar: ctrlCombo
{
	colorBackground[] = {0.05,0.05,0.05,1};
	colorSelectBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
	wholeHeight = 12 * 5 * GRID_H;
};
class ctrlListbox: ctrlDefaultText
{
	type = CT_LISTBOX;
	style = LB_TEXTURES;
	colorBackground[] = {0,0,0,0.5};
	colorSelectBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorSelectBackground2[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorShadow[] = {0,0,0,0.5};
	colorDisabled[] = {1,1,1,0.25};
	colorText[] = {1,1,1,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {1,1,1,1};
	colorSelect2Right[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	period = 1;
	rowHeight = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	itemSpacing = 0;
	maxHistoryDelay = 1;
	canDrag = 0;
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	class ListScrollBar: ScrollBar
	{
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onLBSelChanged = "";
	onLBDblClick = "";
	onLBDrag = "";
	onLBDragging = "";
	onLBDrop = "";
};
class ctrlToolbox: ctrlDefaultText
{
	type = CT_TOOLBOX;
	style = ST_CENTER;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	colorTextSelect[] = {1,1,1,1};
	rows = 1;
	columns = 1;
	strings[] = {};
	values[] = {};
	color[] = {1,0,1,1};
	colorSelect[] = {0,0,0,0};
	colorTextDisable[] = {0,0,0,0};
	colorDisable[] = {0,0,0,0};
	colorSelectedBg[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onToolBoxSelChanged = "";
};
class ctrlToolboxPicture: ctrlToolbox
{
	style = ST_CENTER + ST_MULTI + ST_TITLE_BAR;
};
class ctrlToolboxPictureKeepAspect: ctrlToolbox
{
	style = ST_CENTER + ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class ctrlCheckboxes: ctrlDefaultText
{
	type = CT_CHECKBOXES;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	colorTextSelect[] = {1,1,1,1};
	rows = 1;
	columns = 1;
	strings[] = {};
	checked_strings[] = {};
	color[] = {1,0,1,1};
	colorSelect[] = {0,0,0,0};
	colorTextDisable[] = {0,0,0,0};
	colorDisable[] = {0,0,0,0};
	colorSelectedBg[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onCheckBoxesSelChanged = "";
};
class ctrlCheckboxesCheckbox: ctrlCheckboxes
{
	style = ST_MULTI + ST_TITLE_BAR;
	strings[] =
	{
		"\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa"
	};
	checked_strings[] =
	{
		"\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa"
	};
	colorBackground[] = {0,0,0,0};
	colorSelectedBg[] = {0,0,0,0};
};
class ctrlProgress: ctrlDefault
{
	type = CT_PROGRESS;
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	colorBar[] = {1,1,1,1};
	colorFrame[] = {0,0,0,1};
	onCanDestroy = "";
	onDestroy = "";
};
class ctrlHTML: ctrlDefaultText
{
	type = CT_HTML;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	colorBold[] = {1,1,1,0.5};
	colorLink[] = {1,1,1,1};
	colorLinkActive[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorPicture[] = {1,1,1,1};
	colorPictureBorder[] = {0,0,0,0};
	colorPictureLink[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	prevPage = "\a3\3DEN\Data\Controls\CtrlHTML\prevPage_ca.paa";
	nextPage = "\a3\3DEN\Data\Controls\CtrlHTML\nextPage_ca.paa";
	filename = "";
	cycleLinks = 0;
	cycleAllLinks = 0;
	class P
	{
		font = "RobotoCondensedLight";
		fontBold = "RobotoCondensedBold";
		sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H1: P
	{
		sizeEx = "5.58 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H2: P
	{
		sizeEx = "4.86 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H3: P
	{
	};
	class H4: P
	{
	};
	class H5: P
	{
	};
	class H6: P
	{
		font = "RobotoCondensedLight";
		fontBold = "RobotoCondensedLight";
	};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onHTMLLink = "";
};
class ctrlActivePictureKeepAspect: ctrlActiveText
{
	style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class ctrlTree: ctrlDefaultText
{
	type = CT_TREE;
	colorBorder[] = {0,0,0,1};
	colorLines[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	colorSelect[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorMarked[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		0.5
	};
	colorMarkedSelected[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[] = {1,1,1,1};
	colorSelectText[] = {1,1,1,1};
	colorMarkedText[] = {1,1,1,1};
	colorSearch[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	multiselectEnabled = 0;
	expandOnDoubleclick = 1;
	hiddenTexture = "\a3\3DEN\Data\Controls\ctrlTree\hiddenTexture_ca.paa";
	expandedTexture = "\a3\3DEN\Data\Controls\ctrlTree\expandedTexture_ca.paa";
	maxHistoryDelay = 1;
	disableKeyboardSearch = 0;
	class ScrollBar: ScrollBar
	{
		scrollSpeed = 0.05;
	};
	colorDisabled[] = {0,0,0,0};
	colorArrow[] = {0,0,0,0};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onTreeSelChanged = "";
	onTreeLButtonDown = "";
	onTreeDblClick = "";
	onTreeExpanded = "";
	onTreeCollapsed = "";
	onTreeMouseExit = "";
};
class ctrlControlsGroupNoHScrollbars: ctrlControlsGroup
{
	class HScrollbar: HScrollBar
	{
		height = 0;
	};
};
class ctrlControlsGroupNoVScrollbars: ctrlControlsGroup
{
	class VScrollbar: VScrollBar
	{
		width = 0;
	};
};
class ctrlShortcutButton: ctrlDefaultButton
{
	type = CT_SHORTCUTBUTTON;
	style = ST_FRAME + ST_HUD_BACKGROUND;
	colorBackground[] = {0,0,0,1};
	colorBackground2[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundFocused[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundActive[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	text = "";
	size = "4.86 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	shadow = 0;
	color[] = {1,1,1,1};
	color2[] = {1,1,1,1};
	colorFocused[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	period = 1;
	periodFocus = 1;
	periodOver = 0.5;
	shortcuts[] =
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	textureNoShortcut = "#(argb,8,8,3)color(1,1,1,1)";
	class Attributes
	{
		align = "center";
		color = "#ffffff";
		font = "PuristaLight";
		shadow = 0;
	};
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class TextPos
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = 0;
		w = 0;
		h = 0;
	};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onButtonClick = "";
	onButtonDown = "";
	onButtonUp = "";
};
class ctrlShortcutButtonOK: ctrlShortcutButton
{
	default = 1;
	idc = 1;
	text = "ÐžÐš";
};
class ctrlShortcutButtonCancel: ctrlShortcutButton
{
	idc = 2;
	text = "ÐžÑ‚Ð¼ÐµÐ½Ð°";
};
class ctrlShortcutButtonSteam: ctrlShortcutButton
{
	colorBackground[] = {0.0313726,0.721569,0.917647,1};
	textureNoShortcut = "\a3\3DEN\Data\Controls\CtrlShortcutButton\steam_ca.paa";
	class TextPos
	{
		left = 1.5 * 5 * GRID_W;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = 0;
		w = 5 * GRID_W;
		h = 5 * GRID_H;
	};
};
class ctrlXListbox: ctrlDefaultText
{
	type = CT_XLISTBOX;
	style = ST_CENTER + LB_TEXTURES + SL_HORZ;
	color[] = {1,1,1,1};
	colorActive[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[] = {1,1,1,1};
	colorSelect[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	cycle = 1;
	arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onLBSelChanged = "";
	onLBDblClick = "";
};
class ctrlXSliderV: ctrlDefault
{
	type = CT_XSLIDER;
	style = SL_VERT;
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	sliderRange[] = {0,1};
	sliderPosition = 1;
	lineSize = 0.1;
	arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	thumb = "\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
	class Title
	{
		idc = -1;
		colorBase[] = {1,1,1,1};
		colorActive[] =
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	class Value
	{
		idc = -1;
		format = "%.f";
		type = CT_STATIC;
		colorBase[] = {1,1,1,1};
		colorActive[] =
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onSliderPosChanged = "";
};
class ctrlXSliderH: ctrlXSliderV
{
	style = SL_HORZ;
};
class ctrlMenu: ctrlDefaultText
{
	type = 46;
	font = "RobotoCondensedLight";
	colorBorder[] = {0,0,0,0};
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorSelect[] = {0,0,0,1};
	colorSelectBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	colorPictureSelect[] = {0,0,0,1};
	colorPictureDisabled[] = {1,1,1,0.5};
	arrow = "\a3\3DEN\Data\Controls\ctrlMenu\arrow_ca.paa";
	rowHeight = 0;
	itemSpacingW = 0.01;
	itemSpacingH = 0.01;
	pictureCheckboxEnabled = "\a3\3DEN\Data\Controls\CtrlMenu\pictureCheckboxEnabled_ca.paa";
	pictureCheckboxDisabled = "#(argb,8,8,3)color(0,0,0,0)";
	pictureRadioEnabled = "\a3\3DEN\Data\Controls\CtrlMenu\pictureRadioEnabled_ca.paa";
	pictureRadioDisabled = "#(argb,8,8,3)color(0,0,0,0)";
};
class ctrlMenuStrip: ctrlMenu
{
	type = 47;
	colorStripBackground[] = {0,0,0,1};
	colorStripText[] = {1,1,1,1};
	colorStripSelect[] = {0,0,0,1};
	colorStripSelectBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorStripDisabled[] = {1,1,1,0.25};
};
class ctrlMap: ctrlDefault
{
	type = CT_MAP_MAIN;
	style = ST_MULTI + ST_TITLE_BAR;
	x = "safezoneXAbs";
	y = "safezoneY";
	w = "safezoneWAbs";
	h = "safezoneH";
	sizeEx = 0.05;
	font = "RobotoCondensedLight";
	colorText[] = {0,0,0,1};
	moveOnEdges = 1;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 20;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareObj = 9;
	ptsPerSquareForLod1 = 4;
	ptsPerSquareForLod2 = 1;
	ptsPerSquareRoad = 6;
	ptsPerSquareMainRoad = 6;
	ptsPerSquareRoadSimple = 1;
	ptsPerSquareMainRoadSimple = 1;
	drawShaded = 0.25;
	runwayFont = "LCD14";
	scaleMin = 0.0001;
	scaleMax = 1;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 2;
	alphaFadeEndScale = 2;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0.969,0.957,0.949,1};
	colorOutside[] = {0,0,0,1};
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorForestTextured[] = {0.624,0.78,0.388,0.25};
	colorForestBorder[] = {0,0,0,0.5};
	colorRocks[] = {0,0,0,0.3};
	colorRocksBorder[] = {0,0,0,0};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0.8,0.2,0,1};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorInactive[] = {1,1,1,0.5};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorTracksFill[] = {0.84,0.76,0.65,1};
	colorRoads[] = {0.7,0.7,0.7,1};
	colorRoadsFill[] = {1,1,1,1};
	colorMainRoads[] = {0.9,0.5,0.3,1};
	colorMainRoadsFill[] = {1,0.6,0.4,1};
	colorTrails[] = {0.84,0.76,0.65,0.15};
	colorTrailsFill[] = {0.84,0.76,0.65,0.65};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	fontLabel = "RobotoCondensedLight";
	sizeExLabel = 0.05;
	fontGrid = "TahomaB";
	sizeExGrid = 0.02;
	fontUnits = "TahomaB";
	sizeExUnits = 0.05;
	fontNames = "EtelkaNarrowMediumPro";
	sizeExNames = 0.05;
	fontInfo = "RobotoCondensedLight";
	sizeExInfo = 0.05;
	fontLevel = "TahomaB";
	sizeExLevel = 0.02;
	showCountourInterval = 1;
	idcMarkerColor = -1;
	idcMarkerIcon = -1;
	textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	showMarkers = "true";
	class LineMarker
	{
		lineWidthThin = 0.008;
		lineWidthThick = 0.014;
		lineDistanceMin = 3e-005;
		lineLengthMin = 5;
	};
	class Legend
	{
		x = 0.5;
		y = 0.5;
		w = 0.4;
		h = 0.1;
		color[] = {0,0,0,1};
		colorBackground[] = {1,1,1,0.5};
		font = "RobotoCondensedLight";
		sizeEX = "3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class Task
	{
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		color[] = {1,1,1,1};
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		colorCreated[] = {1,1,0,1};
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		colorCanceled[] = {0.7,0.7,0.7,1};
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		colorDone[] = {0.7,1,0.3,1};
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		colorFailed[] = {1,0.3,0.2,1};
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class ActiveMarker
	{
		color[] = {0,0,0,1};
		size = 2;
	};
	class Waypoint
	{
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		importance = 1;
		size = 24;
	};
	class WaypointCompleted: Waypoint
	{
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};
	class CustomMark: Waypoint
	{
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
	};
	class Command: Waypoint
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
	};
	class Bush: Waypoint
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = 0.007;
		size = 7;
	};
	class SmallTree: Bush
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = 0.36;
		size = 12;
	};
	class Tree: SmallTree
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = 0.72;
	};
	class Rock: SmallTree
	{
		color[] = {0.1,0.1,0.1,0.8};
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		importance = 0.3;
	};
	class BusStop: Bush
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
	};
	class FuelStation: Waypoint
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
	};
	class Hospital: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
	};
	class Church: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
	};
	class Lighthouse: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
	};
	class Power: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
	};
	class PowerSolar: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
	};
	class PowerWave: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
	};
	class PowerWind: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
	};
	class Quay: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
	};
	class Transmitter: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
	};
	class Watertower: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
	};
	class Cross: Waypoint
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
	};
	class Chapel: Cross
	{
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
	};
	class Shipwreck: Cross
	{
		icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
	};
	class Bunker: Waypoint
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance = 1.05;
		size = 14;
	};
	class Fortress: Bunker
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance = 1.6;
		size = 16;
	};
	class Fountain: Bunker
	{
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		importance = 0.6;
		size = 11;
	};
	class Ruin: Waypoint
	{
		coefMax = 4;
		coefMin = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		importance = 0.96;
		size = 16;
	};
	class Stack: Waypoint
	{
		coefMax = 2;
		coefMin = 0.4;
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		importance = 1.6;
		size = 16;
	};
	class Tourism: Waypoint
	{
		coefMax = 4;
		coefMin = 0.7;
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		importance = 2.8;
		size = 16;
	};
	class ViewTower: Waypoint
	{
		coefMax = 4;
		coefMin = 0.5;
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		importance = 2;
		size = 16;
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onDraw = "";
};
class ctrlMapEmpty: ctrlMap
{
	ptsPerSquareSea = 1000;
	ptsPerSquareTxt = 1000;
	ptsPerSquareCLn = 1000;
	ptsPerSquareExp = 1000;
	ptsPerSquareCost = 1000;
	ptsPerSquareFor = 1000;
	ptsPerSquareForEdge = 1000;
	ptsPerSquareRoad = 1000;
	ptsPerSquareObj = 1000;
	alphaFadeStartScale = 0;
	alphaFadeEndScale = 0;
	colorBackground[] = {1,1,1,1};
	colorOutside[] = {1,1,1,1};
	colorSea[] = {0,0,0,0};
	colorForest[] = {0,0,0,0};
	colorForestBorder[] = {0,0,0,0};
	colorRocks[] = {0,0,0,0};
	colorRocksBorder[] = {0,0,0,0};
	colorLevels[] = {0,0,0,0};
	colorMainCountlines[] = {0,0,0,0};
	colorCountlines[] = {0,0,0,0};
	colorMainCountlinesWater[] = {0,0,0,0};
	colorCountlinesWater[] = {0,0,0,0};
	colorPowerLines[] = {0,0,0,0};
	colorRailWay[] = {0,0,0,0};
	colorNames[] = {0,0,0,0};
	colorInactive[] = {0,0,0,0};
	colorGrid[] = {0,0,0,0};
	colorGridMap[] = {0,0,0,0};
	class Task: Task
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		iconCreated = "#(argb,8,8,3)color(0,0,0,0)";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "#(argb,8,8,3)color(0,0,0,0)";
		iconFailed = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		colorCreated[] = {0,0,0,0};
		colorCanceled[] = {0,0,0,0};
		colorDone[] = {0,0,0,0};
		colorFailed[] = {0,0,0,0};
		size = 0;
	};
	class Waypoint: Waypoint
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class WaypointCompleted: WaypointCompleted
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class CustomMark: CustomMark
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Command: Command
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Bush: Bush
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Rock: Rock
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class SmallTree: SmallTree
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Tree: Tree
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class busstop: BusStop
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class fuelstation: FuelStation
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class hospital: Hospital
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class church: Church
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class lighthouse: Lighthouse
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class power: Power
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class powersolar: PowerSolar
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class powerwave: PowerWave
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class powerwind: PowerWind
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class quay: Quay
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class shipwreck: Shipwreck
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class transmitter: Transmitter
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class watertower: Watertower
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Bunker: Bunker
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Cross: Cross
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Fortress: Fortress
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Fountain: Fountain
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Chapel: Chapel
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Ruin: Ruin
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Stack: Stack
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Tourism: Tourism
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class ViewTower: ViewTower
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
};
class ctrlMapMain: ctrlMap
{
};
class ctrlListNBox: ctrlDefaultText
{
	type = CT_LISTNBOX;
	style = ST_MULTI;
	colorSelectBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorSelectBackground2[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorShadow[] = {0,0,0,0.5};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	columns[] = {0};
	drawSideArrows = 0;
	idcLeft = -1;
	idcRight = -1;
	period = 1;
	disableOverflow = 0;
	rowHeight = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	maxHistoryDelay = 1;
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	class ListScrollBar: ScrollBar
	{
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onLBSelChanged = "";
	onLBDblClick = "";
};
class ctrlCheckboxToolbar: ctrlCheckbox
{
	color[] = {1,1,1,1};
	colorBackgroundHover[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundPressed[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
};


// BIS
class ScrollBar
{
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class RscScrollBar
{
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class RscButton
{
	deletable = 0;
	fade = 0;	
	type = 1;
	text = "";
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundActive[] = 
	{
		0,
		0,
		0,
		1
	};
	colorFocused[] = 
	{
		0,
		0,
		0,
		1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	idc = -1;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	url = "";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};

class RscControlsGroup
{
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;
	
	class VScrollBar : RscScrollBar
	{
		width = 0.021;
		autoScrollEnabled = 1;
	};
	
	class HScrollBar : RscScrollBar
	{
		height = 0.028;
	};
	
	class Controls {};
};

class RscControlsGroupNoScrollbars : RscControlsGroup
{
	class VScrollbar : VScrollbar {
		width = 0;
	};
	
	class HScrollbar : HScrollbar {
		height = 0;
	};
};

class RscListNBox
{
	style = 16;
	type = 102;
	shadow = 0;
	font = "RobotoCondensed";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0.95,0.95,0.95,1};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.8,0.8,0.8,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
   	colorPictureDisabled[] = {1,1,1,1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	period = 1.2;
	maxHistoryDelay = 0.5;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	rowHeight = 0.04;
	drawSideArrows = 0;
	idcLeft = -1;
	idcRight = -1;
	class ListScrollBar: RscScrollBar{};
	class ScrollBar: RscScrollBar{};
};

class RscText
{
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "RobotoCondensed";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscLine : RscText
{
	idc = -1;
	style = 176;
	x = 0.17;
	y = 0.48;
	w = 0.66;
	h = 0;
	text = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1.0};
};

class RscTitle : RscText 
{
	colorText[] = {0.95, 0.95, 0.95, 1};
};

class RscPicture
{
	shadow = 0;
	type = 0;
	style = 48;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 43.4) * 1)";
	font = "RobotoCondensed";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscStructuredText
{
	type = 13;
	style = 0;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1, 1, 1, 1.0};
	shadow = 1;
	
	class Attributes {
		font = "RobotoCondensed";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};

class RscActiveText
{
	idc = -1;
    type = 11;
    style = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    font = "RobotoCondensed";
    color[] = {1, 1, 1, 1};
    colorActive[] = {1, 0.2, 0.2, 1};
	colorDisabled[] = {1, 0.2, 0.2, 0.4};
    soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
    soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
    action = "";
    text = "";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscShortcutButton
{
	deletable = 0;
	fade = 0;
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	shortcuts[] = 
	{
	};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = 
	{
		1,
		1,
		1,
		1
	};
	colorFocused[] = 
	{
		1,
		1,
		1,
		1
	};
	color2[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorBackgroundFocused[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorBackground2[] = 
	{
		1,
		1,
		1,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	textSecondary = "";
	colorSecondary[] = 
	{
		1,
		1,
		1,
		1
	};
	colorFocusedSecondary[] = 
	{
		1,
		1,
		1,
		1
	};
	color2Secondary[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabledSecondary[] = 
	{
		1,
		1,
		1,
		0.25
	};
	sizeExSecondary = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary = "RobotoCondensed";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	period = 0.4;
	font = "RobotoCondensed";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	url = "";
	action = "";
	class AttributesImage
	{
		font = "RobotoCondensed";
		color = "#E5E5E5";
		align = "left";
	};
};

class RscButtonMenu : RscShortcutButton
{
	idc=-1;
	type=16;
	style="0x02 + 0xC0";
	default=0;
	shadow=0;
	x=0;
	y=0;
	w=0.095588997;
	h=0.039216001;
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]={0,0,0,0.80000001};
	colorBackgroundFocused[]={1,1,1,1};
	colorBackground2[]={0.75,0.75,0.75,1};
	color[]={1,1,1,1};
	colorFocused[]={0,0,0,1};
	color2[]={0,0,0,1};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	textSecondary="";
	colorSecondary[]={1,1,1,1};
	colorFocusedSecondary[]={0,0,0,1};
	color2Secondary[]={0,0,0,1};
	colorDisabledSecondary[]={1,1,1,0.25};
	sizeExSecondary="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary="RobotoCondensed";
	period=1.2;
	periodFocus=1.2;
	periodOver=1.2;
	size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	class TextPos
	{
		left="0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right=0.0049999999;
		bottom=0;
	};
	class Attributes
	{
		font="RobotoCondensed";
		color="#E5E5E5";
		align="left";
		shadow="false";
	};
	class ShortcutPos
	{
		left="5.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top=0;
		w="1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		h="1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.090000004,
		1
	};
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.090000004,
		1
	};
};

class RscProgress
{
	type = 8;
	style = 0;
	x = 0.334585 * safezoneW + safezoneX;
	y = 0.181 * safezoneH + safezoneY;
	w = 0.330831 * safezoneW;
	h = 0.033 * safezoneH;
	texture = "";
	shadow = 1;
	colorFrame[] = {1,1,1,0};
	colorBackground[] = {1,1,1,0.2};
	colorBar[] = {1,1,1,0.9};
};

class RscListBox
{
	style = 16;
	idc = -1;
	type = 5;
	w = 0.275;
	h = 0.04;
	font = "RobotoCondensed";
	colorSelect[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.28,0.28,0.28,0.28};
	colorSelect2[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorScrollbar[] = {0.2, 0.2, 0.2, 1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = {0.7, 0.7, 0.7, 1};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class ListScrollBar: RscScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
	};
};

class RscEdit
{
	type = 2;
	style = 0x00 + 0x40;
	font = "RobotoCondensed";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[] = {0, 0, 0, 0.8};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	autocomplete = 0;
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	canModify = 1;
};

class RscXSliderH
{
	style = 1024;
	type = 43;
	shadow = 2;
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.400000;
	color[] = {
			1, 1, 1, 0.7
	};
	colorActive[] = {
			1, 1, 1, 1
	};
	colorDisabled[] = {
			1, 1, 1, 0.500000
	};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 50) * 1)";
	text = "";
};

class RscMapControl
{	
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] = {0.969,0.957,0.949,1};
	colorOutside[] = {0,0,0,1};
	colorText[] = {0,0,0,1};
	font = "RobotoCondensedBold";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorRocks[] = {0,0,0,0.3};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorForestBorder[] = {0,0,0,0};
	colorRocksBorder[] = {0,0,0,0};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0.8,0.2,0,1};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorInactive[] = {1,1,1,0.5};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorRoads[] = {0.7,0.7,0.7,1};
	colorMainRoads[] = {0.9,0.5,0.3,1};
	colorTracksFill[] = {0.84,0.76,0.65,1};
	colorRoadsFill[] = {1,1,1,1};
	colorMainRoadsFill[] = {1,0.6,0.4,1};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	stickX[] = {0.2,{"Gamma",1,1.5}};
	stickY[] = {0.2,{"Gamma",1,1.5}};
	widthRailWay = 4;

	class LineMarker {
		lineDistanceMin = 3e-005;
		lineLengthMin = 5;
		lineWidthThick = 0.014;
		lineWidthThin = 0.008;
		textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	};

	class Legend
	{
		colorBackground[] = {1,1,1,0.5};
		color[] = {0,0,0,1};
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "RobotoCondensed";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	};
	class ActiveMarker
	{
		color[] = {0.3,0.1,0.9,1};
		size = 50;
	};
	class Command
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task
	{
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class SmallTree
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bush
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = "14/2";
		importance = "0.2 * 14 * 0.05 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Church
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Chapel
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Cross
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Rock
	{
		color[] = {0.1,0.1,0.1,0.8};
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bunker
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fountain
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class ViewTower
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Lighthouse
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Quay
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Fuelstation
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Hospital
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class BusStop
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Transmitter
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Stack
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Ruin
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};
	class Tourism
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
	};
	class Watertower
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Waypoint
	{
		color[] = {0,0,0,1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
	};
	class WaypointCompleted
	{
		color[] = {0,0,0,1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};
	moveOnEdges = 0;//1;
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "SafeZoneWAbs";
	h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001;
	scaleMax = 1;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 0.35;
	alphaFadeEndScale = 0.4;
	fontLabel = "RobotoCondensed";
	sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid = "RobotoCondensedBold";
	sizeExGrid = 0.02;
	fontUnits = "RobotoCondensedBold";
	sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames = "RobotoCondensed";
	sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo = "RobotoCondensed";
	sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel = "RobotoCondensedBold";
	sizeExLevel = 0.02;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	//text = "\a3\ui_f\data\map_background2_co.paa";
	class power
	{
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powersolar
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powerwave
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powerwind
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class shipwreck
	{
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
};

class RscCombo
{
	style = 16;
	type = 4;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0, 0, 0, 1};
	soundExpand[] = {"",0.1,1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	colorBackground[] = {0,0,0,0.8};
	colorSelectBackground[] = {1, 1, 1, 0.7};
	colow_Rscrollbar[] = {1, 0, 0, 1};
	soundSelect[] = {
			"", 0.000000, 1
	};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0, 0, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";	
	class ComboScrollBar : RscScrollBar {};
};

class RscCheckBox
{
	idc = -1;
	type = 77;
	style = 0;
	checked = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	color[] = 
	{
		1,
		1,
		1,
		0.7
	};
	colorFocused[] = 
	{
		1,
		1,
		1,
		1
	};
	colorHover[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPressed[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.2
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundFocused[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundHover[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundPressed[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0
	};
	textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	soundEnter[] = 
	{
		"",
		0.1,
		1
	};
	soundPush[] = 
	{
		"",
		0.1,
		1
	};
	soundClick[] = 
	{
		"",
		0.1,
		1
	};
	soundEscape[] = 
	{
		"",
		0.1,
		1
	};
};
class RscTextCheckBox
{
	idc = -1;
	type = 7;
	style = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	colorText[] = 
	{
		1,
		0,
		0,
		1
	};
	color[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorTextSelect[] = 
	{
		0,
		0.8,
		0,
		1
	};
	colorSelectedBg[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorTextDisable[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	colorDisable[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows = 1;
	columns = 1;
	strings[] = 
	{
		"UNCHECKED"
	};
	checked_strings[] = 
	{
		"CHECKED"
	};
};

class RscTiles: RscControlsGroupNoScrollbars
{
  idc = 115099;
  x = "safezoneX";
  y = "safezoneY";
  w = "safezoneW";
  h = "safezoneH";
  disableCustomColors = 1;

  class Controls
  {

    class TileFrame: RscFrame
    {
      idc = 114999;
      x = 0;
      y = 0;
      w = "safezoneW";
      h = "safezoneH";
      colortext[] = { 0,0,0,1 };
    };

    class Tile_0_0: RscText
    {
      idc = 115000;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_1: RscText
    {
      idc = 115001;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_2: RscText
    {
      idc = 115002;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_3: RscText
    {
      idc = 115003;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_4: RscText
    {
      idc = 115004;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_5: RscText
    {
      idc = 115005;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_0: RscText
    {
      idc = 115010;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_1: RscText
    {
      idc = 115011;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_2: RscText
    {
      idc = 115012;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_3: RscText
    {
      idc = 115013;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_4: RscText
    {
      idc = 115014;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_5: RscText
    {
      idc = 115015;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_0: RscText
    {
      idc = 115020;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_1: RscText
    {
      idc = 115021;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_2: RscText
    {
      idc = 115022;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_3: RscText
    {
      idc = 115023;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_4: RscText
    {
      idc = 115024;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_5: RscText
    {
      idc = 115025;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_0: RscText
    {
      idc = 115030;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_1: RscText
    {
      idc = 115031;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_2: RscText
    {
      idc = 115032;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_3: RscText
    {
      idc = 115033;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_4: RscText
    {
      idc = 115034;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_5: RscText
    {
      idc = 115035;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_0: RscText
    {
      idc = 115040;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_1: RscText
    {
      idc = 115041;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_2: RscText
    {
      idc = 115042;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_3: RscText
    {
      idc = 115043;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_4: RscText
    {
      idc = 115044;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_5: RscText
    {
      idc = 115045;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_0: RscText
    {
      idc = 115050;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_1: RscText
    {
      idc = 115051;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_2: RscText
    {
      idc = 115052;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_3: RscText
    {
      idc = 115053;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_4: RscText
    {
      idc = 115054;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_5: RscText
    {
      idc = 115055;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };
  };
};


class RscObject
{
	access = 0;
	type = CT_OBJECT;
	scale = 1;
	direction[] = {0,0,1};
	up[] = {0,1,0};
	shadow = 0;
};
class RscTextMulti: RscText
{
	style = ST_MULTI;
};
class RscPictureKeepAspect: RscPicture
{
	style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class RscVideo: RscPicture
{
	autoplay = 1;
	loops = 1;
};
class RscHTML
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_HTML;
	idc = -1;
	style = ST_LEFT;
	filename = "";
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	colorBold[] = {1,1,1,1};
	colorLink[] = {1,1,1,0.75};
	colorLinkActive[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureLink[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureBorder[] = {0,0,0,0};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class H1
	{
		font = "RobotoCondensed";
		fontBold = "RobotoCondensedBold";
		sizeEx = GUI_TEXT_SIZE_LARGE;
		align = "left";
	};
	class H2
	{
		font = "RobotoCondensed";
		fontBold = "RobotoCondensedBold";
		sizeEx = GUI_TEXT_SIZE_MEDIUM;
		align = "right";
	};
	class H3
	{
		font = "RobotoCondensed";
		fontBold = "RobotoCondensedBold";
		sizeEx = GUI_TEXT_SIZE_MEDIUM;
		align = "left";
	};
	class H4
	{
		font = "RobotoCondensed";
		fontBold = "RobotoCondensedBold";
		sizeEx = GUI_TEXT_SIZE_MEDIUM;
		align = "left";
	};
	class H5
	{
		font = "RobotoCondensed";
		fontBold = "RobotoCondensedBold";
		sizeEx = GUI_TEXT_SIZE_MEDIUM;
		align = "left";
	};
	class H6
	{
		font = "RobotoCondensed";
		fontBold = "RobotoCondensedBold";
		sizeEx = GUI_TEXT_SIZE_MEDIUM;
		align = "left";
	};
	class P
	{
		font = "RobotoCondensed";
		fontBold = "RobotoCondensedBold";
		sizeEx = GUI_TEXT_SIZE_MEDIUM;
		align = "left";
	};
	x = 0;
	y = 0;
	w = 0.1;
	h = 0.1;
	sizeEx = GUI_TEXT_SIZE_MEDIUM;
	prevPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa";
	nextPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";
	shadow = 2;
};
class RscXListBox
{
	deletable = 0;
	fade = 0;
	idc = -1;
	type = CT_XLISTBOX;
	x = 0.1;
	y = 0.1;
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorText[] = {1,1,1,1};
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	style = ST_CENTER + LB_TEXTURES + SL_HORZ;
	shadow = 2;
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	w = 0.14706;
	h = 0.039216;
	font = "RobotoCondensed";
	sizeEx = GUI_TEXT_SIZE_MEDIUM;
};
class RscTree
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_TREE;
	colorBackground[] = {0,0,0,0};
	colorSelect[] = {1,1,1,0.7};
	colorDisabled[] = {1,1,1,0.25};
	colorText[] = {1,1,1,1};
	colorSelectText[] = {0,0,0,1};
	colorBorder[] = {0,0,0,0};
	colorSearch[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
	};
	colorMarked[] = {0.2,0.3,0.7,1};
	colorMarkedText[] = {0,0,0,1};
	colorMarkedSelected[] = {0,0.5,0.5,1};
	multiselectEnabled = 0;
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {0,0,0,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {0,0,0,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorArrow[] = {1,1,1,1};
	maxHistoryDelay = 1;
	shadow = 0;
	colorSelectBackground[] = {0,0,0,0.5};
	colorLines[] = {0,0,0,0};
	class ScrollBar: RscScrollBar{};
	style = ST_LEFT;
	font = "RobotoCondensed";
	sizeEx = GUI_TEXT_SIZE_MEDIUM;
	expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
	hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
	x = 0;
	y = 0;
	w = 0.1;
	h = 0.2;
	rowHeight = 0.0439091;
	borderSize = 0;
	expandOnDoubleclick = 1;
};
class RscTreeSearch: RscTree
{
	idcSearch = 645;
};
class RscSlider
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_SLIDER;
	style = SL_HORZ;
	color[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.025;
};
class RscActivePicture: RscActiveText
{
	color[] = {1,1,1,0.5};
	colorActive[] = {1,1,1,1};
	style = ST_MULTI + ST_TITLE_BAR;
};
class RscActivePictureKeepAspect: RscActivePicture
{
	style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class RscToolbox
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_TOOLBOX;
	style = ST_CENTER;
	colorText[] = {0.95,0.95,0.95,1};
	color[] = {0.95,0.95,0.95,1};
	colorTextSelect[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorTextDisable[] = {0.4,0.4,0.4,1};
	colorDisable[] = {0.4,0.4,0.4,1};
	colorSelectedBg[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		0.5
	};
	shadow = 0;
	strings[] =
	{
		"",
		""
	};
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.025;
	rows = 1;
	columns = 2;
	font = "RobotoCondensed";
	sizeEx = GUI_TEXT_SIZE_SMALL;
};
class RscControlsGroupNoHScrollbars: RscControlsGroup
{
	class HScrollbar: HScrollbar
	{
		height = 0;
	};
};
class RscControlsGroupNoVScrollbars: RscControlsGroup
{
	class VScrollbar: VScrollbar
	{
		width = 0;
	};
};
class RscButtonTextOnly: RscButton
{
	colorBackground[] = {1,1,1,0};
	colorBackgroundActive[] = {1,1,1,0};
	colorBackgroundDisabled[] = {1,1,1,0};
	colorFocused[] = {1,1,1,0};
	colorShadow[] = {1,1,1,0};
	SizeEx = GUI_TEXT_SIZE_SMALL;
	borderSize = 0;
};
class RscButtonMenuOK: RscButtonMenu
{
	shortcuts[] =
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
		0.09,
		1
	};
	idc = 1;
	default = 1;
	text = "ÐžÐš";
};
class RscButtonMenuCancel: RscButtonMenu
{
	shortcuts[] =
	{
		"0x00050000 + 1"
	};
	idc = 2;
	text = "ÐžÑ‚Ð¼ÐµÐ½Ð°";
};
class RscButtonMenuSteam: RscButtonMenu
{
	colorBackground[] = {0.0313726,0.721569,0.917647,1};
	class TextPos
	{
		left = 0.0325;
		top = (GUI_GRID_H - GUI_TEXT_SIZE_MEDIUM) / 2;
		right = 0.005;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0.005;
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	textureNoShortcut = "\A3\Ui_f\data\GUI\RscCommon\RscButtonMenuSteam\steam_ca.paa";
};
class RscMapControlEmpty: RscMapControl
{
	colorBackground[] = {1,1,1,1};
	colorOutside[] = {1,1,1,1};
	colorSea[] = {0,0,0,0};
	colorForest[] = {0,0,0,0};
	colorForestBorder[] = {0,0,0,0};
	colorRocks[] = {0,0,0,0};
	colorRocksBorder[] = {0,0,0,0};
	colorLevels[] = {0,0,0,0};
	colorMainCountlines[] = {0,0,0,0};
	colorCountlines[] = {0,0,0,0};
	colorMainCountlinesWater[] = {0,0,0,0};
	colorCountlinesWater[] = {0,0,0,0};
	colorPowerLines[] = {0,0,0,0};
	colorRailWay[] = {0,0,0,0};
	colorNames[] = {0,0,0,0};
	colorInactive[] = {0,0,0,0};
	colorGrid[] = {0,0,0,0};
	colorGridMap[] = {0,0,0,0};
	class Task: Task
	{
		color[] = {0,0,0,0};
		colorCreated[] = {0,0,0,0};
		colorCanceled[] = {0,0,0,0};
		colorDone[] = {0,0,0,0};
		colorFailed[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		iconCreated = "#(argb,8,8,3)color(0,0,0,0)";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "#(argb,8,8,3)color(0,0,0,0)";
		iconFailed = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Waypoint: Waypoint
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class WaypointCompleted: WaypointCompleted
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class CustomMark: CustomMark
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Command: Command
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Bush: Bush
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Rock: Rock
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class SmallTree: SmallTree
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Tree: Tree
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class busstop: BusStop
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class fuelstation: Fuelstation
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class hospital: Hospital
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class church: Church
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class lighthouse: Lighthouse
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class power: power
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class powersolar: powersolar
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class powerwave: powerwave
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class powerwind: powerwind
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class quay: Quay
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class shipwreck: Shipwreck
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class transmitter: Transmitter
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class watertower: Watertower
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Bunker: Bunker
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Cross: Cross
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Fortress: Fortress
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Fountain: Fountain
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Chapel: Chapel
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Ruin: Ruin
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Stack: Stack
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class Tourism: Tourism
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	class ViewTower: ViewTower
	{
		color[] = {0,0,0,0};
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		size = 0;
	};
	type = CT_MAP_MAIN;
	ptsPerSquareSea = 1000;
	ptsPerSquareTxt = 1000;
	ptsPerSquareCLn = 1000;
	ptsPerSquareExp = 1000;
	ptsPerSquareCost = 1000;
	ptsPerSquareFor = 1000;
	ptsPerSquareForEdge = 1000;
	ptsPerSquareRoad = 1000;
	ptsPerSquareObj = 1000;
	alphaFadeStartScale = 0;
	alphaFadeEndScale = 0;
};

class RscButtonUC: RscButton
{
	style = "0xC0 + 0x02";
};

class RscPictureButtonMenu : RscButtonMenu
{
	colorBackground[] = {1,1,1,0.004};
	colorBackgroundFocused[] = {1,1,1,0.008};
	colorBackground2[] = {0.75,0.75,0.75,0.004};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {0,0,0,0.4};
};

class Life_V3_RscText: RscText
{
	shadow = 0;
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
};

class Life_V3_RscStructuredText: RscStructuredText
{
	shadow = 0;
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBackground[] = {0,0,0,0};

	class Attributes {
		font = "RobotoCondensed";
        color = "#000000";
		align = "left";
		shadow = 0;
	};
};

class Life_V3_RscEdit: RscEdit
{
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBG_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_A',0.5])"};	
	shadow = 0;
};

class Life_V3_BackGround: RscText
{	
	colorBackground[] = {0.074,0.086,0.105,0.8};
};

class Life_V3_Title: RscTitle
{	
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_TITLE_R',0.216])", "(profilenamespace getvariable ['GUI_V3_TITLE_G',0.31])", "(profilenamespace getvariable ['GUI_V3_TITLE_B',0.4])", "(profilenamespace getvariable ['GUI_V3_TITLE_A',0.8])"};
};

class Life_V3_ButtonMenu: RscButton
{	
	style = "0xC0 + 0x00";
	shadow = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 28) * 1)";	
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_V3_BTBGF_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_A',0.7])"};
};

class Life_V3_RscListBox: RscListBox
{
	colorSelect[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorSelect2[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBackground[] = {1,1,1,0};
	colorSelectBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBGS_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_A',0.8])"};
	colorSelectBackground2[] = {"(profilenamespace getvariable ['GUI_V3_ELBGS_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_A',0.8])"};
};

class Life_V3_RscCombo: RscCombo
{
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorSelect[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBG_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_A',0.5])"};	
	colorSelectBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBGS_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_A',0.8])"};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};
};

class Life_V3_RscProcessBar {
	type = 8;
	style = 0;			
	texture = "";	
	colorFrame[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBar[] = {"(profilenamespace getvariable ['GUI_V3_PGB_R',1])", "(profilenamespace getvariable ['GUI_V3_PGB_G',1])", "(profilenamespace getvariable ['GUI_V3_PGB_B',1])", "(profilenamespace getvariable ['GUI_V3_PGB_A',0.8])"};
};

class Life_V3_RscProcessBarText: RscText
{
	shadow = 0;
	style = 2;
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_PGT_R',0])", "(profilenamespace getvariable ['GUI_V3_PGT_G',0])", "(profilenamespace getvariable ['GUI_V3_PGT_B',0])", "(profilenamespace getvariable ['GUI_V3_PGT_A',1])"};
};

class Life_V3_CloseButton: RscActiveText {
	action = "closeDialog 0";
	tooltip = "$STR_Global_Close";
	text = "\sunrise_gui\data\v3\button_close.paa";

	style = 48;

	color[] = {1,1,1,1};
	colorActive[] = {1,1,1,1};
	colorShade[] = {1,1,1,1};
	colorFocused[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,1};

	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.5,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.5,1};
};

class Life_V3_BackButton: RscActiveText {
	action = "closeDialog 0; [] spawn SunriseClient_pad_openMain";
	tooltip = "$STR_PM_BackToMainMenu";
	text = "\sunrise_gui\data\v3\button_back.paa";

	style = 48;

	color[] = {1,1,1,1};
	colorActive[] = {1,1,1,1};
	colorShade[] = {1,1,1,1};
	colorFocused[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,1};

	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.5,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.5,1};
};

/*
	Extremo V7 GUI elements
*/

#define TLD_COLOR_1 "35/255","37/255","43/255"
#define TLD_COLOR_2 "46/255","49/255","56/255"
#define TLD_COLOR_3 "68/255","73/255","83/255"
#define TLD_COLOR_TEXT "175/255","178/255","183/255"
#define TLD_COLOR_SELECT "211/255","214/255","222/255"
#define TLD_COLOR_BUTTON_GREEN "138/255","183/255","27/255"
#define TLD_COLOR_BUTTON_BLUE "42/255","161/255","211/255"
#define TLD_COLOR_BUTTON_RED "238/255","78/255","16/255"
#define TLD_COLOR_BUTTON_YELLOW "240/255","176/255","23/255"
#define TLD_COLOR_BUTTON_DARK "82/255","88/255","99/255"

class RscExtremoGui_HeaderBG: RscText {
	style = ST_CENTER;
	colorText[] = {1,1,1,1};
	colorBackground[] = {TLD_COLOR_1,0.9};
	moving = 0;

	//font = "RobotoCondensedLight";  	PuristaLight PuristaMedium PuristaSemibold PuristaBold   RobotoCondensed RobotoMedium  ZektonRegular  ZektonRegularBold
	font = "RobotoCondensed";
	sizeEx = 0.8 * GUI_GRID_H;
};
class RscExtremoGui_HeaderBG_2: RscText {
	style = ST_CENTER;
	colorText[] = {1,1,1,1};
	colorBackground[] = {TLD_COLOR_1,0.9};
	moving = 1;

	//font = "RobotoCondensedLight";  	PuristaLight PuristaMedium PuristaSemibold PuristaBold   RobotoCondensed RobotoMedium  ZektonRegular  ZektonRegularBold
	font = "RobotoCondensed";
	sizeEx = 0.75 * GUI_GRID_H;
};
class RscExtremoGui_HeaderBGNotMove: RscExtremoGui_HeaderBG {moving = 0;};
class RscExtremoGui_HeaderMove: RscText {
	style = ST_TITLE_BAR;
	colorBackground[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
};
class RscExtremoGui_DialogBG: RscText {
	style = ST_CENTER;
	colorBackground[] = {TLD_COLOR_2,0.9};	
};
class RscExtremoGui_HudBG: RscText {
	colorBackground[] = {TLD_COLOR_1,0.8};	
};
class RscExtremoGui_HudFoodPb: RscProgress {
	colorBar[] = {0.09,0.392,0.729,1};
	colorFrame[] = {0,0,0,0};
	shadow = 0;
};
class RscExtremoGui_HudStaminaPb: RscProgress {
	colorBar[] = {0.851,0.725,0.024,1};
	colorFrame[] = {0,0,0,0};
	shadow = 0;
};
class RscExtremoGui_HudHealthPb: RscProgress {
	colorBar[] = {0.541,0.757,0.075,1}; //8AC113
	colorFrame[] = {0,0,0,0};
	shadow = 0;
};
class RscExtremoGui_Buff: RscProgress {
	colorBar[] = {0.804,0.039,0.227,1};
	colorFrame[] = {0,0,0,0};
	shadow = 0;
};
class RscExtremoGui_HudXpPb: RscProgress {
	colorBar[] = {133/255,17/255,182/255,1};
	colorFrame[] = {0,0,0,0};
	shadow = 0;
};
class RscExtremoGui_ElementBG: RscText {
	style = 2;
	colorBackground[] = {TLD_COLOR_3,0.3};
	font = "RobotoCondensed";
	sizeEx = 0.75 * GUI_GRID_H;
};
class RscExtremoGui_ElementBG04: RscText {
	colorBackground[] = {TLD_COLOR_1,0.4};
};
class RscExtremoGui_ElementHeaderBG: RscText {	
	style = ST_LEFT;
	fixedWidth = 0;
	colorBackground[] = {TLD_COLOR_3,0.8};
	font = "RobotoCondensed";
	sizeEx = 0.75 * GUI_GRID_H;
};
class RscExtremoGui_Text: RscText {	
	font = "RobotoCondensed";
	sizeEx = 0.75 * GUI_GRID_H;
};
class RscExtremoGui_TextF: RscText {	
	font = "RobotoCondensed";
};
class RscExtremoGui_TextCenter: RscExtremoGui_Text {
	style = ST_CENTER;
};
class RscExtremoGui_TextRight: RscExtremoGui_Text {
	style = ST_RIGHT;
};
class RscExtremoGui_TextMulti: RscTextMulti {
	font = "RobotoCondensed";
	sizeEx = 0.75 * GUI_GRID_H;
};
class RscExtremoGui_TextMoneyValue: RscExtremoGui_Text {
	text = "99,999,999";
	font = "ZektonRegular";	
	style = ST_CENTER;
	sizeEx = 0.9 * GUI_GRID_H;
	colorBackground[] = {TLD_COLOR_1,0.2};
};
class RscExtremoGui_BuffText: RscExtremoGui_Text {
	text = "10s";
	font = "PuristaBold";	
	style = ST_CENTER;
	sizeEx = 0.7 * GUI_GRID_H;
	shadow = 1;
	colorText[] = {0.953,0.839,0.071,1};
	colorShadow[] = {0,0,0,0.6};
};


class RscExtremoGui_StructuredText: RscStructuredText
{
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	size = 0.75 * GUI_GRID_H;

	class Attributes {
		font = "RobotoCondensed";
		align = "left";
		shadow = 0;
	};
};
class RscExtremoGui_StructuredTextCenter: RscStructuredText
{
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	size = 0.75 * GUI_GRID_H;

	class Attributes {
		font = "RobotoCondensed";
		align = "center";
		shadow = 0;
	};
};

class RscExtremoGui_StructuredText_VB: RscStructuredText
{
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	size = 0.75 * GUI_GRID_H;

	class Attributes {
		font = "RobotoCondensed";
		align = "left";
		valign = "bottom";
		shadow = 0;
	};
};

class RscExtremoGui_Edit: RscEdit
{
	colorText[] = {TLD_COLOR_TEXT,1};
	colorDisabled[] = {TLD_COLOR_TEXT,0.5};

	colorSelect[] = {TLD_COLOR_SELECT,1};
	colorBackground[] = {TLD_COLOR_3,1};
	sizeEx = 0.75 * GUI_GRID_H;
	font = "RobotoCondensed";
	shadow = 0;
};

class RscExtremoGui_EditRO: RscExtremoGui_Edit
{
	canModify = 0;
};

class RscExtremoGui_EditMulti: RscExtremoGui_Edit 
{
	style = ST_MULTI;
};

class RscExtremoGui_EditCenter: RscExtremoGui_Edit 
{
	style = ST_CENTER;
};

class RscExtremoGui_ListBoxAdmin: RscListBox
{
	colorText[] = {1,1,1,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,0.8};

	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {1,1,1,1};
	colorSelect2Right[] = {1,1,1,0.8};
	
	colorBackground[]={0,0,0,0.8};	
	
	colorSelectBackground[]={0,0,0,0.9};
	colorSelectBackground2[]={0,0,0,0.9};

	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	font = "RobotoCondensedLight";
	sizeEx = 0.7 * GUI_GRID_H;

	rowHeight = 0.9 * GUI_GRID_H;
};

class RscExtremoGui_ListBox: RscListBox
{
	colorSelect[] = {TLD_COLOR_SELECT,1};	
	colorSelect2[] = {TLD_COLOR_SELECT,1};	

	colorText[] = {TLD_COLOR_TEXT,1};
	colorBackground[] = {TLD_COLOR_3,1};

	colorTextRight[] = {TLD_COLOR_TEXT,1};
	colorSelectRight[] = {TLD_COLOR_SELECT,1};
	colorSelect2Right[] = {TLD_COLOR_SELECT,1};
		
	colorSelectBackground[] = {TLD_COLOR_1,1};
	colorSelectBackground2[] = {TLD_COLOR_1,1};

	colorScrollbar[] = {0.2, 0.2, 0.2, 1};

	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};

	colorActive[] = {0,0,0,1};
	colorDisabled[] = {TLD_COLOR_TEXT,0.6};

	font = "RobotoCondensed";
	sizeEx = 0.7 * GUI_GRID_H;

	rowHeight = 1.2 * GUI_GRID_H;

	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {TLD_COLOR_2,0.9};
	tooltipColorShade[] = {TLD_COLOR_2,0.9};

	x = 0;
	y = 0;
	w = GUI_GRID_W;
	h = GUI_GRID_H;

	class ListScrollBar
	{
		color[] = {TLD_COLOR_1,0.9};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";		
	};
};

class RscExtremoGui_ListBoxDrag: RscExtremoGui_ListBox {
	canDrag = true;
};

class RscExtremoGui_ListBoxAlpha: RscExtremoGui_ListBox {
	colorBackground[] = {TLD_COLOR_3,0};
};

class RscExtremoGui_ListBoxDragLoot: RscExtremoGui_ListBox {
	canDrag = true;
	colorBackground[] = {TLD_COLOR_2,0.6};
};

class RscExtremoGui_ListBox15: RscExtremoGui_ListBox {
	rowHeight = 1.5 * GUI_GRID_H;
};

class RscExtremoGui_ListBox09: RscExtremoGui_ListBox {
	rowHeight = 0.9 * GUI_GRID_H;
};

class RscExtremoGui_Tree: RscTree
{
	colorSelect[] = {TLD_COLOR_SELECT,1};	
	colorSelect2[] = {TLD_COLOR_SELECT,1};	

	colorText[] = {TLD_COLOR_TEXT,1};
	colorBackground[] = {TLD_COLOR_3,0.3};

	colorTextRight[] = {TLD_COLOR_TEXT,1};
	colorSelectRight[] = {TLD_COLOR_SELECT,1};
	colorSelect2Right[] = {TLD_COLOR_SELECT,1};
		
	colorSelectBackground[] = {TLD_COLOR_1,1};
	colorSelectBackground2[] = {TLD_COLOR_1,1};

	colorScrollbar[] = {0.2, 0.2, 0.2, 1};

	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};

	colorActive[] = {0,0,0,1};
	colorDisabled[] = {TLD_COLOR_TEXT,0.6};

	font = "RobotoCondensed";
	sizeEx = 0.75 * GUI_GRID_H;

	rowHeight = 1.2 * GUI_GRID_H;

	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {TLD_COLOR_2,0.9};
	tooltipColorShade[] = {TLD_COLOR_2,0.9};

	class ScrollBar
	{
		color[] = {TLD_COLOR_1,0.9};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class RscExtremoGui_Combo: RscCombo
{
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};

	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";

	colorBackground[] = {TLD_COLOR_3,1};
	colorDisabled[] = {TLD_COLOR_TEXT,0.5};
	colorSelect[] = {TLD_COLOR_SELECT,1};
	colorSelectBackground[] = {TLD_COLOR_1,1};
	colorText[] = {TLD_COLOR_TEXT,1};

	colorTextRight[] = {TLD_COLOR_TEXT,1};
	colorSelectRight[] = {TLD_COLOR_SELECT,1};
	colorSelect2Right[] = {TLD_COLOR_SELECT,1};

	font = "RobotoCondensed";
	sizeEx = 0.75 * GUI_GRID_H;
	rowHeight = 1.2 * GUI_GRID_H;

	x = 0;
	y = 0;
	w = GUI_GRID_W;
	h = 2 * GUI_GRID_H;

	class ComboScrollBar
	{
		color[] = {TLD_COLOR_3,1};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class RscExtremoGui_ComboVehBrand: RscExtremoGui_Combo {
	sizeEx = 0.75 * GUI_GRID_H;
	rowHeight = 2 * GUI_GRID_H;
};

class RscExtremoGui_ButtonGreen: RscButton
{
	style = 0+2;
	borderSize = 0;
	shadow = 0;
	colorBackground[] = {TLD_COLOR_BUTTON_GREEN,1};
	colorBackgroundActive[] = {TLD_COLOR_BUTTON_GREEN,1};
	colorBackgroundDisabled[] = {TLD_COLOR_BUTTON_GREEN,0.5};
	colorBorder[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,0.5};
	colorFocused[] = {TLD_COLOR_BUTTON_GREEN,1};
	colorShadow[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "RobotoCondensed";
	sizeEx = 0.8 * GUI_GRID_H;
	offsetPressedX = 0;
	offsetPressedY = 0;
	offsetX = 0;
	offsetY = 0;
};

class RscExtremoGui_ActivePicture: RscActivePicture
{	
	color[]={1,1,1,1};
	colorActive[]={1,1,1,1};

	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {TLD_COLOR_2,0.9};
	tooltipColorShade[] = {TLD_COLOR_2,0.9};
};
class RscExtremoGui_ActivePictureKeepAspect: RscActivePictureKeepAspect
{
	style="0x30 + 0x800";

	color[]={1,1,1,1};
	colorActive[]={1,1,1,1};

	shadow = 0;

	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {TLD_COLOR_2,0.9};
	tooltipColorShade[] = {TLD_COLOR_2,0.9};
};

class RscExtremoGui_ActiveAsp_Blue: RscExtremoGui_ActivePictureKeepAspect {
	color[] = {TLD_COLOR_BUTTON_BLUE,0.85};
	colorActive[] = {TLD_COLOR_BUTTON_BLUE,1};
};

class RscExtremoGui_ActiveAsp_Red: RscExtremoGui_ActivePictureKeepAspect {
	color[] = {TLD_COLOR_BUTTON_RED,0.85};
	colorActive[] = {TLD_COLOR_BUTTON_RED,1};
};

class RscExtremoGui_ActiveAsp_Yellow: RscExtremoGui_ActivePictureKeepAspect {
	color[] = {TLD_COLOR_BUTTON_YELLOW,0.85};
	colorActive[] = {TLD_COLOR_BUTTON_YELLOW,1};
};

class RscExtremoGui_ActiveAsp_Green: RscExtremoGui_ActivePictureKeepAspect {
	color[] = {TLD_COLOR_BUTTON_GREEN,0.85};
	colorActive[] = {TLD_COLOR_BUTTON_GREEN,1};
};

class RscExtremoGui_ActiveAsp_Dark: RscExtremoGui_ActivePictureKeepAspect {
	color[] = {TLD_COLOR_BUTTON_DARK,0.85};
	colorActive[] = {TLD_COLOR_BUTTON_DARK,1};
};

class RscExtremoGui_ButtonRed: RscExtremoGui_ButtonGreen {
	colorBackground[] = {TLD_COLOR_BUTTON_RED,1};
	colorBackgroundActive[] = {TLD_COLOR_BUTTON_RED,1};
	colorBackgroundDisabled[] = {TLD_COLOR_BUTTON_RED,0.5};
	colorFocused[] = {TLD_COLOR_BUTTON_RED,1};
};

class RscExtremoGui_ButtonBlue: RscExtremoGui_ButtonGreen {
	colorBackground[] = {TLD_COLOR_BUTTON_BLUE,1};
	colorBackgroundActive[] = {TLD_COLOR_BUTTON_BLUE,1};
	colorBackgroundDisabled[] = {TLD_COLOR_BUTTON_BLUE,0.5};
	colorFocused[] = {TLD_COLOR_BUTTON_BLUE,1};
};

class RscExtremoGui_ButtonYellow: RscExtremoGui_ButtonGreen {
	colorBackground[] = {TLD_COLOR_BUTTON_YELLOW,1};
	colorBackgroundActive[] = {TLD_COLOR_BUTTON_YELLOW,1};
	colorBackgroundDisabled[] = {TLD_COLOR_BUTTON_YELLOW,0.5};
	colorFocused[] = {TLD_COLOR_BUTTON_YELLOW,1};
};

class RscExtremoGui_ButtonDark: RscExtremoGui_ButtonGreen {
	colorBackground[] = {TLD_COLOR_BUTTON_DARK,1};
	colorBackgroundActive[] = {TLD_COLOR_BUTTON_DARK,1};
	colorBackgroundDisabled[] = {TLD_COLOR_BUTTON_DARK,0.5};
	colorFocused[] = {TLD_COLOR_BUTTON_DARK,1};
};

class RscExtremoGui_MapRscTextCheckBox: RscTextCheckBox {
	colorText[] = {1,1,1,1};
	colorTextSelect[] = {TLD_COLOR_BUTTON_GREEN,1};
	colorSelectedBg[] = {TLD_COLOR_3,0};
	sizeEx = GUI_GRID_H * 0.8;
	rows = 13;
	strings[] = 
	{
		"Государственные органы", //dep
		"Организации", //guilds
		"Магазины", //itemshop
		"Салоны техники", //vehshop
		"Гаражи", //garage
		"Объекты разработки", //resource
		"Работа", //work
		"Грузоперевозки", //trucking
		"Задания", //quest,
		"Поселки (DP)", //dp
		"Строения", //buildings
		"Развлечения", //relax
		"Услуги" //service
	};
	checked_strings[] = {};
	onCheckBoxesSelChanged = "_this call TLC_markers_change";
};

class RscExtremoGui_GpsRscTextCheckBox: RscTextCheckBox {
	colorText[] = {TLD_COLOR_BUTTON_RED,1};
	colorTextSelect[] = {TLD_COLOR_BUTTON_GREEN,1};
	colorSelectedBg[] = {TLD_COLOR_3,0};
	sizeEx = GUI_GRID_H * 0.8;
	rows = 1;
	columns = 1;
	strings[] = 
	{
		"[ Приоритет на трассы ]"
	};
	checked_strings[] = {};
};

class RscExtremoGui_RscCheckBox: RscCheckBox {
	colorText[] = {1,1,1,1};
	colorTextSelect[] = {TLD_COLOR_BUTTON_GREEN,1};
	colorSelectedBg[] = {TLD_COLOR_3,0.3};
	sizeEx = GUI_GRID_H * 0.5;
};

class RscExtremoGui_WinButton: ctrlShortcutButton {
	color[] = {1,1,1,1};
	color2[] = {1,1,1,1};

	colorFocused[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};

	colorBackground[] = {TLD_COLOR_2,0.7};
	colorBackground2[] = {TLD_COLOR_2,0.7};

	colorBackgroundFocused[] = {TLD_COLOR_2,1};
	colorBackgroundActive[] = {TLD_COLOR_2,1};

	animTextureDefault = "\tl_pack\pictures\hud\button_normal.paa";
	animTextureNormal = "\tl_pack\pictures\hud\button_normal.paa";
	animTextureDisabled = "\tl_pack\pictures\hud\button_normal.paa";
	animTextureOver = "\tl_pack\pictures\hud\button_normal.paa";
	animTextureFocused = "\tl_pack\pictures\hud\button_normal.paa";
	animTexturePressed = "\tl_pack\pictures\hud\button_normal.paa";

	size = 1.25 * GUI_GRID_H;
	sizeEx = 1.25 * GUI_GRID_H;

	period = 0;
	periodFocus = 0;
	periodOver = 0;

	class ShortcutPos
	{
		left = 0;
		top = 0;
		w = 0;
		h = 0;
	};
	class TextPos
	{
		left = 0.25 * GUI_GRID_W;
		top = 0;
		right = 0.25 * GUI_GRID_W;
		bottom = 0;
	};

	class Attributes
	{
		align = "left";
		color = "#ffffff";
		size = 1;
		font = "RobotoCondensedBold";
		shadow = 0;
	};
};

class RscExtremoGui_IconButton: RscShortcutButton {
	color[] = {1,1,1,0.9};
	color2[] = {1,1,1,0.9};

	colorFocused[] = {1,1,1,0.9};
	colorDisabled[] = {1,1,1,0.5};

	colorBackground[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,1};

	colorBackgroundFocused[] = {1,1,1,1};
	colorBackgroundActive[] = {1,1,1,1};

	animTextureDefault = "\tl_pack\pictures\hud\dark.paa";
	animTextureNormal = "\tl_pack\pictures\hud\dark.paa";
	animTextureDisabled = "\tl_pack\pictures\hud\disabled.paa";
	animTextureOver = "\tl_pack\pictures\hud\dark.paa";
	animTextureFocused = "\tl_pack\pictures\hud\dark.paa";
	animTexturePressed = "\tl_pack\pictures\hud\dark.paa";

	size = 1.2 * GUI_GRID_H;
	sizeEx = 1.2 * GUI_GRID_H;

	period = 0;
	periodFocus = 0;
	periodOver = 0;
	shadow = 0;

	class ShortcutPos
	{
		left = 0;
		top = 0;
		w = 0;
		h = 0;
	};
	class TextPos
	{
		left = 0.25 * GUI_GRID_W;
		top = 0;
		right = 0 * GUI_GRID_W;
		bottom = 0;
	};

	class Attributes
	{
		align = "left";
		color = "#ffffff";
		size = 1;
		font = "RobotoCondensed";
		shadow = 0;
	};
};

class RscExtremoGui_IconButtonGreen: RscExtremoGui_IconButton {
	animTextureDefault = "\tl_pack\pictures\hud\green.paa";
	animTextureNormal = "\tl_pack\pictures\hud\green.paa";	
	animTextureOver = "\tl_pack\pictures\hud\green.paa";
	animTextureFocused = "\tl_pack\pictures\hud\green.paa";
	animTexturePressed = "\tl_pack\pictures\hud\green.paa";
};

class RscExtremoGui_IconButtonRed: RscExtremoGui_IconButton {
	animTextureDefault = "\tl_pack\pictures\hud\orange.paa";
	animTextureNormal = "\tl_pack\pictures\hud\orange.paa";	
	animTextureOver = "\tl_pack\pictures\hud\orange.paa";
	animTextureFocused = "\tl_pack\pictures\hud\orange.paa";
	animTexturePressed = "\tl_pack\pictures\hud\orange.paa";
};

class RscExtremoGui_IconButtonBlue: RscExtremoGui_IconButton {
	animTextureDefault = "\tl_pack\pictures\hud\blue.paa";
	animTextureNormal = "\tl_pack\pictures\hud\blue.paa";	
	animTextureOver = "\tl_pack\pictures\hud\blue.paa";
	animTextureFocused = "\tl_pack\pictures\hud\blue.paa";
	animTexturePressed = "\tl_pack\pictures\hud\blue.paa";
};

class RscExtremoGui_IconButtonYellow: RscExtremoGui_IconButton {
	animTextureDefault = "\tl_pack\pictures\hud\yellow.paa";
	animTextureNormal = "\tl_pack\pictures\hud\yellow.paa";	
	animTextureOver = "\tl_pack\pictures\hud\yellow.paa";
	animTextureFocused = "\tl_pack\pictures\hud\yellow.paa";
	animTexturePressed = "\tl_pack\pictures\hud\yellow.paa";
};

class RscExtremoGui_InvMouseButton: RscActiveText {
	style = ST_LEFT;
	color[] = {TLD_COLOR_TEXT,0.8};
	colorActive[] = {TLD_COLOR_TEXT,1};
	shadow = 0;
};

class RscExtremoGui_InvTabButton: RscActiveText {
	style = ST_CENTER;
	color[] = {1,1,1,1};
	colorActive[] = {TLD_COLOR_BUTTON_GREEN,1};
	colorDisabled[] = {TLD_COLOR_BUTTON_GREEN,1};	
	shadow = 2;
	sizeEx = 0.7 * GUI_GRID_H;
};

class RscExtremoGui_WinTitle: RscActiveText {
	style = ST_RIGHT;
	color[] = {1,1,1,1};
	colorActive[] = {1,1,1,1};
	sizeEx = 0.9 * GUI_GRID_H;
	shadow = 0;
};

class RscExtremoGui_RscProgress: RscProgress {
	colorBar[] = {TLD_COLOR_BUTTON_GREEN,0.7};
	colorFrame[] = {0,0,0,0};
};
class RscExtremoGui_RscProgressVert: RscExtremoGui_RscProgress {
	style = ST_VERTICAL;
};

class RscExtremoGui_StaticFrame: ctrlStaticFrame {	
	colorShadow[] = {0,0,0,0};
	tileW = 1;
	tileH = 1;
	colorText[] = {1,1,1,0.5};

};

class RscExtremoGui_UnitName: RscText {
	font = "RobotoCondensed";
	sizeEx = 0.65 * GUI_GRID_H;
};

class RscExtremoGui_RepTitle: RscText {
	font = "RobotoCondensed";
	sizeEx = 0.65 * GUI_GRID_H;
};
class RscExtremoGui_RepValue: RscText {
	font = "RobotoCondensedBold";
	sizeEx = 0.7 * GUI_GRID_H;
	style = 2;
};
class RscExtremoGui_RepProgressBG: RscText {
	colorBackground[] = {TLD_COLOR_1,0.4};
};
class RscExtremoGui_HintShowBG: RscText {
	colorBackground[] = {TLD_COLOR_1,0.8};
};


class RscExtremoGui_UnitNameSec: RscExtremoGui_UnitName {
	style = 1;
};

class RscExtremoGui_RscListNBox: RscListNBox {
	columns[] = {0,0.3,0.7};

	colorText[] = {TLD_COLOR_TEXT,1};
	colorBackground[] = {TLD_COLOR_3,0.3};

	colorSelect[] = {TLD_COLOR_SELECT,1};	
	colorSelect2[] = {TLD_COLOR_SELECT,1};	

	colorSelectBackground[] = {TLD_COLOR_1,1};
	colorSelectBackground2[] = {TLD_COLOR_1,1};

	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};

	colorScrollbar[] = {0.2, 0.2, 0.2, 1};

	font = "RobotoCondensed";
	sizeEx = 0.75 * GUI_GRID_H;

	rowHeight = 1.2 * GUI_GRID_H;
	period = 0; 

	x = 0;
	y = 0;
	w = GUI_GRID_W;
	h = GUI_GRID_H;
};

class RscExtremoGui_RscListNBoxDepCalls: RscExtremoGui_RscListNBox {
	columns[] = {0,0.08,0.5,0.8};
	sizeEx = 0.7 * GUI_GRID_H;
	rowHeight = 1 * GUI_GRID_H;
	disableOverflow = true;
};

class RscExtremoGui_RscListNBoxOrders: RscExtremoGui_RscListNBox {
	columns[] = {0,0.06,0.4,0.55,0.7};
	sizeEx = 0.7 * GUI_GRID_H;
	rowHeight = 1 * GUI_GRID_H;
	disableOverflow = true;
};

class RscExtremoGui_RscListNBoxPins: RscExtremoGui_RscListNBox {
	columns[] = {0,0.12,0.8};
	sizeEx = 0.7 * GUI_GRID_H;
	rowHeight = 1 * GUI_GRID_H;
	disableOverflow = true;
};

class RscExtremoGui_RscListNBoxOrgRating: RscExtremoGui_RscListNBox {
	columns[] = {};
	sizeEx = 0.65 * GUI_GRID_H;
	rowHeight = 1 * GUI_GRID_H;
	disableOverflow = true;
};

class RscExtremoGui_RscListNBoxUnitRating: RscExtremoGui_RscListNBox {
	columns[] = {};
	sizeEx = 0.65 * GUI_GRID_H;
	rowHeight = 1 * GUI_GRID_H;
	disableOverflow = true;
};
class RscExtremoGui_RscListNBoxBattleRating: RscExtremoGui_RscListNBox {
	columns[] = {};
	colorBackground[] = {TLD_COLOR_3,0.6};
	sizeEx = 0.65 * GUI_GRID_H;
	rowHeight = 1 * GUI_GRID_H;
	disableOverflow = true;
};

class RscExtremoGui_DocTitle: RscText
{
	sizeEx = 1 * GUI_GRID_H;	
	style = ST_CENTER;
	colorText[] = {0.392,0.188,0.161,1};		
	font = "RobotoCondensedBold";
	shadow = 0;
};

class RscExtremoGui_ControlsGroup: RscControlsGroup
{
	class VScrollbar: VScrollbar
	{
		color[] = {1,1,1,1};
		width = 0.011;
		autoScrollEnabled = 1;
	};
	class HScrollbar: HScrollbar
	{
		color[] = {1,1,1,1};
		height = 0.018;
	};
};

class RscExtremoGui_PBbg: RscExtremoGui_Text {
	colorBackground[] = {TLD_COLOR_2,0.5};
};
class RscExtremoGui_PBbar: RscProgress {
	colorBar[] = {TLD_COLOR_2,0.6};
	colorFrame[] = {TLD_COLOR_2,0.9};
	shadow = 2;
};
class RscExtremoGui_PBtext: RscExtremoGui_Text {
	style = ST_CENTER;
	sizeEx = 0.9 * GUI_GRID_H;
};

class SL_TabletText {
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "RobotoCondensed";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class SLT_left : SL_TabletText {
  style = ST_LEFT;
};