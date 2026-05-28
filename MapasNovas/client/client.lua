-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST ISLAND
-----------------------------------------------------------------------------------------------------------------------------------------
--[[
CreateThread(function()
    while true do
        local idle = 1000
        local ped = PlayerPedId()
        local coords = vec3(4895.28,-5744.58,26.351)
        local loaded = false
        local pos = GetEntityCoords(ped)
        local dist = GetDistanceBetweenCoords(coords,pos,false);
        if dist <= 2000 and not loaded then
            idle = 1
            Citizen.InvokeNative(0x9A9D1BA639675CF1, 'HeistIsland', true)
            Citizen.InvokeNative(0xF74B1FFA4A15FBEA, true)
            Citizen.InvokeNative(0x53797676AD34A9AA, false)    
            SetScenarioGroupEnabled('Heist_Island_Peds', true)
            SetAudioFlag('PlayerOnDLCHeist4Island', true)
            SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Zones', true, true)
            SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Disabled_Zones', false, true)
            loaded = true
        else
            Citizen.InvokeNative(0x9A9D1BA639675CF1, 'HeistIsland', false)
            loaded = false
        end

    	Wait(idle)
    end
end)

CreateThread(function()
	SetRadarAsExteriorThisFrame()
	SetRadarAsInteriorThisFrame("h4_fake_islandx",vec(4700.0,-5145.0),0,0)
--   while true do
-- 		Wait(50)
-- 		SetRadarAsExteriorThisFrame()
-- 		SetRadarAsInteriorThisFrame("h4_fake_islandx",vec(4700.0,-5145.0),0,0)
-- 	end
end) ]]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- -- MOTOCLUB
-- ------------------------------------------------------------------------------------------------------------------------------------------
--[[ RequestIpl('bkr_biker_dlc_int_02')
RequestIpl('gabz_biker_milo_')
interiorID = GetInteriorAtCoords(994.47870000, -122.99490000, 73.11467000)
if IsValidInterior(interiorID) then
 --   EnableInteriorProp(interiorID, 'walls_01')
    EnableInteriorProp(interiorID, 'lower_walls_default')
    EnableInteriorProp(interiorID, 'furnishings_02')
    --EnableInteriorProp(interiorID, 'mural_03')
    EnableInteriorProp(interiorID, 'decorative_02')
    EnableInteriorProp(interiorID, 'gun_locker')
    EnableInteriorProp(interiorID, 'mod_booth')
 --   EnableInteriorProp(interiorID, 'meth_small')
 --   EnableInteriorProp(interiorID, 'meth_medium')
    EnableInteriorProp(interiorID, 'meth_large')
 --   EnableInteriorProp(interiorID, 'cash_small')
 --   EnableInteriorProp(interiorID, 'cash_medium')
    EnableInteriorProp(interiorID, 'cash_large')
  --  EnableInteriorProp(interiorID, 'weed_small')
  --  EnableInteriorProp(interiorID, 'weed_medium')
    EnableInteriorProp(interiorID, 'weed_large')
  --  EnableInteriorProp(interiorID, 'coke_small')
  --  EnableInteriorProp(interiorID, 'coke_medium')
    EnableInteriorProp(interiorID, 'coke_large')
 --   EnableInteriorProp(interiorID, 'counterfeit_small')
 --   EnableInteriorProp(interiorID, 'counterfeit_medium')
    EnableInteriorProp(interiorID, 'counterfeit_large')
 --   EnableInteriorProp(interiorID, 'id_small')
 --   EnableInteriorProp(interiorID, 'id_medium')
    EnableInteriorProp(interiorID, 'id_large')
 --   SetInteriorPropColor(interiorID, 'walls_01', 8)
    SetInteriorPropColor(interiorID, 'lower_walls_default', 8)
    RefreshInterior(interiorID)
end ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- IPLLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	LoadMpDlcMaps()
	EnableMpDlcMaps(true)
	RequestIpl("h4_islandairstrip")
    RequestIpl("h4_islandairstrip_props")
    RequestIpl("h4_islandx_mansion")
    RequestIpl("h4_islandx_mansion_props")
    RequestIpl("h4_islandx_props")
    RequestIpl("h4_islandxdock")
    RequestIpl("h4_islandxdock_props")
    RequestIpl("h4_islandxdock_props_2")
    RequestIpl("h4_islandxtower")
    RequestIpl("h4_islandx_maindock")
    RequestIpl("h4_islandx_maindock_props")
    RequestIpl("h4_islandx_maindock_props_2")
    RequestIpl("h4_IslandX_Mansion_Vault")
    RequestIpl("h4_islandairstrip_propsb")
    RequestIpl("h4_beach")
    RequestIpl("h4_beach_props")
    RequestIpl("h4_beach_bar_props")
    RequestIpl("h4_islandx_barrack_props")
    RequestIpl("h4_islandx_checkpoint")
    RequestIpl("h4_islandx_checkpoint_props")
    RequestIpl("h4_islandx_Mansion_Office")
    RequestIpl("h4_islandx_Mansion_LockUp_01")
    RequestIpl("h4_islandx_Mansion_LockUp_02")
    RequestIpl("h4_islandx_Mansion_LockUp_03")
    RequestIpl("h4_islandairstrip_hangar_props")
    RequestIpl("h4_IslandX_Mansion_B")
    RequestIpl("h4_islandairstrip_doorsclosed")
    RequestIpl("h4_Underwater_Gate_Closed")
    RequestIpl("h4_mansion_gate_closed")
    RequestIpl("h4_aa_guns")
    RequestIpl("h4_IslandX_Mansion_GuardFence")
    RequestIpl("h4_IslandX_Mansion_Entrance_Fence")
    RequestIpl("h4_IslandX_Mansion_B_Side_Fence")
    RequestIpl("h4_IslandX_Mansion_Lights")
    RequestIpl("h4_islandxcanal_props")
    RequestIpl("h4_beach_props_party")
    RequestIpl("h4_islandX_Terrain_props_06_a")
    RequestIpl("h4_islandX_Terrain_props_06_b")
    RequestIpl("h4_islandX_Terrain_props_06_c")
    RequestIpl("h4_islandX_Terrain_props_05_a")
    RequestIpl("h4_islandX_Terrain_props_05_b")
    RequestIpl("h4_islandX_Terrain_props_05_c")
    RequestIpl("h4_islandX_Terrain_props_05_d")
    RequestIpl("h4_islandX_Terrain_props_05_e")
    RequestIpl("h4_islandX_Terrain_props_05_f")
    RequestIpl("H4_islandx_terrain_01")
    RequestIpl("H4_islandx_terrain_02")
    RequestIpl("H4_islandx_terrain_03")
    RequestIpl("H4_islandx_terrain_04")
    RequestIpl("H4_islandx_terrain_05")
    RequestIpl("H4_islandx_terrain_06")
    RequestIpl("h4_ne_ipl_00")
    RequestIpl("h4_ne_ipl_01")
    RequestIpl("h4_ne_ipl_02")
    RequestIpl("h4_ne_ipl_03")
    RequestIpl("h4_ne_ipl_04")
    RequestIpl("h4_ne_ipl_05")
    RequestIpl("h4_ne_ipl_06")
    RequestIpl("h4_ne_ipl_07")
    RequestIpl("h4_ne_ipl_08")
    RequestIpl("h4_ne_ipl_09")
    RequestIpl("h4_nw_ipl_00")
    RequestIpl("h4_nw_ipl_01")
    RequestIpl("h4_nw_ipl_02")
    RequestIpl("h4_nw_ipl_03")
    RequestIpl("h4_nw_ipl_04")
    RequestIpl("h4_nw_ipl_05")
    RequestIpl("h4_nw_ipl_06")
    RequestIpl("h4_nw_ipl_07")
    RequestIpl("h4_nw_ipl_08")
    RequestIpl("h4_nw_ipl_09")
    RequestIpl("h4_se_ipl_00")
    RequestIpl("h4_se_ipl_01")
    RequestIpl("h4_se_ipl_02")
    RequestIpl("h4_se_ipl_03")
    RequestIpl("h4_se_ipl_04")
    RequestIpl("h4_se_ipl_05")
    RequestIpl("h4_se_ipl_06")
    RequestIpl("h4_se_ipl_07")
    RequestIpl("h4_se_ipl_08")
    RequestIpl("h4_se_ipl_09")
    RequestIpl("h4_sw_ipl_00")
    RequestIpl("h4_sw_ipl_01")
    RequestIpl("h4_sw_ipl_02")
    RequestIpl("h4_sw_ipl_03")
    RequestIpl("h4_sw_ipl_04")
    RequestIpl("h4_sw_ipl_05")
    RequestIpl("h4_sw_ipl_06")
    RequestIpl("h4_sw_ipl_07")
    RequestIpl("h4_sw_ipl_08")
    RequestIpl("h4_sw_ipl_09")
    RequestIpl("h4_islandx_mansion")
    RequestIpl("h4_islandxtower_veg")
    RequestIpl("h4_islandx_sea_mines")
    RequestIpl("h4_islandx")
    RequestIpl("h4_islandx_barrack_hatch")
    RequestIpl("h4_islandxdock_water_hatch")
    RequestIpl("h4_beach_party")
    SetDeepOceanScaler(0.0)
	RequestIpl("Coroner_Int_On")
	RequestIpl("chop_props")

	-- CASINO


	------------------------------------------------------------------------------------------------------------------------------------------
-- ARCADE
------------------------------------------------------------------------------------------------------------------------------------------
RequestIpl('ch_int_placement_ch_interior_1_dlc_arcade_milo_')
local interiorid = GetInteriorAtCoords(710.8793, -813.11, 15.1989193)
if IsValidInterior(interiorid) then
    EnableInteriorProp(interiorid, 'casino_arcade_style_02')
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_texture_style_03')
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_wall_06')
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_streetgames_01')
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_wallmonitors')
    EnableInteriorProp(interiorid, 'casino_arcade_no_idea') -- Some floor stuff
    EnableInteriorProp(interiorid, 'casino_arcade_no_idea2') -- Neon stuff i think
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_barstuff')
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_walltv')
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_lights_01') -- This also has trophies etc
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_lights_02')
    EnableInteriorProp(interiorid, 'casino_arcade_extraprops_wire') -- Main Arcade room ligting, cables and arcade props
    RefreshInterior(interiorid)
end

	RequestIpl('vw_casino_main')
	RequestIpl('vw_casino_carpark')
	RequestIpl('vw_casino_garage')
	RequestIpl('vw_casino_penthouse')
	RequestIpl('hei_dlc_casino_aircon')
	RequestIpl('hei_dlc_casino_aircon_lod')
	RequestIpl('hei_dlc_casino_door')
	RequestIpl('hei_dlc_casino_door_lod')
	RequestIpl('hei_dlc_vw_roofdoors_locked')
	RequestIpl('hei_dlc_windows_casino')
	RequestIpl('hei_dlc_windows_casino_lod')
	RequestIpl('vw_ch3_additions')
	RequestIpl('vw_ch3_additions_long_0')
	RequestIpl('vw_ch3_additions_strm_0')
	RequestIpl('vw_dlc_casino_door')
	RequestIpl('vw_dlc_casino_door_lod')
	RequestIpl('vw_casino_billboard')
	RequestIpl('vw_casino_billboard_lod(1)')
	RequestIpl('vw_casino_billboard_lod')
	RequestIpl('vw_int_placement_vw')
	RequestIpl('vw_dlc_casino_apart')
	
	RemoveIpl("hei_bi_hw1_13_door")
	RequestIpl("v_rockclub")
	RequestIpl("rc12b_default")
	RequestIpl("rc12b_hospitalinterior_lod")
	RequestIpl("rc12b_fixed")
	RequestIpl("rc12b_hospitalinterior")
	RequestIpl("lr_sc1_02_interior_0_supermod_int_milo_")
	--RequestIpl("rc12b_destroyed")
	RemoveIpl("shutter_open")
	RemoveIpl("csr_inMission")
	RequestIpl("v_carshowroom")
	RequestIpl("shr_int")
	RequestIpl("shutter_closed")
	RequestIpl("FINBANK")
	RemoveIpl("facelobbyfake")
	RequestIpl("facelobby")
	RemoveIpl("CS1_02_cf_offmission")
	RequestIpl("CS1_02_cf_onmission1")
	RequestIpl("CS1_02_cf_onmission2")
	RequestIpl("CS1_02_cf_onmission3")
	RequestIpl("CS1_02_cf_onmission4")
	RequestIpl("des_farmhouse")
	RequestIpl("imp_dt1_11_modgarage")
	--RequestIpl("des_farmhs_endimap")
	--RequestIpl("des_farmhs_end_occl")
	RequestIpl("des_farmhs_startimap")
	RequestIpl("des_farmhs_start_occl")
	RequestIpl("farm")
	--RemoveIpl("farm_burnt")
	--RemoveIpl("farm_burnt_props")
	RemoveIpl("farmint_cap")
	RequestIpl("farmint")
	RemoveIpl("farm_props")
	RequestIpl("FIBlobby")
	RemoveIpl("FIBlobbyfake")
	RequestIpl("FBI_colPLUG")
	RequestIpl("FBI_repair")
	RemoveIpl("id2_14_during_door")
	RemoveIpl("id2_14_during2")
	RemoveIpl("id2_14_on_fire")
	RemoveIpl("id2_14_post_no_int")
	RemoveIpl("id2_14_pre_no_int")
	RequestIpl("id2_14_during1")
	RequestIpl("TrevorsMP")
	RequestIpl("TrevorsTrailer")
	RequestIpl("TrevorsTrailerTidy")
	RequestIpl("TrevorsTrailerTrash")
	RemoveIpl("DT1_03_Gr_Closed")
	RemoveIpl("DT1_03_Shutter")
	RequestIpl("yogagame")
	RequestIpl("v_tunnel_hole")
	RequestIpl("V_Michael")
	RequestIpl("V_Michael_Garage")
	RequestIpl("V_Michael_FameShame")
	RequestIpl("V_Michael_JewelHeist")
	RequestIpl("V_Michael_plane_ticket")
	RequestIpl("V_Michael_Scuba")
	RemoveIpl("smboat")
	RequestIpl("hei_yacht_heist")
	RequestIpl("hei_yacht_heist_Bar")
	RequestIpl("hei_yacht_heist_Bedrm")
	RequestIpl("hei_yacht_heist_Bridge")
	RequestIpl("hei_yacht_heist_DistantLights")
	RequestIpl("hei_yacht_heist_enginrm")
	RequestIpl("hei_yacht_heist_LODLights")
	RequestIpl("hei_yacht_heist_Lounge")
	RequestIpl("cargoship")
	RemoveIpl("sp1_10_fake_interior")
	RemoveIpl("sp1_10_fake_interior_lod")
	RequestIpl("SC1_01_NewBill")
	RequestIpl("hw1_02_newbill")
	RequestIpl("hw1_emissive_newbill")
	RequestIpl("sc1_14_newbill")
	RequestIpl("dt1_17_newbill")
	RequestIpl("SC1_01_OldBill")
	RequestIpl("SC1_30_Keep_Closed")
	RequestIpl("refit_unload")
	RequestIpl("post_hiest_unload")
	RequestIpl("occl_meth_grp1")
	RequestIpl("Michael_premier")
	RemoveIpl("DT1_05_HC_REMOVE")
	RequestIpl("DT1_05_HC_REQ")
	RequestIpl("DT1_05_REQUEST")
	RemoveIpl("jewel2fake")
	RemoveIpl("bh1_16_refurb")
	RemoveIpl("ch1_02_closed")
	RemoveIpl("scafstartimap")
	RequestIpl("scafendimap")
	RemoveIpl("bh1_16_doors_shut")
	--RequestIpl("ferris_finale_Anim")
	RequestIpl("des_stilthouse_rebuild")
	RequestIpl("CS2_06_TriAf02")
	--RequestIpl("cs3_07_mpgates")
	RequestIpl("CS4_08_TriAf02")
	RequestIpl("CS4_04_TriAf03")
	RequestIpl("AP1_04_TriAf01")
	RequestIpl("gr_case0_bunkerclosed")
	RequestIpl("gr_case1_bunkerclosed")
	RequestIpl("gr_case2_bunkerclosed")
	RequestIpl("gr_case3_bunkerclosed")
	RequestIpl("gr_case4_bunkerclosed")
	RequestIpl("gr_case5_bunkerclosed")
	RequestIpl("gr_case6_bunkerclosed")
	RequestIpl("gr_case7_bunkerclosed")
	RequestIpl("gr_case9_bunkerclosed")
	RequestIpl("gr_case10_bunkerclosed")
	RequestIpl("gr_case11_bunkerclosed")
	RequestIpl("cs5_4_trains")
	RequestIpl("chophillskennel")
	RequestIpl("bnkheist_apt_dest")
	RequestIpl("bnkheist_apt_norm")
	RequestIpl("redcarpet")
	RequestIpl("hei_sm_16_interior_v_bahama_milo_")
	RequestIpl("cs3_05_water_grp1")
	RequestIpl("cs3_05_water_grp1_lod")
	RequestIpl("cs3_05_water_grp2")
	RequestIpl("cs3_05_water_grp2_lod")
	--RequestIpl("railing_start")
	--RequestIpl("railing_end")
	RequestIpl("canyonriver01")
	RequestIpl("canyonriver01_lod")
	RequestIpl("bh1_47_joshhse_unburnt")
	RequestIpl("bh1_47_joshhse_unburnt_lod")
	RequestIpl("bkr_bi_hw1_13_int")
	RequestIpl("CanyonRvrShallow")
	RequestIpl("methtrailer_grp1")
	RequestIpl("lr_cs6_08_grave_closed")
	RequestIpl("bkr_bi_id1_23_door")
	RequestIpl("ch1_02_open")
	RequestIpl("sp1_10_real_interior")
	RequestIpl("sp1_10_real_interior_lod")
	RequestIpl("Carwash_with_spinners")
	RequestIpl("apa_v_mp_h_01_a")
	RequestIpl("apa_v_mp_h_06_b")
	RequestIpl("apa_v_mp_h_08_c")
	RequestIpl("ex_dt1_02_office_01c")
	RequestIpl("ex_dt1_11_office_01b")
	RequestIpl("ex_sm_13_office_01a")
	RequestIpl("ex_sm_15_office_02b")
	RequestIpl("bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo")
	RequestIpl("bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware03_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware04_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware05_milo")
	RequestIpl("bkr_biker_interior_placement_interior_3_biker_dlc_int_ware02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo")
	RequestIpl("bkr_biker_interior_placement_interior_5_biker_dlc_int_ware04_milo")
	RequestIpl("bkr_biker_interior_placement_interior_6_biker_dlc_int_ware05_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_1_int_warehouse_s_dlc_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_0_int_warehouse_m_dlc_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_2_int_warehouse_l_dlc_milo")
	RequestIpl("imp_impexp_interior_placement")
	RequestIpl("imp_impexp_interior_placement_interior_0_impexp_int_01_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_1_impexp_intwaremed_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_2_imptexp_mod_int_01_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_3_impexp_int_02_milo_")
	RequestIpl("gr_entrance_placement")
	RequestIpl("gr_grdlc_interior_placement")
	RequestIpl("gr_grdlc_interior_placement_interior_0_grdlc_int_01_milo_")
	RequestIpl("gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_")
	RequestIpl("ch3_rd2_bishopschickengraffiti")
	RequestIpl("cs5_04_mazebillboardgraffiti")
	RequestIpl("cs5_roads_ronoilgraffiti")
	RequestIpl("ba_barriers_case0")
	RequestIpl("ba_case0_forsale")
	RequestIpl("ba_case0_dixon")
	RequestIpl("ba_case0_madonna")
	RequestIpl("ba_case0_solomun")
	RequestIpl("ba_case0_taleofus")
	RequestIpl("ba_barriers_case1")
	RequestIpl("ba_case1_forsale")
	RequestIpl("ba_case1_dixon")
	RequestIpl("ba_case1_madonna")
	RequestIpl("ba_case1_solomun")
	RequestIpl("ba_case1_taleofus")
	RequestIpl("ba_barriers_case2")
	RequestIpl("ba_case2_forsale")
	RequestIpl("ba_case2_dixon")
	RequestIpl("ba_case2_madonna")
	RequestIpl("ba_case2_solomun")
	RequestIpl("ba_case2_taleofus")
	RequestIpl("ba_barriers_case3")
	RequestIpl("ba_case3_forsale")
	RequestIpl("ba_case3_dixon")
	RequestIpl("ba_case3_madonna")
	RequestIpl("ba_case3_solomun")
	RequestIpl("ba_case3_taleofus")
	RequestIpl("ba_barriers_case4")
	RequestIpl("ba_case4_forsale")
	RequestIpl("ba_case4_dixon")
	RequestIpl("ba_case4_madonna")
	RequestIpl("ba_case4_solomun")
	RequestIpl("ba_case4_taleofus")
	RequestIpl("ba_barriers_case5")
	RequestIpl("ba_case5_forsale")
	RequestIpl("ba_case5_dixon")
	RequestIpl("ba_case5_madonna")
	RequestIpl("ba_case5_solomun")
	RequestIpl("ba_case5_taleofus")
	RequestIpl("ba_barriers_case6")
	RequestIpl("ba_case6_forsale")
	RequestIpl("ba_case6_dixon")
	RequestIpl("ba_case6_madonna")
	RequestIpl("ba_case6_solomun")
	RequestIpl("ba_case6_taleofus")
	RequestIpl("ba_barriers_case7")
	RequestIpl("ba_case7_forsale")
	RequestIpl("ba_case7_dixon")
	RequestIpl("ba_case7_madonna")
	RequestIpl("ba_case7_solomun")
	RequestIpl("ba_case7_taleofus")
	RequestIpl("ba_barriers_case8")
	RequestIpl("ba_case8_forsale")
	RequestIpl("ba_case8_dixon")
	RequestIpl("ba_case8_madonna")
	RequestIpl("ba_case8_solomun")
	RequestIpl("ba_case8_taleofus")
	RemoveIpl("ba_case9_taleofus")
    RemoveIpl("ba_case9_solomun")
    RemoveIpl("ba_case9_madonna")
    RemoveIpl("ba_case9_forsale")
    RemoveIpl("ba_case9_dixon")
    RemoveIpl("ba_barriers_case9")
	RequestIpl("gr_grdlc_yacht_lod")
	RequestIpl("gr_grdlc_yacht_placement")
	RequestIpl("gr_heist_yacht2")
	RequestIpl("gr_heist_yacht2_bar")
	RequestIpl("gr_heist_yacht2_bar_lod")
	RequestIpl("gr_heist_yacht2_bedrm")
	RequestIpl("gr_heist_yacht2_bedrm_lod")
	RequestIpl("gr_heist_yacht2_bridge")
	RequestIpl("gr_heist_yacht2_bridge_lod")
	RequestIpl("gr_heist_yacht2_enginrm")
	RequestIpl("gr_heist_yacht2_enginrm_lod")
	RequestIpl("gr_heist_yacht2_lod")
	RequestIpl("gr_heist_yacht2_lounge")
	RequestIpl("gr_heist_yacht2_lounge_lod")
	RequestIpl("gr_heist_yacht2_slod")
	RequestIpl("hei_carrier")
	RequestIpl("hei_carrier_DistantLights")
	RequestIpl("hei_Carrier_int1")
	RequestIpl("hei_Carrier_int2")
	RequestIpl("hei_Carrier_int3")
	RequestIpl("hei_Carrier_int4")
	RequestIpl("hei_Carrier_int5")
	RequestIpl("hei_Carrier_int6")
	RequestIpl("hei_carrier_LODLights")
	--[[RequestIpl("prologue01")
	RequestIpl("prologue01c")
	RequestIpl("prologue01d")
	RequestIpl("prologue01e")
	RequestIpl("prologue01f")
	RequestIpl("prologue01g")
	RequestIpl("prologue01h")
	RequestIpl("prologue01i")
	RequestIpl("prologue01j")
	RequestIpl("prologue01k")
	RequestIpl("prologue01z")
	RequestIpl("prologue02")
	RequestIpl("prologue03")
	RequestIpl("prologue03b")
	RequestIpl("prologue03_grv_dug")
	RequestIpl("prologue_grv_torch")
	RequestIpl("prologue04")
	RequestIpl("prologue04b")
	RequestIpl("prologue04_cover")
	RequestIpl("des_protree_end")
	RequestIpl("des_protree_start")
	RequestIpl("prologue05")
	RequestIpl("prologue05b")
	RequestIpl("prologue06")
	RequestIpl("prologue06b")
	RequestIpl("prologue06_int")
	RequestIpl("prologue06_pannel")
	RequestIpl("plg_occl_00")
	RequestIpl("prologue_occl")
	RequestIpl("prologuerd")
	RequestIpl("prologuerdb")]]
	RequestIpl("xs_arena_interior")
	RequestIpl("xs_arena_interior_vip")
	EnableInteriorProp(GetInteriorAtCoords(2800.00,-3800.00,100.00),"Set_Crowd_A")
	EnableInteriorProp(GetInteriorAtCoords(2800.00,-3800.00,100.00),"Set_Crowd_B")
	EnableInteriorProp(GetInteriorAtCoords(2800.00,-3800.00,100.00),"Set_Crowd_C")
	EnableInteriorProp(GetInteriorAtCoords(2800.00,-3800.00,100.00),"Set_Crowd_D")
	EnableInteriorProp(GetInteriorAtCoords(2800.00,-3800.00,100.00),"Set_Scifi_Scene")
	EnableInteriorProp(GetInteriorAtCoords(2800.00,-3800.00,100.00),"Set_Scifi_03")
	RequestIpl("hei_hw1_blimp_interior_v_studio_lo_milo_")
end)

local function getInterriorByType(x, y, z, name, iplName)
	local id = 0

	if not IsIplActive(iplName) then
		RequestIpl(iplName)

		while not IsIplActive(iplName) do
			RequestIpl(iplName)
			--print("Request Ipl:", iplName)
			Citizen.Wait(100)
		end
	end

	while id == 0 do
		id = GetInteriorAtCoordsWithType(x, y, z, name)
		--print("Interrior:", name, id)
		Citizen.Wait(100)
	end

	return id
end

Citizen.CreateThread(function()
	RequestIpl("vw_casino_penthouse")
	RequestIpl("hei_dlc_windows_casino")
	local penthouse = getInterriorByType(976.6364,70.2947,115.1641,"vw_dlc_casino_apart", "vw_casino_penthouse")
	local uj_casino_vault = getInterriorByType(946.251,43.2715,58.9172,"uj_casino_vault", "uj_casino_vault_milo_")
	local uj_casino_main = getInterriorByType(935.1050,42.5656,71.2737,"uj_casino_main", "uj_casino_main_milo_")
	local uj_casino_back = getInterriorByType(974.5600,22.5161,70.8396,"uj_casino_back", "uj_casino_back_milo_")
	local uj_casino_tunnel = getInterriorByType(930.1539,-0.2010,59.1323,"uj_casino_tunnel", "uj_casino_tunnel_milo_")

	EnableInteriorProp(penthouse, "set_pent_tint_shell")
	DisableInteriorProp(penthouse, "set_pent_bar_party_1")  
	EnableInteriorProp(penthouse, "set_pent_media_bar_open")
	EnableInteriorProp(penthouse, "set_pent_spa_bar_open")
	EnableInteriorProp(penthouse, "set_pent_dealer")
	DisableInteriorProp(penthouse, "set_pent_nodealer")
	DisableInteriorProp(penthouse, "set_pent_media_bar_closed")
	DisableInteriorProp(penthouse, "set_pent_spa_bar_closed")
	DisableInteriorProp(penthouse, "set_pent_pattern_01")
	DisableInteriorProp(penthouse, "set_pent_pattern_03")
	DisableInteriorProp(penthouse, "set_pent_pattern_02")
	DisableInteriorProp(penthouse, "set_pent_pattern_04")
	DisableInteriorProp(penthouse, "set_pent_pattern_05")
	DisableInteriorProp(penthouse, "set_pent_pattern_06")
	DisableInteriorProp(penthouse, "set_pent_pattern_07")
	DisableInteriorProp(penthouse, "set_pent_pattern_08")
	EnableInteriorProp(penthouse, "set_pent_pattern_09")
	DisableInteriorProp(penthouse, "set_pent_arcade_modern")
	EnableInteriorProp(penthouse, "set_pent_arcade_retro")
	EnableInteriorProp(penthouse, "set_pent_clutter_03")
	EnableInteriorProp(penthouse, "set_pent_clutter_02")
	EnableInteriorProp(penthouse, "set_pent_clutter_01")
	DisableInteriorProp(penthouse, "set_pent_lounge_blocker")
	DisableInteriorProp(penthouse, "set_pent_guest_blocker")
	DisableInteriorProp(penthouse, "set_pent_office_blocker")
	DisableInteriorProp(penthouse, "set_pent_cine_blocker")
	DisableInteriorProp(penthouse, "set_pent_spa_blocker")
	DisableInteriorProp(penthouse, "set_pent_bar_blocker")
	DisableInteriorProp(penthouse, "set_pent_bar_party_after")
	DisableInteriorProp(penthouse, "set_pent_bar_clutter")
	EnableInteriorProp(penthouse, "set_pent_bar_party_2")
	DisableInteriorProp(penthouse, "set_pent_bar_light_0")
	DisableInteriorProp(penthouse, "set_pent_bar_light_01")
	DisableInteriorProp(penthouse, "set_pent_bar_light_02")
	DisableInteriorProp(penthouse, "set_pent_bar_party_0")
	DisableInteriorProp(penthouse, "set_pent_bar_party_1")

    SetInteriorEntitySetColor(penthouse,"set_pent_tint_shell","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_1","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_tint_shell","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_media_bar_open","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_spa_bar_open","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_dealer","0") -- Дверцы
    SetInteriorEntitySetColor(penthouse, "set_pent_nodealer","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_media_bar_closed","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_spa_bar_closed","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_01","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_03","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_02","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_04","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_05","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_06","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_07","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_08","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_09","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_arcade_modern","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_arcade_retro","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_clutter_03","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_clutter_02","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_clutter_01","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_lounge_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_guest_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_office_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_cine_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_spa_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_after","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_clutter","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_2","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_light_0","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_light_01","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_light_02","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_0","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_1","0")
	RefreshInterior(penthouse)

	EnableInteriorProp(uj_casino_vault, "set_vault_diamonds_02")
	EnableInteriorProp(uj_casino_vault, "set_vault_diamonds_01")
	EnableInteriorProp(uj_casino_vault, "set_vault_gold_02")
	EnableInteriorProp(uj_casino_vault, "set_vault_gold_01")
	EnableInteriorProp(uj_casino_vault, "set_vault_art_02")
	EnableInteriorProp(uj_casino_vault, "set_vault_art_01")
	EnableInteriorProp(uj_casino_vault, "set_vault_cash_02")
	EnableInteriorProp(uj_casino_vault, "set_vault_cash_01")
	EnableInteriorProp(uj_casino_vault, "set_vault_dressing")
	EnableInteriorProp(uj_casino_vault, "set_spawn_group2")
	EnableInteriorProp(uj_casino_vault, "set_spawn_group1")
	DisableInteriorProp(uj_casino_vault, "set_vault_door_broken")
	EnableInteriorProp(uj_casino_vault, "set_vault_door")
	DisableInteriorProp(uj_casino_vault, "set_vault_door_closed")
	RefreshInterior(uj_casino_vault)

	EnableInteriorProp(uj_casino_main, "casino_manager_default")
	EnableInteriorProp(uj_casino_main, "casino_manager_workout")
	RefreshInterior(uj_casino_main)

	EnableInteriorProp(uj_casino_back, "casino_back_laundry_damage")
	RefreshInterior(uj_casino_back)
	
	EnableInteriorProp(uj_casino_tunnel, "set_tunnel_collapse")
	RefreshInterior(uj_casino_tunnel)
end)















exports('GetDiamondPenthouseObject', function()
    return DiamondPenthouse
end)

-- Penthouse: 976.636 70.295 115.164

DiamondPenthouse = {
    interiorId = 274689,

    Ipl = {
        Interior = {
            ipl = "vw_casino_penthouse",

            Load = function()
                EnableIpl(DiamondPenthouse.Ipl.Interior.ipl, true)
                SetIplPropState(DiamondPenthouse.interiorId, "Set_Pent_Tint_Shell", true, true)
            end,
            Remove = function()
                EnableIpl(DiamondPenthouse.Ipl.Interior.ipl, false)
            end
        }
    },
    Colors = {
        default = 0,
        sharp = 1,
        vibrant = 2,
        timeless = 3
    },
    Interior = {
        Walls = {
            SetColor = function(color, refresh)
                SetInteriorEntitySetColor(DiamondPenthouse.interiorId, "Set_Pent_Tint_Shell", color)

                if refresh then
                    RefreshInterior(DiamondPenthouse.interiorId)
                end
            end
        },
        Pattern = {
            pattern01 = "Set_Pent_Pattern_01",
            pattern02 = "Set_Pent_Pattern_02",
            pattern03 = "Set_Pent_Pattern_03",
            pattern04 = "Set_Pent_Pattern_04",
            pattern05 = "Set_Pent_Pattern_05",
            pattern06 = "Set_Pent_Pattern_06",
            pattern07 = "Set_Pent_Pattern_07",
            pattern08 = "Set_Pent_Pattern_08",
            pattern09 = "Set_Pent_Pattern_09",

            Set = function(pattern, refresh)
                DiamondPenthouse.Interior.Pattern.Clear(false)

                SetIplPropState(DiamondPenthouse.interiorId, pattern, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.Pattern) do
                    if type(value) == "string" then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end,
            SetColor = function(pattern, color, refresh)
                SetInteriorEntitySetColor(DiamondPenthouse.interiorId, pattern, color)

                if refresh then
                    RefreshInterior(DiamondPenthouse.interiorId)
                end
            end
        },
        SpaBar = {
            open = "Set_Pent_Spa_Bar_Open",
            closed = "Set_Pent_Spa_Bar_Closed",

            Set = function(state, refresh)
                DiamondPenthouse.Interior.SpaBar.Clear(false)

                SetIplPropState(DiamondPenthouse.interiorId, state, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.SpaBar) do
                    if type(value) == "string" then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        MediaBar = {
            open = "Set_Pent_Media_Bar_Open",
            closed = "Set_Pent_Media_Bar_Closed",

            Set = function(state, refresh)
                DiamondPenthouse.Interior.MediaBar.Clear(false)

                SetIplPropState(DiamondPenthouse.interiorId, state, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.MediaBar) do
                    if type(value) == "string" then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        Dealer = {
            open = "Set_Pent_Dealer",
            closed = "Set_Pent_NoDealer",

            Set = function(state, refresh)
                DiamondPenthouse.Interior.Dealer.Clear(false)

                SetIplPropState(DiamondPenthouse.interiorId, state, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.Dealer) do
                    if type(value) == "string" then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        Arcade = {
            none = "",
            retro = "Set_Pent_Arcade_Retro",
            modern = "Set_Pent_Arcade_Modern",

            Set = function(arcade, refresh)
                DiamondPenthouse.Interior.Arcade.Clear(false)

                SetIplPropState(DiamondPenthouse.interiorId, arcade, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.Arcade) do
                    if type(value) == "string" then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        Clutter = {
            bar = "Set_Pent_Bar_Clutter",
            clutter01 = "Set_Pent_Clutter_01",
            clutter02 = "Set_Pent_Clutter_02",
            clutter03 = "Set_Pent_Clutter_03",

            Set = function(clutter, refresh)
                DiamondPenthouse.Interior.Clutter.Clear(false)

                SetIplPropState(DiamondPenthouse.interiorId, clutter, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.Clutter) do
                    if type(value) == "string" then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        BarLight = {
            none = "",
            light0 = "set_pent_bar_light_0",
            light1 = "set_pent_bar_light_01",
            light2 = "set_pent_bar_light_02",

            Set = function(light, refresh)
                DiamondPenthouse.Interior.BarLight.Clear(false)

                SetIplPropState(DiamondPenthouse.interiorId, light, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.BarLight) do
                    if type(value) == "string" then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        BarParty = {
            none = "",
            party0 = "set_pent_bar_party_0",
            party1 = "set_pent_bar_party_1",
            party2 = "set_pent_bar_party_2",
            partyafter = "set_pent_bar_party_after",

            Set = function(party, refresh)
                DiamondPenthouse.Interior.BarParty.Clear(false)

                SetIplPropState(DiamondPenthouse.interiorId, party, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.BarParty) do
                    if type(value) == "string" then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        Blockers = {
            Guest = {
                enabled = "Set_Pent_GUEST_BLOCKER",
                disabled = "",

                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Guest.Clear(false)

                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Guest) do
                        if type(value) == "string" then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Lounge = {
                enabled = "Set_Pent_LOUNGE_BLOCKER",
                disabled = "",

                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Lounge.Clear(false)

                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Lounge) do
                        if type(value) == "string" then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Office = {
                enabled = "Set_Pent_OFFICE_BLOCKER",
                disabled = "",

                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Office.Clear(false)

                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Office) do
                        if type(value) == "string" then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Cinema = {
                enabled = "Set_Pent_CINE_BLOCKER",
                disabled = "",

                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Cinema.Clear(false)

                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Cinema) do
                        if type(value) == "string" then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Spa = {
                enabled = "Set_Pent_SPA_BLOCKER",
                disabled = "",

                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Spa.Clear(false)

                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Spa) do
                        if type(value) == "string" then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Bar = {
                enabled = "Set_Pent_BAR_BLOCKER",
                disabled = "",

                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Bar.Clear(false)

                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Bar) do
                        if type(value) == "string" then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            EnableAllBlockers = function()
                DiamondPenthouse.Interior.Blockers.Bar.Set(DiamondPenthouse.Interior.Blockers.Bar.enabled)
                DiamondPenthouse.Interior.Blockers.Guest.Set(DiamondPenthouse.Interior.Blockers.Guest.enabled)
                DiamondPenthouse.Interior.Blockers.Spa.Set(DiamondPenthouse.Interior.Blockers.Spa.enabled)
                DiamondPenthouse.Interior.Blockers.Cinema.Set(DiamondPenthouse.Interior.Blockers.Cinema.enabled)
                DiamondPenthouse.Interior.Blockers.Lounge.Set(DiamondPenthouse.Interior.Blockers.Lounge.enabled)
                DiamondPenthouse.Interior.Blockers.Office.Set(DiamondPenthouse.Interior.Blockers.Office.enabled)
            end,
            DisableAllBlockers = function()
                DiamondPenthouse.Interior.Blockers.Bar.Set(DiamondPenthouse.Interior.Blockers.Bar.disabled)
                DiamondPenthouse.Interior.Blockers.Guest.Set(DiamondPenthouse.Interior.Blockers.Guest.disabled)
                DiamondPenthouse.Interior.Blockers.Spa.Set(DiamondPenthouse.Interior.Blockers.Spa.disabled)
                DiamondPenthouse.Interior.Blockers.Cinema.Set(DiamondPenthouse.Interior.Blockers.Cinema.disabled)
                DiamondPenthouse.Interior.Blockers.Lounge.Set(DiamondPenthouse.Interior.Blockers.Lounge.disabled)
                DiamondPenthouse.Interior.Blockers.Office.Set(DiamondPenthouse.Interior.Blockers.Office.disabled)
            end
        }
    },

    LoadDefault = function()
        local styleColor = DiamondPenthouse.Colors.timeless
        local stylePattern = DiamondPenthouse.Interior.Pattern.pattern01

        DiamondPenthouse.Ipl.Interior.Load()

        DiamondPenthouse.Interior.Walls.SetColor(styleColor)
        DiamondPenthouse.Interior.Pattern.Set(stylePattern)
        DiamondPenthouse.Interior.Pattern.SetColor(stylePattern, styleColor)

        DiamondPenthouse.Interior.SpaBar.Set(DiamondPenthouse.Interior.SpaBar.open)
        DiamondPenthouse.Interior.MediaBar.Set(DiamondPenthouse.Interior.MediaBar.open)
        DiamondPenthouse.Interior.Dealer.Set(DiamondPenthouse.Interior.Dealer.open)

        RefreshInterior(DiamondPenthouse.interiorId)
    end
}

-- Load or remove IPL(s)
function EnableIpl(ipl, activate)
    if type(ipl) == "table" then
        for key, value in pairs(ipl) do
            EnableIpl(value, activate)
        end
    else
        if activate then
            if not IsIplActive(ipl) then
                RequestIpl(ipl)
            end
        else
            if IsIplActive(ipl) then
                RemoveIpl(ipl)
            end
        end
    end
end

-- Enable or disable the specified props in an interior
function SetIplPropState(interiorId, props, state, refresh)
    if refresh == nil then
        refresh = false
    end

    if type(interiorId) == "table" then
        for key, value in pairs(interiorId) do
            SetIplPropState(value, props, state, refresh)
        end
    else
        if type(props) == "table" then
            for key, value in pairs(props) do
                SetIplPropState(interiorId, value, state, refresh)
            end
        elseif type(props) == "string" then
            if state then
                if not IsInteriorEntitySetActive(interiorId, props) then
                    ActivateInteriorEntitySet(interiorId, props)
                end
            else
                if IsInteriorEntitySetActive(interiorId, props) then
                    DeactivateInteriorEntitySet(interiorId, props)
                end
            end
        end

        if refresh then
            RefreshInterior(interiorId)
        end
    end
end

DiamondPenthouse.LoadDefault() -- 976.636, 70.295, 115.164