//IDC_ExtremoInventory_ID
class ExtremoInventory2
{
	idd = 1981;
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['ExtremoInventory2', _this select 0]";
	onUnload = "[_this select 0,true] call SunriseClient_gui_bluring";	

	class controlsBackground {
		
		class PadProgsListGroup: RscControlsGroup {
			idc = IDC_ExtremoInventory_PadProgsListGroup;
			x = (safezoneX + 0.35 * safezoneW) - 11 * GUI_GRID_W;
			y = (safezoneY + 0.25 * safezoneH) - 2.2 * GUI_GRID_H;
			w = 10 * GUI_GRID_W;
			h = 20.6 * GUI_GRID_H;
			show = 1;

			class controls {
				class PadProgsHead: RscExtremoGui_HeaderBG {
					idc = -1;
					x = 0;
					y = 0;
					w = 10 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "Программы";
				};
				class PadProgsBG: RscExtremoGui_DialogBG {
					idc = -1;
					x = 0;
					y = 1.7 * GUI_GRID_H;
					w = 10 * GUI_GRID_W;
					h = 17.5 * GUI_GRID_H;
				};
				class PadProgsList: RscExtremoGui_ListBox {
					idc = IDC_ExtremoInventory_PadProgsListBox;
					x = 0.5 * GUI_GRID_W;
					y = 2.2 * GUI_GRID_H;
					w = 9 * GUI_GRID_W;
					h = 16.5 * GUI_GRID_H;

					rowHeight = 1.5 * GUI_GRID_H;
					onLBSelChanged = "_this call TLC_pad_progSelect";
				};		
			};
		};	

		class PadMainGroup: RscControlsGroup {
			idc = IDC_ExtremoInventory_PadMainGroup;
			x = (safezoneX + 0.35 * safezoneW) - 0.5 * GUI_GRID_W;
			y = (safezoneY + 0.25 * safezoneH) - 2.2 * GUI_GRID_H;
			w = 31.4 * GUI_GRID_W;
			h = 20.6 * GUI_GRID_H;
			show = 1;

			class controls {
				class PadMainHeadBg: RscExtremoGui_HeaderBG {
					idc = -1;
					x = 19.4 * GUI_GRID_W;
					y = 0;
					w = 12 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;			
				};
				class PadMainHeadTxt: RscExtremoGui_Text {
					idc = IDC_ExtremoInventory_PadMainGroupTitle;
					style = ST_CENTER;
					x = 19.4 * GUI_GRID_W;
					y = 0;
					w = 12 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;		
					text = "Программка";
				};

				class PadBG: RscExtremoGui_DialogBG {
					idc = -1;
					x = 0;
					y = 1.7 * GUI_GRID_H;
					w = 31.4 * GUI_GRID_W;
					h = 17.5 * GUI_GRID_H;
				};

				class ProgStatGroup: RscControlsGroup {
					idc = IDC_ExtremoInventory_PadProgStatGroup;
					x = 0.5 * GUI_GRID_W;
					y = 2.2 * GUI_GRID_H;
					w = 30.4 * GUI_GRID_W;
					h = 16.5 * GUI_GRID_H;

					show = 0;

					class controls {
						class ProgStatBG: RscExtremoGui_ElementBG {
							idc = -1;
							x = 0 * GUI_GRID_W;
							y = 0 * GUI_GRID_H;
							w = 30.4 * GUI_GRID_W;
							h = 16.5 * GUI_GRID_H;
						};

						class ProgStatDataBg: RscExtremoGui_ElementHeaderBG {
							idc = -1;
							x = 0.5 * GUI_GRID_W;
							y = 0.5 * GUI_GRID_H;
							w = 19 * GUI_GRID_W;
							h = 1.3 * GUI_GRID_H;
							text = "Финансы";
						};

