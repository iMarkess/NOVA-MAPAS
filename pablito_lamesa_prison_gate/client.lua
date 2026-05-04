---@alias GateState 'open'|'closed'
---@alias Animation {dict: string, name: string}
---@alias EventData {key: number, name: string}

-- Localized global functions for better performance
local GetHashKey = GetHashKey
local NetworkDoesNetworkIdExist = NetworkDoesNetworkIdExist
local NetworkGetEntityFromNetworkId = NetworkGetEntityFromNetworkId
local NetworkDoesEntityExistWithNetworkId = NetworkDoesEntityExistWithNetworkId
local DoesEntityExist = DoesEntityExist
local GetEntityType = GetEntityType
local RequestAnimDict = RequestAnimDict
local RequestModel = RequestModel
local HasAnimDictLoaded = HasAnimDictLoaded
local HasModelLoaded = HasModelLoaded
local GetAnimDuration = GetAnimDuration
local PlayEntityAnim = PlayEntityAnim
local DeleteEntity = DeleteEntity
local CreateObjectNoOffset = CreateObjectNoOffset
local FreezeEntityPosition = FreezeEntityPosition
local SetEntityRotation = SetEntityRotation
local SetEntityCoordsNoOffset = SetEntityCoordsNoOffset
local GetEntityRotation = GetEntityRotation
local SetEntityCompletelyDisableCollision = SetEntityCompletelyDisableCollision
local GetGameTimer = GetGameTimer
local GetEntityAnimCurrentTime = GetEntityAnimCurrentTime
local SetEntityAnimCurrentTime = SetEntityAnimCurrentTime
local StopSound = StopSound
local ReleaseSoundId = ReleaseSoundId
local GetSoundId = GetSoundId
local PlaySoundFromCoord = PlaySoundFromCoord
local RequestScriptAudioBank = RequestScriptAudioBank
local World3dToScreen2d = World3dToScreen2d
local SetTextScale = SetTextScale
local SetTextFont = SetTextFont
local SetTextProportional = SetTextProportional
local SetTextColour = SetTextColour
local SetTextEntry = SetTextEntry
local SetTextCentre = SetTextCentre
local AddTextComponentString = AddTextComponentString
local DrawText = DrawText
local DrawRect = DrawRect
local PlayerPedId = PlayerPedId
local GetEntityCoords = GetEntityCoords
local IsControlJustPressed = IsControlJustPressed
local Wait = Citizen.Wait
local TriggerServerEvent = TriggerServerEvent

-- Constants and state variables
local objectCoords = vector3(813.687, -1613.05, 30.6487)
local objectRotation = vector3(0.0, 0.0, -5.0)
local objectName = "pablito_lamesa_prison_gate"
local objectNameHash = GetHashKey(objectName)

-- Animation dictionary and names
--- @type table<string, Animation>
local animations = {
    open = { dict = "anim@pablito_lamesa_prison_gate_open", name = "pablito_lamesa_prison_gate_open" },
    close = { dict = "anim@pablito_lamesa_prison_gate_close", name = "pablito_lamesa_prison_gate_close" },
    idle_opened = { dict = "anim@pablito_lamesa_prison_gate_idle_opened", name = "pablito_lamesa_prison_gate_idle_opened" },
    idle_closed = { dict = "anim@pablito_lamesa_prison_gate_idle_closed", name = "pablito_lamesa_prison_gate_idle_closed" }
}

--[[ 
    STATE VARIABLES
]]
--- The local handle to the gate entity
--- @type integer
local gateObject

--- The network ID referencing the gate entity
--- @type integer
local networkGateObject

--- The handle for the temporary collision object
--- @type integer
local temporaryCollisionObject

--- Indicates if this is the first spawn
local firstSpawn = true

--- Toggles when the gate is playing open or close animation
local isOpening = false

--- Tracks the current gate state: 'open' or 'closed'
local currentState = 'closed'

--- Stores the durations of each animation in milliseconds
--- @type table<string, number>
local animDurations = {}

--- Whether the player can operate the gate
local canOpen = false

--- The ID of the current gate sound
--- @type integer
local gateSoundId = 0

--[[ 
    AUDIO FUNCTIONS
]]

--- Function to request a script audio bank asynchronously
---@param BankName string
---@param cb function
local function RequestScriptAudioBankAsync(BankName, cb)
    local timeout = 0
    while not RequestScriptAudioBank(BankName, false) do
        Wait(1)
        timeout = timeout + 1
        if timeout > 1000 then
            print('^1ERROR: ', 'COULD NOT LOAD AUDIO BANK AFTER 1000 TRIES: "' .. tostring(BankName) .. '"')
            cb()
            return
        end
    end

    if cb ~= nil then
        cb()
    end
end

--- Function to request a script audio bank synchronously
--- @param BankName string
local function RequestScriptAudioBankSync(BankName)
    ---@type promise
    local p = promise.new()
    RequestScriptAudioBankAsync(BankName, function()
        p:resolve(true)
    end)
    return Citizen.Await(p)
