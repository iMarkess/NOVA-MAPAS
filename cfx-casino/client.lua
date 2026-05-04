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