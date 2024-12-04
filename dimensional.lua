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
    Title = "Spam damage everyone",
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
    Description = "tested with other characters they work work",
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
    Title = "Sapm rush with vanilla and other characters",
    Description = "RUSH EVERYONE",
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