						class ProgStatCashHeader: RscExtremoGui_Text {
							idc = -1;
							x = 0.5 * GUI_GRID_W;
							y = 2.5 * GUI_GRID_H;
							w = 4.6 * GUI_GRID_W;
							h = 1.2 * GUI_GRID_H;
							
							text = "Наличность";
							style = 2;
							colorBackground[] = {"35/256","37/256","43/256",0.4};
							tooltip = "";
						};

						class ProgStatCashText: RscExtremoGui_Text {
							idc = IDC_ExtremoInventory_PadProgStatCashV;
							x = 0.5 * GUI_GRID_W;
							y = 3.7 * GUI_GRID_H;
							w = 4.6 * GUI_GRID_W;
							h = 1.3 * GUI_GRID_H;

							text = "99,999,999";
							font = "ZektonRegular";	
							style = 2;
							sizeEx = 0.9 * GUI_GRID_H;
							colorBackground[] = {"35/256","37/256","43/256",0.2};
						};

						class ProgStatBankHeader: RscExtremoGui_Text {
							idc = -1;
							x = 5.3 * GUI_GRID_W;
							y = 2.5 * GUI_GRID_H;
							w = 4.6 * GUI_GRID_W;
							h = 1.2 * GUI_GRID_H;
							
							text = "Банк";
							style = 2;
							colorBackground[] = {"35/256","37/256","43/256",0.4};
						};

						class ProgStatBankText: RscExtremoGui_Text {
							idc = IDC_ExtremoInventory_PadProgStatBankV;
							x = 5.3 * GUI_GRID_W;
							y = 3.7 * GUI_GRID_H;
							w = 4.6 * GUI_GRID_W;
							h = 1.2 * GUI_GRID_H;

							text = "99,999,999";
							font = "ZektonRegular";	
							style = 2;
							sizeEx = 0.9 * GUI_GRID_H;
							colorBackground[] = {"35/256","37/256","43/256",0.2};
						};

						class ProgStatDCashHeader: RscExtremoGui_Text {
							idc = -1;
							x = 10.1 * GUI_GRID_W;
							y = 2.5 * GUI_GRID_H;
							w = 4.6 * GUI_GRID_W;
							h = 1.2 * GUI_GRID_H;
							
							text = "Грязные";
							style = 2;
							colorBackground[] = {"35/256","37/256","43/256",0.4};
						};

						class ProgStatDCashText: RscExtremoGui_Text {
							idc = IDC_ExtremoInventory_PadProgStatDCashV;
							x = 10.1 * GUI_GRID_W;
							y = 3.7 * GUI_GRID_H;
							w = 4.6 * GUI_GRID_W;
							h = 1.2 * GUI_GRID_H;

							text = "99,999,999";
							font = "ZektonRegular";	
							style = 2;
							sizeEx = 0.9 * GUI_GRID_H;
							colorBackground[] = {"35/256","37/256","43/256",0.2};
						};

						class ProgStatDBankHeader: RscExtremoGui_Text {
							idc = -1;
							x = 14.9 * GUI_GRID_W;
							y = 2.5 * GUI_GRID_H;
							w = 4.6 * GUI_GRID_W;
							h = 1.2 * GUI_GRID_H;
							
							text = "Тайник";
							style = 2;
							colorBackground[] = {"35/256","37/256","43/256",0.4};
						};

						class ProgStatDBankText: RscExtremoGui_Text {
							idc = IDC_ExtremoInventory_PadProgStatDBankV;
							x = 14.9 * GUI_GRID_W;
							y = 3.7 * GUI_GRID_H;
							w = 4.6 * GUI_GRID_W;
							h = 1.2 * GUI_GRID_H;

							text = "99,999,999";
							font = "ZektonRegular";	
							style = 2;
							sizeEx = 0.9 * GUI_GRID_H;
							colorBackground[] = {"35/256","37/256","43/256",0.2};
						};

