local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "DIMENSIONAL - COALESCENCE - EXPERIMENTAL" .. Fluent.Version,
    SubTitle = "by higuysIownslapbattles",
    TabWidth = 200,
    Size = UDim2.fromOffset(780, 560),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

Fluent:Notify({
    Title = "Loaded!!",
    Content = "DIMENSIONAL - COALESCENCE - EXPERIMENTAL has loaded",
    SubContent = "Close the gui with LeftControl", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
})


local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
}

local spamdamage = Tabs.Main:AddToggle("spamdamage",
{
    Title = "Spam damage everyone (must be sonic.exe)",
    Description = "Spam damage everyone",
    Default = false,
    Callback = function(state)
        while state == true do task.wait()
            for i, v in pairs(workspace.gameInstance.hitBoxModule.Players:GetChildren()) do
                if v:IsA("Model") then
                    
            local ohInstance1 = v
            
            game:GetService("ReplicatedStorage").PlayerRemoteEvents.ExeRemote.Jumpdamage:FireServer(ohInstance1)
                end
            end
        end
    end
})

local godmodecuphead = Tabs.Main:AddToggle("godmodelol",
{
    Title = "give urself godmode constantly (cuphead)",
    Description = "not tested with other characters but might work",
    Default = false,
    Callback = function(state)
        while state == true do task.wait()
            local ohString1 = game.Players.LocalPlayer.Name
            
            game:GetService("ReplicatedStorage").PlayerRemoteEvents.CupheadSuperArt:FireServer(ohString1)
            end
        end
})

local spamrush = Tabs.Main:AddToggle("spamrushlol", 
{
    Title = "Sapm rush with vanilla",
    Description = "RUSH THE EVERYONE",
    Default = false,
    Callback = function(state)
        local players = game.Players
        while state do task.wait()
            for i, v in pairs(workspace.gameInstance.hitBoxModule.Players:GetChildren()) do
                if v.Humanoid then
                    local ohInstance1 = v

                    game:GetService("ReplicatedStorage").PlayerRemoteEvents.HomingAttack:FireServer(ohInstance1)

                end
            end
        end
    end

})

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Become a character",
    Description = "can be the same as someone else\'s",
    Values = {"bendy", "boris", "cream", "monika", "sayori", "sonic", "sonic.exe", "vanilla"},
    Multi = false,
    Default = false,
})

Dropdown:OnChanged(function(Value)
local ohString1 = Value

game:GetService("ReplicatedStorage").Remotes.inSelection.characterSelectionControlEvent:FireServer(ohString1)
end)

local Toggle = Tabs.Main:AddToggle("MyToggle", 
{
    Title = "Invisibility", 
    Description = "Sonic.exe NO EXPIRATION",
    Default = false,
    Callback = function(state)
        local Player = game.Players.LocalPlayer
local highlight = Instance.new("Highlight")
	if state then
        local ohBoolean1 = true
local ohString2 = Player.Name

game:GetService("ReplicatedStorage").PlayerRemoteEvents.InvisblityEvent:FireServer(ohBoolean1, ohString2)

local highlightClone = highlight:Clone()
highlightClone.Adornee = Player.Character
highlightClone.OutlineColor = Color3.new(0, 0.933333, 1)
highlightClone.FillColor = Color3.new(0, 0.933333, 1)
highlightClone.Parent = Player.Character:WaitForChild("HumanoidRootPart")
	else
        local ohBoolean1 = false
local ohString2 = Player.Name

game:GetService("ReplicatedStorage").PlayerRemoteEvents.InvisblityEvent:FireServer(ohBoolean1, ohString2)
	    Player.Character.HumanoidRootPart.Highlight:Destroy()
        end
    end 
})
