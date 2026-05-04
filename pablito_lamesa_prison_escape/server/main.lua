local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local playerStages = {}

RegisterNetEvent('pablito_lamesa_prison_escape:server:tryMining')
AddEventHandler('pablito_lamesa_prison_escape:server:tryMining', function()
    local source = source
    local user_id = vRP.Passport(source) or vRP.getUserId(source)
    if user_id then
        if vRP.ItemAmount(user_id, "shovel") >= 1 then
            TriggerClientEvent('pablito_lamesa_prison_escape:client:startMining', source)
        else
            TriggerClientEvent('pablito_lamesa_prison_escape:client:denyMining', source)
            TriggerClientEvent("Notify", source, "negado", "Você precisa de uma pá para cavar.")
        end
    end
end)

RegisterNetEvent('pablito_lamesa_prison_escape:server:stage')
AddEventHandler('pablito_lamesa_prison_escape:server:stage', function()
    local source = source
    local user_id = vRP.Passport(source) or vRP.getUserId(source)
    print("Servidor recebeu pedido de STAGE de: "..tostring(user_id))
    if user_id then
        -- Dupla checagem de segurança
        if vRP.ItemAmount(user_id, "shovel") >= 1 then
            if playerStages[user_id] == nil then
                playerStages[user_id] = { stage = 1, covered = 'uncovered', route = Config.Routes[1] or {} }
            end

            playerStages[user_id].stage = playerStages[user_id].stage + 1
            if playerStages[user_id].stage > 5 then
                playerStages[user_id].stage = 5
            end

            TriggerClientEvent('pablito_lamesa_prison_escape:client:change', source, playerStages[user_id])
            TriggerClientEvent("Notify", source, "sucesso", "Você cavou mais um pouco. Estágio: "..playerStages[user_id].stage.."/5")
        else
            TriggerClientEvent("Notify", source, "negado", "Sua pá desapareceu antes de terminar de cavar.")
        end
    end
end)

RegisterNetEvent('pablito_lamesa_prison_escape:server:cover')
AddEventHandler('pablito_lamesa_prison_escape:server:cover', function()
    local source = source
    local user_id = vRP.Passport(source) or vRP.getUserId(source)
    print("Servidor recebeu pedido de COVER de: "..tostring(user_id))
    if user_id then
        if playerStages[user_id] == nil then
            -- Inicializa como 'covered' para que a primeira pressão de G mude para 'uncovered'
            playerStages[user_id] = { stage = 1, covered = 'covered', route = Config.Routes[1] or {} }
        end

        if playerStages[user_id].covered == 'covered' then
            playerStages[user_id].covered = 'uncovered'
            TriggerClientEvent("Notify", source, "sucesso", "Você descobriu o buraco.")
        else
            playerStages[user_id].covered = 'covered'
            TriggerClientEvent("Notify", source, "sucesso", "Você escondeu o buraco.")
        end

        TriggerClientEvent('pablito_lamesa_prison_escape:client:change', source, playerStages[user_id])
    end
end)

RegisterNetEvent('pablito_lamesa_prison_escape:server:request')
AddEventHandler('pablito_lamesa_prison_escape:server:request', function()
    local source = source
    local user_id = vRP.Passport(source) or vRP.getUserId(source)
    if user_id then
        if playerStages[user_id] then
            TriggerClientEvent('pablito_lamesa_prison_escape:client:change', source, playerStages[user_id])
        end
    end
end)