						class ProgStatRepHeaderBg: RscExtremoGui_ElementHeaderBG {
							idc = -1;
							x = 19.9 * GUI_GRID_W;
							y = 0.5 * GUI_GRID_H;
							w = 10 * GUI_GRID_W;
							h = 1.3 * GUI_GRID_H;
							text = "Репутация";
						};

						class PadProgStatRepListGrp: RscControlsGroup {
							idc = IDC_ExtremoInventory_PadProgStatRepList;
							x = 19.9 * GUI_GRID_W;
							y = 2 * GUI_GRID_H;
							w = 10 * GUI_GRID_W;
							h = 14 * GUI_GRID_H;
							class controls {							
								
							};
						};

						class ProgStatInfoBg: RscExtremoGui_ElementHeaderBG {
							idc = -1;
							x = 0.5 * GUI_GRID_W;
							y = 5.5 * GUI_GRID_H;
							w = 19 * GUI_GRID_W;
							h = 1.3 * GUI_GRID_H;
							text = "Статистика";
						};

						class ProgStatInfoText: RscExtremoGui_StructuredText {
							idc = IDC_ExtremoInventory_PadProgStatMainData;
							x = 0.5 * GUI_GRID_W;
							y = 7 * GUI_GRID_H;
							w = 19 * GUI_GRID_W;
							h = 8 * GUI_GRID_H;
							text = "";
							//colorBackground[] = {"35/256","37/256","43/256",0.4};
						};		
					};
				};
			};
		};

		
		class UnitGearGroup: RscControlsGroup {
			idc = IDC_ExtremoInventory_GearGroup;
			x = (safezoneX + 0.35 * safezoneW) - 0.5 * GUI_GRID_W;
			y = (safezoneY + 0.25 * safezoneH) - 0.5 * GUI_GRID_H;
			w = 18.9 * GUI_GRID_W;
			h = 17.5 * GUI_GRID_H;

			class controls {
				class GearBG: RscExtremoGui_DialogBG {
					idc = -1;
					x = 0;
					y = 0;
					w = 18.9 * GUI_GRID_W;
					h = 17.5 * GUI_GRID_H;
				};	

				class UniformBG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W;
					y = 0.5 * GUI_GRID_H;
					w = 3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
				};
				class UniformIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_UniformIcon;	
					x = 0.5 * GUI_GRID_W;
					y = 0.5 * GUI_GRID_H;
					w = 3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_uniform_gs.paa";	