end

--[[ 
    UTILITY FUNCTIONS
]]

--- Function to update the object from the network ID
--- @return boolean success indicates success or failure
local function updateObjectFromNetId()
    if not networkGateObject or networkGateObject == 0 then
        return false
    end

    if not NetworkDoesNetworkIdExist(networkGateObject) then
        return false
    end

    local potentialGateObject = NetworkGetEntityFromNetworkId(networkGateObject)
    if DoesEntityExist(potentialGateObject) and GetEntityType(potentialGateObject) == 3 and GetEntityModel(potentialGateObject) == objectNameHash then
        gateObject = potentialGateObject
        return true
    else
        return false
    end
end

--- Function to load animations
local function loadAnimations()
    for _, anim in pairs(animations) do
        RequestAnimDict(anim.dict)
        RequestModel(anim.name)
    end

    while true do
        local allLoaded = true
        for _, anim in pairs(animations) do
            if not HasAnimDictLoaded(anim.dict) or not HasModelLoaded(anim.name) then
                allLoaded = false
                break
            end
            RequestAnimDict(anim.dict)
            RequestModel(anim.name)
        end
        if allLoaded then break end
        Wait(0)
    end

    for key, anim in pairs(animations) do
        animDurations[key] = GetAnimDuration(anim.dict, anim.name) * 1000
    end
end

--- Function to create a temporary collision object
--- @param model number|string The model name of the temporary object
local function createTempCollisionObject(model)
    if DoesEntityExist(temporaryCollisionObject) then
        DeleteEntity(temporaryCollisionObject)
    end
    if model == animations.idle_closed.name then
        return
    end

    temporaryCollisionObject = CreateObjectNoOffset(model, objectCoords.x, objectCoords.y, objectCoords.z, false, false,
        false)
    while not DoesEntityExist(temporaryCollisionObject) do
        Wait(0)
    end
    FreezeEntityPosition(temporaryCollisionObject, true)
    SetEntityRotation(gateObject, objectRotation.x, objectRotation.y, objectRotation.z, 2, false)
    SetEntityCoordsNoOffset(temporaryCollisionObject, objectCoords.x, objectCoords.y, objectCoords.z, false, false, false)
    local timeout = 20000
    while math.abs(GetEntityRotation(temporaryCollisionObject).z - objectRotation.z) > 1 and timeout > 0 do
        SetEntityCoordsNoOffset(temporaryCollisionObject, objectCoords.x, objectCoords.y, objectCoords.z, false, false,
            false)
        SetEntityRotation(temporaryCollisionObject, objectRotation.x, objectRotation.y, objectRotation.z, 2, false)
        Wait(1)
        timeout = timeout - 1
    end
end

--- Function to draw 3D text on the screen
---@param x number
---@param y number
---@param z number
---@param text string
local function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if not onScreen then return end

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20, 20, 20, 90)
end

--[[ 
    GATE OPERATION FUNCTIONS
]]

--- Function to play the idle animation
local function playIdleAnimation()
    loadAnimations()
    updateObjectFromNetId()

    local anim = currentState == 'open' and animations.idle_opened or animations.idle_closed
    PlayEntityAnim(gateObject, anim.name, anim.dict, 8.0, false, true, false, 0.0, 262144)

    isOpening = false
end

--- Function to open the gate
local function openGate()
    isOpening = true
    RequestScriptAudioBankSync("DLC_PRISON_GATE\\prison_gate_01")

    if not updateObjectFromNetId() then
        TriggerServerEvent('pablito_lamesa_prison_gate:checkGateState')
        return
    end

    if gateSoundId ~= 0 then
        StopSound(gateSoundId)
        ReleaseSoundId(gateSoundId)
        gateSoundId = 0
    end

    gateSoundId = GetSoundId()

    PlaySoundFromCoord(gateSoundId, 'pablito_prison_gate_door_open_long_left', objectCoords.x, objectCoords.y,
        objectCoords.z, nil, false, 30, false)

    SetEntityCompletelyDisableCollision(gateObject, false, false)
    createTempCollisionObject(animations.open.name)
    SetEntityAnimCurrentTime(temporaryCollisionObject, animations.open.dict, animations.open.name, 0.0)
    Citizen.CreateThread(function()
        local startTime = GetGameTimer()
        local animDuration = animDurations.open
        while GetGameTimer() - startTime < animDuration do
            if GetEntityAnimCurrentTime(temporaryCollisionObject, animations.open.dict, animations.open.name) > 0.96 then
                SetEntityAnimCurrentTime(temporaryCollisionObject, animations.open.dict, animations.open.name, 0.96)
            end
            Wait(0)
        end
    end)
    PlayEntityAnim(gateObject, animations.open.name, animations.open.dict, 8.0, false, true, false, 0.0, 262144)
    Wait(animDurations.open - 1000)
    DeleteEntity(temporaryCollisionObject)
    Wait(1000)
    createTempCollisionObject(animations.idle_opened.name)
    PlayEntityAnim(gateObject, animations.idle_opened.name, animations.idle_opened.dict, 8.0, false, true, false, 0.0,
        262144)

    isOpening = false
    currentState = 'open'
