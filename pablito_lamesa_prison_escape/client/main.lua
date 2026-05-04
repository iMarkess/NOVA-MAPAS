---@type Data
LocalData = {
	stage = 1,
	covered = 'covered',
	route = {['uninitialized'] = {'yes'}}
}

---@type number[]
local Objects = {}

---@type boolean
local loaded = false

local function createObject(data)
	RequestModel(data.model)
	while not HasModelLoaded(data.model) do
		Citizen.Wait(100)

		RequestModel(data.model)
	end

	local object = CreateObjectNoOffset(data.model, data.coords.x, data.coords.y, data.coords.z, false, false, false)

	SetModelAsNoLongerNeeded(data.model)
	FreezeEntityPosition(object, true)
	SetEntityInvincible(object, true)
	SetEntityProofs(object, true, true, true, true, true, true, true, true)
	SetEntityHeading(object, data.heading)

	Objects[#Objects + 1] = object
end

local function clearObjects()
	for _, object in pairs(Objects) do
		if DoesEntityExist(object) then
			DeleteEntity(object)
		end
	end

	Objects = {}
end

---@param data Data
local function createStage(data)
	local stageData = Config.MiningStages[data.stage]

	if not stageData then
		return
	end

	LocalData.stage = data.stage
	LocalData.covered = data.covered
	if data.route then
		LocalData.route = data.route
	end

	clearObjects()

	for _, objectData in pairs(stageData[data.covered]) do
		createObject(objectData)
	end
end

RegisterNetEvent('pablito_lamesa_prison_escape:client:change', createStage)

Citizen.CreateThread(function()
	local wait = Config.LoadData.wait
	while true do
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		if #(playerCoords - Config.LoadData.coords) < Config.LoadData.distance then
			if not loaded then
				loaded = true

				createStage(LocalData)
				TriggerServerEvent('pablito_lamesa_prison_escape:server:request')
			end
		else
			if loaded then
				loaded = false

				clearObjects()
			end
		end

		Citizen.Wait(wait)
	end
end)

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() ~= resourceName then
		return
	end

	clearObjects()
end)