					onMouseButtonUp = "_this call TLC_inventory_actionHandler";			
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class VestBG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 3.7 * GUI_GRID_W;
					y = 0.5 * GUI_GRID_H;
					w = 3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
				};		
				class VestIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_VestIcon;
					x = 3.7 * GUI_GRID_W;
					y = 0.5 * GUI_GRID_H;
					w = 3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_vest_gs.paa";		

					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";					
				};
				class BackPackBG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 6.9 * GUI_GRID_W;
					y = 0.5 * GUI_GRID_H;
					w = 3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
				};
				class BackPackIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_BackPackIcon;
					x = 6.9 * GUI_GRID_W;
					y = 0.5 * GUI_GRID_H;
					w = 3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_backpack_gs.paa";	

					onMouseButtonUp = "_this call TLC_inventory_actionHandler";	
					onLBDrop  = "_this call TLC_inventory_dragHandler";					
				};

				class PlayerDataBG: RscExtremoGui_ElementBG {
					idc = IDC_ExtremoInventory_PlayerDataGroup_BG;
					x = 0.5 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 9.4 * GUI_GRID_W;
					h = 11.3 * GUI_GRID_H;
				};
				class PlayerDataGroup: RscControlsGroup {
					idc = IDC_ExtremoInventory_PlayerDataGroup;
					x = 0.5 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 9.4 * GUI_GRID_W;
					h = 11.3 * GUI_GRID_H;

					class VScrollbar: VScrollbar
					{
						color[] = {1,1,1,0.3};
					};

					class controls {						
						class PlayerDataText: RscExtremoGui_StructuredText {
							idc = IDC_ExtremoInventory_PlayerDataGroup_TXT;
							x = 0;
							y = 0;
							w = 9.4 * GUI_GRID_W;
							h = 11.3 * GUI_GRID_H;
						};
					};
				};				
		
				class PrimWeapBG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 10.1 * GUI_GRID_W;
					y = 0.5 * GUI_GRID_H;
					w = 8.3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
				};
				class PrimaryIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_PrimaryIcon;
					x = 10.1 * GUI_GRID_W;
					y = 0.5 * GUI_GRID_H;
					w = 8.3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_primary_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class PrimWeapSlot1BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 10.1 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class PrimWeapSlot1Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_PrimarySlot_Muzzl_Icon;
					x = 10.1 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_muzzle_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class PrimWeapSlot2BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 11.5 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class PrimWeapSlot2Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_PrimarySlot_Bipod_Icon;
					x = 11.5 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_bipod_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class PrimWeapSlot3BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 12.9 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class PrimWeapSlot3Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_PrimarySlot_Side_Icon;
					x = 12.9 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_side_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class PrimWeapSlot4BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 14.3 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class PrimWeapSlot4Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_PrimarySlot_Optic_Icon;
					x = 14.3 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_top_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class PrimWeapSlot5BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 15.7 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class PrimWeapSlot5Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_PrimarySlot_Gl_Icon;
					x = 15.7 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_magazinegl_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class PrimWeapSlot6BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 17.1 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class PrimWeapSlot6Progress: RscExtremoGui_RscProgress {
					idc = IDC_ExtremoInventory_PrimarySlot_Magz_Load;
					style = ST_VERTICAL;
					x = 17.1 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 0.1 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class PrimWeapSlot6Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_PrimarySlot_Magz_Icon;
					x = 17.1 * GUI_GRID_W;
					y = 3.7 * GUI_GRID_H;
					w = 1.3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_magazine_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
		
		
		
				class HandBG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 10.1 * GUI_GRID_W;
					y = 5.4 * GUI_GRID_H;
					w = 8.3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
				};
				class HandIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_HandIcon;
					x = 10.1 * GUI_GRID_W;
					y = 5.4 * GUI_GRID_H;
					w = 8.3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;	
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_hgun_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class HandSlot1BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 10.1 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class HandSlot1Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_HandSlot_Muzzl_Icon;
					x = 10.1 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_muzzle_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class HandSlot2BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 11.8 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class HandSlot2Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_HandSlot_Bipod_Icon;
					x = 11.8 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_bipod_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class HandSlot3BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 13.5 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class HandSlot3Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_HandSlot_Side_Icon;
					x = 13.5 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_side_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class HandWeSlot4BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 15.2 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class HandSlot4Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_HandSlot_Optic_Icon;
					x = 15.2 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_muzzle_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class HandWeSlot5BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 16.9 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class HandWeSlot5Load: RscExtremoGui_RscProgress {
					idc = IDC_ExtremoInventory_HandSlot_Magz_Load;
					style = ST_VERTICAL;
					x = 16.9 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 0.1 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class HandSlot5Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_HandSlot_Magz_Icon;
					x = 16.9 * GUI_GRID_W;
					y = 8.6 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_magazine_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
		
		
		
				class SeconWeapBG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 10.1 * GUI_GRID_W;
					y = 10.3 * GUI_GRID_H;
					w = 8.3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
				};
				class SecondIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_SecondIcon;
					x = 10.1 * GUI_GRID_W;
					y = 10.3 * GUI_GRID_H;
					w = 8.3 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_secondary_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class SeconWeapSlot1BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 10.1 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class SeconWeapSlot1Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_SecondSlot_Muzzl_Icon;
					x = 10.1 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_muzzle_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class SeconWeapSlot2BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 11.8 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class SeconWeapSlot2Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_SecondSlot_Bipod_Icon;
					x = 11.8 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_bipod_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class SeconWeapSlot3BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 13.5 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class SeconWeapSlot3Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_SecondSlot_Side_Icon;
					x = 13.5 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_side_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class SeconWeapSlot4BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 15.2 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class SeconWeapSlot4Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_SecondSlot_Optic_Icon;
					x = 15.2 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_top_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
				class SeconWeapSlot5BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 16.9 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class SeconWeapSlot5Load: RscExtremoGui_RscProgress {
					idc = IDC_ExtremoInventory_SecondSlot_Magz_Load;
					style = ST_VERTICAL;
					x = 16.9 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 0.1 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};
				class SeconWeapSlot5Icon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_SecondSlot_Magz_Icon;
					x = 16.9 * GUI_GRID_W;
					y = 13.5 * GUI_GRID_H;
					w = 1.5* GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_magazine_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
		
				class Stuff1BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;
				};
				class HeadIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_HeadIcon;
					x = 0.5 * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_helmet_gs.paa";
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";
					onLBDrop  = "_this call TLC_inventory_dragHandler";
				};
		
				class Stuff2BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W + (1 * (16.3 / 9) + (1 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;			
				};
				class GlassIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_GlassIcon;
					x = 0.5 * GUI_GRID_W + (1 * (16.3 / 9) + (1 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;	
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_glasses_gs.paa";			
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";	
					onLBDrop  = "_this call TLC_inventory_dragHandler";			
				};
		
				class Stuff3BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W + (2 * (16.3 / 9) + (2 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;			
				};
				class BinocularIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_BinocularIcon;
					x = 0.5 * GUI_GRID_W + (2 * (16.3 / 9) + (2 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_binocular_gs.paa";			
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";		
					onLBDrop  = "_this call TLC_inventory_dragHandler";		
				};
		
				class Stuff4BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W + (3 * (16.3 / 9) + (3 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;			
				};
				class NvgIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_NvgIcon;
					x = 0.5 * GUI_GRID_W + (3 * (16.3 / 9) + (3 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_nvg_gs.paa";		
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";				
					onLBDrop  = "_this call TLC_inventory_dragHandler";	
				};
		
				class Stuff5BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W + (4 * (16.3 / 9) + (4 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;			
				};
				class MapIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_MapIcon;
					x = 0.5 * GUI_GRID_W + (4 * (16.3 / 9) + (4 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;	
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_map_gs.paa";	
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";		
					onLBDrop  = "_this call TLC_inventory_dragHandler";				
				};
		
				class Stuff6BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W + (5 * (16.3 / 9) + (5 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;			
				};
				class GpsIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_GpsIcon;
					x = 0.5 * GUI_GRID_W + (5 * (16.3 / 9) + (5 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_gps_gs.paa";	
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";		
					onLBDrop  = "_this call TLC_inventory_dragHandler";				
				};
		
				class Stuff7BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W + (6 * (16.3 / 9) + (6 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;			
				};
				class CompasIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_CompasIcon;
					x = 0.5 * GUI_GRID_W + (6 * (16.3 / 9) + (6 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_compass_gs.paa";		
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";		
					onLBDrop  = "_this call TLC_inventory_dragHandler";			
				};
		
				class Stuff8BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W + (7 * (16.3 / 9) + (7 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;			
				};
				class RadioIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_RadioIcon;
					x = 0.5 * GUI_GRID_W + (7 * (16.3 / 9) + (7 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_radio_gs.paa";		
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";		
					onLBDrop  = "_this call TLC_inventory_dragHandler";		
				};
		
				class Stuff9BG: RscExtremoGui_ElementBG {
					idc = -1;
					x = 0.5 * GUI_GRID_W + (8 * (16.3 / 9) + (8 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;			
				};
				class WatchIcon: RscExtremoGui_ActivePictureKeepAspect {
					idc = IDC_ExtremoInventory_WatchIcon;
					x = 0.5 * GUI_GRID_W + (8 * (16.3 / 9) + (8 * 0.2)) * GUI_GRID_W;
					y = 15.2 * GUI_GRID_H;
					w = (16.3 / 9) * GUI_GRID_W;
					h = (16.3 / 9) * GUI_GRID_H;
					text = "\a3\ui_f\data\gui\rsc\rscdisplaygear\ui_gear_watch_gs.paa";			
		
					onMouseButtonUp = "_this call TLC_inventory_actionHandler";			
					onLBDrop  = "_this call TLC_inventory_dragHandler";	
				};
			};
		};
			
		class BackPackGroup: RscControlsGroup {
			idc = IDC_ExtremoInventory_BackPackGroup;
			x = (safezoneX + 0.35 * safezoneW) + 18.9 * GUI_GRID_W;
			y = (safezoneY + 0.25 * safezoneH) - 2.2 * GUI_GRID_H;
			w = 12 * GUI_GRID_W;
			h = 20.9 * GUI_GRID_H;

			onLBDrop  = "_this call TLC_inventory_dragHandler";

			class controls {
				class InventoryHeadBg: RscExtremoGui_HeaderBG {
					idc = -1;
					x = 0;
					y = 0;
					w = 12 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;			
				};
				class BackPackLoadText: RscExtremoGui_Text {
					idc = IDC_ExtremoInventory_LoadBackPackText;
					style = ST_CENTER;
					x = 0;
					y = 0;
					w = 12 * GUI_GRID_W;
					h = 1.3 * GUI_GRID_H;		
					text = "Инвентарь";
				};
				class BackPackLoad: RscExtremoGui_RscProgress {
					idc = IDC_ExtremoInventory_LoadBackPack;			
					x = 0;
					y = 1.3 * GUI_GRID_H;
					w = 12 * GUI_GRID_W;
					h = 0.2 * GUI_GRID_H;
				};

				class InventoryBG: RscExtremoGui_DialogBG {
					idc = -1;
					x = 0;
					y = 1.7 * GUI_GRID_H;
					w = 12 * GUI_GRID_W;
					h = 17.5 * GUI_GRID_H;
				};

				class GearCombo: RscExtremoGui_Combo {
					idc = IDC_ExtremoInventory_GearCombo;		
					x = 0.5 * GUI_GRID_W;
					y = 2.3 * GUI_GRID_H;
					w = 11 * GUI_GRID_W;
					h = 1 * GUI_GRID_H;

					onLBSelChanged  = "_this call TLC_inventory_menuFilterSelect";
				};
				class GearList: RscExtremoGui_ListBox {
					idc = IDC_ExtremoInventory_GearList;	
					sizeEx = 0.65 * GUI_GRID_H;
					canDrag = true;
					x = 0.5 * GUI_GRID_W;
					y = 3.5 * GUI_GRID_H;
					w = 11 * GUI_GRID_W;
					h = 15 * GUI_GRID_H;

					onLBDblClick = "_this call TLC_inventory_dbClickHandler";
					onMouseButtonUp = "_this call TLC_inventory_clickHandler";
				};

				class GearListTakeAll: RscExtremoGui_ButtonGreen {
					idc = IDC_ExtremoInventory_GearTakeAllButton;
					x = 0;
					y = 19.4 * GUI_GRID_H;
					w = 12 * GUI_GRID_W;
					h = 1.2 * GUI_GRID_H;
					text = "Выложить всё";

					onButtonClick = "[] call TLC_inventory_storeAllToBox";
				};
			};
		};

		class BoxLootGroup: RscControlsGroup {
			idc = IDC_ExtremoInventory_BoxLootGroup;
			x = (safezoneX + 0.35 * safezoneW) - 11 * GUI_GRID_W;
			y = (safezoneY + 0.25 * safezoneH) - 2.2 * GUI_GRID_H;
			w = 10 * GUI_GRID_W;
			h = 20.6 * GUI_GRID_H;

			onLBDrop  = "_this call TLC_inventory_dragHandler";

			class controls {
				class BoxLootHead: RscExtremoGui_HeaderBG {
					idc = -1;
					x = 0;
					y = 0;
					w = 10 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};

				class BoxLootText: RscExtremoGui_Text {
					idc = IDC_ExtremoInventory_BoxHeader;
					style = ST_CENTER;
					x = 0;
					y = 0;
					w = 10 * GUI_GRID_W;
					h = 1.3 * GUI_GRID_H;		
					text = "";
				};

				class BoxLootLoad: RscExtremoGui_RscProgress {
					idc = IDC_ExtremoInventory_BoxLoad;			
					x = 0;
					y = 1.3 * GUI_GRID_H;
					w = 10 * GUI_GRID_W;
					h = 0.2 * GUI_GRID_H;
				};
		
				class BoxLootBG: RscExtremoGui_DialogBG {
					idc = -1;
					x = 0;
					y = 1.7 * GUI_GRID_H;
					w = 10 * GUI_GRID_W;
					h = 17.5 * GUI_GRID_H;
				};
		
				class BoxLootList: RscExtremoGui_ListBox {
					idc = IDC_ExtremoInventory_BoxList;
					x = 0.5 * GUI_GRID_W;
					y = 2.2 * GUI_GRID_H;
					w = 9 * GUI_GRID_W;
					h = 16.5 * GUI_GRID_H;
					
					canDrag = true;
					onLBDblClick = "_this call TLC_inventory_dbClickHandler";
					onMouseButtonUp = "_this call TLC_inventory_clickHandler";
				};
		
				class BoxLootTakeAll: RscExtremoGui_ButtonGreen {
					idc = -1;
					x = 0;
					y = 19.4 * GUI_GRID_H;
					w = 10 * GUI_GRID_W;
					h = 1.2 * GUI_GRID_H;
					text = "Взять всё";
					onButtonClick = "[] call TLC_inventory_takeAllFromBox";						
				};

			};
		};			

	class controls {
		class TabsGroup: RscControlsGroup {
			moving = 1;
			idc = IDC_ExtremoInventory_TabsGroup;
			x = (safezoneX + 0.35 * safezoneW) - 0.5 * GUI_GRID_W;
			y = (safezoneY + 0.25 * safezoneH) - 2.2 * GUI_GRID_H;
			w = 18.9 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;

			class controls {
				class TabsBg: RscExtremoGui_DialogBG {
					idc = -1;
					x = 0;
					y = 0;
					w = 18.9 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
				};

				class TabsInvButton: RscExtremoGui_InvTabButton {
					idc = IDC_ExtremoInventory_TabsInvButton;
					x = 0 * GUI_GRID_W;
					y = 0;
					w = 4 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "ИНВЕНТАРЬ";
					onButtonclick = "[] spawn TLC_inventory_menuOpen";
				};

				class TabsCraftButton: RscExtremoGui_InvTabButton {
					idc = IDC_ExtremoInventory_TabsCraftButton;
					x = 4 * GUI_GRID_W;
					y = 0;
					w = 2 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "КРАФТЫ";
					onButtonclick = "[] spawn TLC_crafting_Menu";			
				};

				class TabsPadtButton: RscExtremoGui_InvTabButton {
					idc = IDC_ExtremoInventory_TabsPadButton;
					x = 6 * GUI_GRID_W;
					y = 0;
					w = 3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "ПЛАНШЕТ";
					onButtonclick = "[] spawn TLC_pad_openMain";
				};

				class TabsProgresstButton: RscExtremoGui_InvTabButton {
					idc = IDC_ExtremoInventory_TabsProgressButton;
					x = 9 * GUI_GRID_W;
					y = 0;
					w = 3 * GUI_GRID_W;
					h = 1.5 * GUI_GRID_H;
					text = "РАЗВИТИЕ";
				};
			};
		};
	};
};
};