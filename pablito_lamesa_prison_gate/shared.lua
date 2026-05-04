Config = {
    Framework = "standalone",       -- "standalone", "esx-legacy", "qb-core"

    -- ONLY IF FRAMEWORK IS "esx-legacy" or "qb-core", OTHERWISE IGNORED
    JobName = "police",             -- Job name to check if the player can open the gate

    AllowCommand = true,           -- Allow the command to open the gate from the console or chat
                                    -- /opengate, /closegate

    UseBuiltInButtonPrompt = true,  -- Use the built-in button prompt to open the gate
    BuiltinButtonControlId = 38,    -- Control ID to open the gate https://docs.fivem.net/docs/game-references/controls/
    BuiltinButtonText = 'Press ~g~[E]~w~ to use the gate', -- Button prompt text

    GateDistance = 10.0,            -- Distance to allow the player to open the gate

    DoorCooldown = 8000,            -- Cooldown to open the gate again (in milliseconds)
}