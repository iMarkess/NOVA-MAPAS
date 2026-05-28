CreateThread(function()
	
	interiorID = GetInteriorAtCoords(2725.203, 3487.395, 57.70855)
		if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "mecanicaredline_dec01")
		EnableInteriorProp(interiorID, "mecanicaredline_dec02")
		EnableInteriorProp(interiorID, "mecanicaredline_dec03")
		EnableInteriorProp(interiorID, "mecanicaredline_dec04")
		EnableInteriorProp(interiorID, "mecanicaredline_dec05")
		RefreshInterior(interiorID)
	end
end)