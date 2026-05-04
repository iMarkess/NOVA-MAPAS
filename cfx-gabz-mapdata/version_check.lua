-- Version Checker Script
-- This script checks for updates by comparing the current resource version with the latest version on GitHub

Citizen.CreateThread(function()
    -- Wait 5 seconds before starting the version check
    Citizen.Wait(5000)
    
    -- Helper function to convert version string to number (removes dots)
    local function versionStringToNumber(versionString)
        return tonumber(versionString)
    end
    
    -- Get the current resource name
    local currentResourceName = GetCurrentResourceName()
    
    -- Get the current version from the resource metadata
    local currentVersion = GetResourceMetadata(currentResourceName, "version", 0)
    
    -- Perform HTTP request to check for updates on GitHub
    local githubVersionUrl = "https://raw.githubusercontent.com/GabzV/Gabz_Versions/master/" .. currentResourceName .. ".txt"
    
    PerformHttpRequest(
        githubVersionUrl,
        function(httpStatusCode, responseBody, responseHeaders)
            -- Check if GitHub is accessible
            if not responseBody then
                print("^1Version check disabled because github is down.^0")
                return
            end
            
            -- Parse the JSON response from GitHub
            local versionData = json.decode(responseBody)
            
            -- Convert the latest version from GitHub to a comparable number
            local latestVersionNumber = versionStringToNumber(versionData.version:gsub("%.", ""))
            
            -- Convert the current installed version to a comparable number
            local currentVersionNumber = versionStringToNumber(currentVersion:gsub("%.", ""))
            
            -- Check if a newer version is available
            if latestVersionNumber > currentVersionNumber then
                -- Generate a random color code for the header/footer
                local randomColorCode = "^" .. math.random(1, 9)
                
                -- Build the separator line (equals signs)
                local separatorLine = randomColorCode
                local separatorLength = 26 + #currentResourceName
                for i = 1, separatorLength, 1 do
                    separatorLine = separatorLine .. "="
                end
                separatorLine = separatorLine .. "^0"
                
                -- Print the update notification header
                print(separatorLine)
                
                -- Print the detailed update information
                local updateMessage = "^2[" .. currentResourceName .. "] - New Update Available.^0\n" ..
                                     "Current Version: ^5" .. currentVersion .. "^0.\n" ..
                                     "New Version: ^5" .. versionData.version .. "^0.\n" ..
                                     "Notes: ^5" .. versionData.notes .. "^0."
                print(updateMessage)
                
                -- Print the update notification footer
                print(separatorLine)
            end
        end,
        "GET"
    )
end)