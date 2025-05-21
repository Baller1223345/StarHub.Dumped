local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "StarHack Hub | Survive The Night",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by StarHackScripts",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "StarHackHubSTN001"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Key | StarHack Hub",
        Subtitle = "Key System",
        Note = "Keyless! Key is: STAR",
        FileName = "StarHackHubSTNkey001",
        SaveKey = false,
        GrabKeyFromSite = true,
        Key = { "https://pastebin.com/raw/KrhvD8DW" }
    }
})
Rayfield:Notify({
    Title = "Welcome",
    Content = "Enjoy! Made by StarHackScripts",
    Duration = 5,
    Image = 13047715178,
    Actions = {
        Ignore = {
            Name = "Okay!",
            Callback = function()
                print("The user tapped Okay!")
            end
        }
    }
})
local HomeTab = Window:CreateTab("Home")
local MainSection = HomeTab:CreateSection("Main")
HomeTab:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "1-21",
    RemoveTextAfterFocusLost = true,
    Callback = function(value)
        local speed = tonumber(value)
        if speed then
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = speed
            end
        end
    end
})
HomeTab:CreateParagraph({
    Title = "NOTE:",
    Content = "If you are the survivor, set the walkspeed from 1 to 17; if you are the slasher, you can set it up to 21. This is for your safety and to avoid speed hack detection."
})
local OtherSection = HomeTab:CreateSection("Other")
local hasExecutedOnlineScript = false
HomeTab:CreateButton({
    Name = "[EXECUTE THIS] Online/Offline script",
    Callback = function()
        if hasExecutedOnlineScript then
            Rayfield:Notify({
                Title = "Already Executed",
                Content = "You have already executed this script.",
                Duration = 4
            })
            return
        end
        hasExecutedOnlineScript = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/StarHackScripts/StarHack-Hub-Deepstar-Hub/refs/heads/main/STN-REVAMPED-ONLINE-TEXT"))()
        Rayfield:Notify({
            Title = "Executed",
            Content = "Script successfully executed!",
            Duration = 4
        })
    end
})
local hasExecutedInfiniteYield = false
HomeTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        if hasExecutedInfiniteYield then
            Rayfield:Notify({
                Title = "Already Executed",
                Content = "You have already executed this script.",
                Duration = 4
            })
            return
        end
        hasExecutedInfiniteYield = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        Rayfield:Notify({
            Title = "Executed",
            Content = "Script successfully executed!",
            Duration = 4
        })
    end
})
local VisualTab = Window:CreateTab("Visual")
local function createESP(part, name, color)
    if part:FindFirstChildOfClass("Highlight") then return end
    local highlight = Instance.new("Highlight")
    highlight.FillColor = color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0
    highlight.Parent = part
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = part
    billboard.Size = UDim2.new(0, 80, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboard
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = name
    textLabel.TextColor3 = color
    textLabel.TextScaled = true
    billboard.Parent = part
end
local function removeESP(part)
    local highlight = part:FindFirstChildOfClass("Highlight")
    if highlight then highlight:Destroy() end
    local billboard = part:FindFirstChild("BillboardGui")
    if billboard then billboard:Destroy() end
end
VisualTab:CreateToggle({
    Name = "Murch ESP",
    CurrentValue = false,
    Flag = "ToggleMurchESP",
    Callback = function(state)
        local misc = game.Workspace:FindFirstChild("Misc")
        if not misc then return end
        local murchCase = misc:FindFirstChild("MurchCase")
        if state and murchCase then
            createESP(murchCase, "MurchCase", Color3.fromRGB(196, 40, 28))
        elseif murchCase then
            removeESP(murchCase)
        end
    end
})
VisualTab:CreateToggle({
    Name = "Aila ESP",
    CurrentValue = false,
    Flag = "ToggleAilaESP",
    Callback = function(state)
        local misc = game.Workspace:FindFirstChild("Misc")
        if not misc then return end
        local ailaCase = misc:FindFirstChild("AILACase")
        if state and ailaCase then
            createESP(ailaCase, "AILACase", Color3.fromRGB(255, 255, 0))
        elseif ailaCase then
            removeESP(ailaCase)
        end
    end
})
VisualTab:CreateToggle({
    Name = "NightFall Case ESP",
    CurrentValue = false,
    Flag = "ToggleEventCaseESP",
    Callback = function(state)
        local misc = game.Workspace:FindFirstChild("Misc")
        if not misc then return end
        local eventCase = misc:FindFirstChild("EventCase")
        if state and eventCase then
            createESP(eventCase, "NightFallCase", Color3.fromRGB(255, 105, 180))
        elseif eventCase then
            removeESP(eventCase)
        end
    end
})
VisualTab:CreateToggle({
    Name = "Relics ESP",
    CurrentValue = false,
    Flag = "ToggleRelicsESP",
    Callback = function(state)
        local tempMap = game.Workspace:FindFirstChild("TempMap")
        if not tempMap then return end
        local main = tempMap:FindFirstChild("Main")
        if not main then return end
        local relics = main:FindFirstChild("Relics")
        if not relics then return end
        for _, relic in pairs(relics:GetDescendants()) do
            if relic:IsA("ProximityPrompt") and relic.Parent then
                if state then
                    createESP(relic.Parent, "Relics", Color3.fromRGB(0, 0, 255))
                else
                    removeESP(relic.Parent)
                end
            end
        end
    end
})
VisualTab:CreateToggle({
    Name = "Blacklight Battery ESP",
    CurrentValue = false,
    Flag = "ToggleBlacklightESP",
    Callback = function(state)
        local tempMap = game.Workspace:FindFirstChild("TempMap")
        if not tempMap then return end
        local main = tempMap:FindFirstChild("Main")
        if not main then return end
        local bonusItems = main:FindFirstChild("BonusItems")
        if not bonusItems then return end
        for _, item in pairs(bonusItems:GetDescendants()) do
            if item:IsA("ProximityPrompt") and item.Parent then
                if state then
                    createESP(item.Parent, "|", Color3.fromRGB(255, 0, 255))
                else
                    removeESP(item.Parent)
                end
            end
        end
    end
})
VisualTab:CreateToggle({
    Name = "Task ESP",
    CurrentValue = false,
    Flag = "ToggleTaskESP",
    Callback = function(state)
        local tempMap = game.Workspace:FindFirstChild("TempMap")
        if not tempMap then return end
        local main = tempMap:FindFirstChild("Main")
        if not main then return end
        for _, part in pairs(main:GetChildren()) do
            if part:IsA("BasePart") then
                if state then
                    createESP(part, "Task", Color3.fromRGB(255, 0, 255))
                else
                    removeESP(part)
                end
            end
        end
    end
})
local AuraTab = Window:CreateTab("Aura")
local function activateAura(items)
    for _, item in pairs(items) do
        local proximityPrompt = item:FindFirstChildOfClass("ProximityPrompt")
        if proximityPrompt then
            fireproximityprompt(proximityPrompt, 1)
            wait(0.1)
        end
    end
end
AuraTab:CreateToggle({
    Name = "Relic Aura (Relics, Blacklights)",
    CurrentValue = false,
    Flag = "ToggleRelicAura",
    Callback = function(state)
        if not state then return end
        while state do
            local tempMap = game.Workspace:FindFirstChild("TempMap")
            if tempMap then
                local main = tempMap:FindFirstChild("Main")
                if main then
                    local relics = main:FindFirstChild("Relics")
                    local bonusItems = main:FindFirstChild("BonusItems")
                    if relics then
                        activateAura(relics:GetDescendants())
                    end
                    if bonusItems then
                        activateAura(bonusItems:GetDescendants())
                    end
                end
            end
            wait(0.1)
        end
    end
})
AuraTab:CreateToggle({
    Name = "Task Aura",
    CurrentValue = false,
    Flag = "ToggleTaskAura",
    Callback = function(state)
        if not state then return end
        while state do
            local tempMap = game.Workspace:FindFirstChild("TempMap")
            if tempMap then
                local main = tempMap:FindFirstChild("Main")
                if main then
                    activateAura(main:GetChildren())
                end
            end
            wait(0.1)
        end
    end
})
AuraTab:CreateToggle({
    Name = "Case Aura (Murch, AILA, NightFall)",
    CurrentValue = false,
    Flag = "ToggleCaseAura",
    Callback = function(state)
        if not state then return end
        while state do
            local misc = game.Workspace:FindFirstChild("Misc")
            if misc then
                local cases = { "MurchCase", "AILACase", "EventCase" }
                for _, caseName in pairs(cases) do
                    local case = misc:FindFirstChild(caseName)
                    if case then
                        activateAura(case:GetDescendants())
                    end
                end
            end
            wait(0.1)
        end
    end
})
local TeleportsTab = Window:CreateTab("Teleports")
local TeleportSection = TeleportsTab:CreateSection("Teleport to Cases")
local lastTeleportTime = 0
local function teleportToCase(caseName)
    local currentTime = tick()
    if currentTime - lastTeleportTime < 10 then
        Rayfield:Notify({
            Title = "Safety",
            Content = "You have to wait 10 seconds before you can teleport again! This is for your safety and to avoid teleport hack detection.",
            Duration = 7
        })
        return
    end
    lastTeleportTime = currentTime
    local misc = game.Workspace:FindFirstChild("Misc")
    if not misc then
        Rayfield:Notify({
            Title = "Teleport Failed",
            Content = "The Misc folder was not found in Workspace.",
            Duration = 5
        })
        return
    end
    local case = misc:FindFirstChild(caseName)
    if not case then
        Rayfield:Notify({
            Title = "Teleport Failed",
            Content = caseName .. " not found in the game.",
            Duration = 5
        })
        return
    end
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character:MoveTo(case.Position)
    end
end
TeleportsTab:CreateButton({
    Name = "MurchCase",
    Callback = function()
        teleportToCase("MurchCase")
    end
})
TeleportsTab:CreateButton({
    Name = "AilaCase",
    Callback = function()
        teleportToCase("AILACase")
    end
})
TeleportsTab:CreateButton({
    Name = "NightFall Case",
    Callback = function()
        teleportToCase("EventCase")
    end
})
TeleportsTab:CreateParagraph({
    Title = "TIP:",
    Content = "Activate the Case Aura so that when you teleport you instantly pick up the cases."
})
TeleportsTab:CreateParagraph({
    Title = "NOTE:",
    Content = "Do not spam or overuse teleportation features to avoid the game detecting teleportation hacks."
})
local CreditsTab = Window:CreateTab("Ⓒ Credits")
local CreditsSection = CreditsTab:CreateSection("Credits")
CreditsTab:CreateParagraph({
    Title = "Made by:",
    Content = "StarHackScripts"
})
CreditsTab:CreateButton({
    Name = "Copy YouTube Link",
    Callback = function()
        setclipboard("https://youtube.com/@StarHackScripts")
        Rayfield:Notify({
            Title = "Copied successfully",
            Content = "My YouTube channel link was successfully copied to your clipboard. Check it out!",
            Duration = 6
        })
    end
})
CreditsTab:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/WTu5Eny3qZ")
        Rayfield:Notify({
            Title = "Copied successfully",
            Content = "My Discord server invite was successfully copied to your clipboard. I'll see you there!",
            Duration = 6
        })
    end
})
