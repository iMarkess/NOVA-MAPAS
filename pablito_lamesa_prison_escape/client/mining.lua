local timeleft = 10
local mining = false
local isRequesting = false

---@type number
local miningObject
local miningDict = 'melee@large_wpn@streamed_core'
local miningAnim = 'car_down_attack'


local function stopMining()
    mining = false

    if DoesEntityExist(miningObject) then
        DeleteObject(miningObject)
    end

    StopAnimTask(PlayerPedId(), miningDict, miningAnim, -8.0)
end

local function startMining()
    isRequesting = false
    print("startMining chamado | Stage: "..tostring(LocalData.stage).." | Covered: "..tostring(LocalData.covered))

    -- Usando a Pá em vez da marreta
    local model = `prop_tool_shovel`

    RequestAnimDict(miningDict)
    while not HasAnimDictLoaded(miningDict) do
        Citizen.Wait(100)
    end

    local playerPed = PlayerPedId()

    TaskPlayAnim(playerPed, miningDict, miningAnim, 8.0, -8.0, -1, 1, 0.0, false, false, false)
    RemoveAnimDict(miningDict)

    local playerCoords = GetEntityCoords(playerPed)
    miningObject = CreateObject(model, playerCoords.x, playerCoords.y, playerCoords.z, true, true, false)
    local boneIndex = GetPedBoneIndex(playerPed, 28422) -- Bone de segurar itens
    
    -- Ajuste de posição para a Pá
    local position = vec3(0.0, 0.0, 0.0)
    local rotation = vec3(0.0, 0.0, 0.0)

    SetModelAsNoLongerNeeded(model)
    AttachEntityToEntity(miningObject, playerPed, boneIndex, position.x, position.y, position.z, rotation.x, rotation.y, rotation.z, false, false, false, false, 2, true)

    timeleft = 10
    mining = true

    Citizen.CreateThread(function()
        while timeleft > 0 and mining do
            timeleft = timeleft - 1

            -- Efeito de poeira/terra subindo ao cavar
            local pCoords = GetEntityCoords(playerPed)
            local forward = GetEntityForwardVector(playerPed)
            local coords = pCoords + forward * 0.8
            local x, y, z = coords.x, coords.y, coords.z
            
            UseParticleFxAssetNextCall("core")
            local part = StartParticleFxNonLoopedAtCoord("exp_grd_dust_visual", x, y, z - 0.9, 0.0, 0.0, 0.0, 1.0, false, false, false)
            
            -- Som de cavar
            PlaySoundFromCoord(-1, "Dig_Dirt", x, y, z, "LOW_PAN_PLANT_DIG", 0, 0, 0)

            if timeleft == 0 then
                TriggerServerEvent('pablito_lamesa_prison_escape:server:stage')
                stopMining()
                break
            end

            Citizen.Wait(1000)
        end
    end)

    Citizen.CreateThread(function()
        Citizen.Wait(500) -- Evitar cancelamento imediato pelo mesmo pressionar de E
        while mining do
            if IsControlJustPressed(0, 38) then -- E
                TriggerEvent("Notify", "aviso", "Você parou de cavar.")
                stopMining()
                break
            end

            Citizen.Wait(0)
        end
    end)
end

RegisterNetEvent('pablito_lamesa_prison_escape:client:startMining')
AddEventHandler('pablito_lamesa_prison_escape:client:startMining', function()
    startMining()
end)

RegisterNetEvent('pablito_lamesa_prison_escape:client:denyMining')
AddEventHandler('pablito_lamesa_prison_escape:client:denyMining', function()
    isRequesting = false
end)

local function drawText3d()
	local coords = Config.LoadData.coords

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextColour(255, 255, 255, 215)
    SetTextCentre(true)

    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName("~g~[E]~w~ Mine | ~g~[G]~w~ Cover")
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		if #(playerCoords - Config.LoadData.coords) < 2.5 then
			drawText3d()

			if not mining then
				if IsControlJustPressed(0, 38) then
                    if not isRequesting then
                        if LocalData.stage == 0 or LocalData.stage == 5 then
                            print("Stage inválido para minerar")
                        elseif LocalData.covered == 'covered' then
                            TriggerEvent("Notify", "negado", "Você precisa descobrir o buraco primeiro [G].")
                        else
                            isRequesting = true
                            print("Pressionou E - Solicitando permissão para cavar...")
                            TriggerServerEvent('pablito_lamesa_prison_escape:server:tryMining')
                        end
                    end
				elseif IsControlJustPressed(0, 47) then
                    print("Pressionou G")
					TriggerServerEvent('pablito_lamesa_prison_escape:server:cover')
				end
			elseif LocalData.covered == 'covered' then
				stopMining()
			end
		else
			Citizen.Wait(100)
		end

		Citizen.Wait(0)
	end
end)
