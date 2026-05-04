Citizen.CreateThread(function()
	while LocalData.route and LocalData.route['uninitialized'] ~= nil do
		Citizen.Wait(10)
	end

	-- reset
	for _, interiorData in pairs(Config.Interiors) do
		local interior = GetInteriorAtCoords(interiorData.coords.x, interiorData.coords.y, interiorData.coords.z)

		while interior == 0 do
			interior = GetInteriorAtCoords(interiorData.coords.x, interiorData.coords.y, interiorData.coords.z)

			Citizen.Wait(0)
		end

		for _, propName in pairs(interiorData.props) do
			DisableInteriorProp(interior, propName)
		end

		RefreshInterior(interior)
	end


	local routeData = LocalData.route
	if not routeData then return end

	for interiorName, routeProps in pairs(routeData) do
		local interiorData = Config.Interiors[interiorName]
		local interior = GetInteriorAtCoords(interiorData.coords.x, interiorData.coords.y, interiorData.coords.z)

		while interior == 0 do
			interior = GetInteriorAtCoords(interiorData.coords.x, interiorData.coords.y, interiorData.coords.z)

			Citizen.Wait(0)
		end

		for _, propName in pairs(routeProps) do
			EnableInteriorProp(interior, propName)
		end

		RefreshInterior(interior)
	end
end)