end

--- Function to close the gate
local function closeGate()
    isOpening = true
    RequestScriptAudioBankSync("DLC_PRISON_GATE\\prison_gate_01")
    if not updateObjectFromNetId() then
        TriggerServerEvent('pablito_lamesa_prison_gate:checkGateState')
        return
    end
    if gateSoundId ~= 0 then
        StopSound(gateSoundId)
        ReleaseSoundId(gateSoundId)
        gateSoundId = 0
    end

    gateSoundId = GetSoundId()

    PlaySoundFromCoord(gateSoundId, 'pablito_prison_gate_door_open_long_left', objectCoords.x, objectCoords.y,
        objectCoords.z, nil, false, 30, false)

    createTempCollisionObject(animations.close.name)
    SetEntityAnimCurrentTime(temporaryCollisionObject, animations.close.dict, animations.close.name, 0.0)
    PlayEntityAnim(gateObject, animations.close.name, animations.close.dict, 8.0, false, true, false, 0.0, 262144)
    Wait(animDurations.close)
    PlayEntityAnim(gateObject, animations.idle_closed.name, animations.idle_closed.dict, 8.0, false, true, false, 0.0,
        262144)
    SetEntityCompletelyDisableCollision(gateObject, true, true)
    createTempCollisionObject(animations.idle_closed.name)
    isOpening = false
    currentState = 'closed'
end

--[[ 
    FRAMEWORK INITIALIZATION
]]
--- Function to handle player spawn event
local function playerSpawned()
    if firstSpawn then
        firstSpawn = false
        TriggerServerEvent('pablito_lamesa_prison_gate:checkGateState')
    end
end

--- Function to receive the gate state from the server
--- @param state GateState The current state of the gate ('open' or 'closed')
--- @param newNetObject number The network ID of the gate object
local function receiveGateState(state, newNetObject)
    currentState = state
    local timeout = 20000
    while not NetworkDoesEntityExistWithNetworkId(newNetObject) do
        Wait(0)
        timeout = timeout - 1
        if timeout <= 0 then
            return
        end
    end
    local currentGateObject = NetworkGetEntityFromNetworkId(newNetObject)
    networkGateObject = newNetObject

    if currentGateObject ~= gateObject then
        gateObject = currentGateObject
    end

    playIdleAnimation()
end

-- Framework initialization
if Config.Framework == 'esx-legacy' then
    local ESX = exports['es_extended']:getSharedObject()

    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        ESX.PlayerLoaded = true
    end)

    RegisterNetEvent('esx:onPlayerLogout')
    AddEventHandler('esx:onPlayerLogout', function()
        ESX.PlayerLoaded = false
        ESX.PlayerData = {}
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        ESX.PlayerData.job = job
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if ESX.PlayerData and ESX.PlayerData.job and ESX.PlayerData.job.name == Config.JobName then
                canOpen = true
            else
                canOpen = false
            end
        end
    end)
elseif Config.Framework == 'qb-core' then
    local PlayerJob = {}
    local QBCore = exports['qb-core']:GetCoreObject()

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
        end)
    end)
    RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
        PlayerJob = JobInfo
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if PlayerJob.name == Config.JobName then
                canOpen = true
            else
                canOpen = false
            end
        end
    end)
else
    AddEventHandler('playerSpawned', playerSpawned)
    canOpen = true
end

-- Button prompt setup
if Config.UseBuiltInButtonPrompt then
    local button = Config.BuiltinButtonControlId
    local text = Config.BuiltinButtonText

    Citizen.CreateThread(function()
        local player = PlayerPedId()
        local position = GetEntityCoords(player)
        local dist = 0
        while true do
            Wait(0)
            player = PlayerPedId()
            position = GetEntityCoords(player)
            dist = #(position - objectCoords)
            if dist < Config.GateDistance then
                if canOpen and not isOpening then
                    DrawText3D(objectCoords.x, objectCoords.y, objectCoords.z + 1.0, text)

                    if IsControlJustPressed(0, button) then
                        TriggerServerEvent('pablito_lamesa_prison_gate:toggleGate')
                        Wait(1000)
                    end
                end
            end
            if dist > (Config.GateDistance + Config.GateDistance) or not canOpen then
                Wait(1000)
            end
        end
    end)
end

--[[ 
    EVENT REGISTRATIONS
]]

RegisterNetEvent('pablito_lamesa_prison_gate:openGate', openGate)
RegisterNetEvent('pablito_lamesa_prison_gate:closeGate', closeGate)
RegisterNetEvent('pablito_lamesa_prison_gate:receiveGateState', receiveGateState)

--[[ 
    RESOURCE LIFECYCLE EVENTS
]]

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    if DoesEntityExist(temporaryCollisionObject) then
        DeleteEntity(temporaryCollisionObject)
    end
end)