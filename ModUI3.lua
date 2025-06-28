local CG = game:GetService("CoreGui")
local function CreateTitle()
    local Suc, MC = pcall(function()
        return CG:WaitForChild("RobloxGui"):WaitForChild("SettingsClippingShield"):WaitForChild("SettingsShield"):WaitForChild("MenuContainer", 20)
    end)
    if not Suc or not MC then
        return
    end
    local TG = Instance.new("ScreenGui")
    TG.Name = "WattyHubTitleGui"
    TG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    TG.DisplayOrder = 999
    TG.Parent = CG
    local TL = Instance.new("TextLabel")
    TL.Name = "MenuTitle"
    TL.Text = "W  A  T  T  Y    H  U  B"
    TL.Font = Enum.Font.FredokaOne
    TL.TextColor3 = Color3.fromRGB(210, 122, 217)
    TL.TextScaled = true
    TL.BackgroundTransparency = 1
    TL.TextStrokeColor3 = Color3.new(0, 0, 0)
    TL.TextStrokeTransparency = 0
    TL.AnchorPoint = Vector2.new(0.5, 1)
    TL.Parent = TG
    local function UP()
        if not MC or not MC.Parent then
            TG:Destroy()
            return
        end
        TG.Enabled = MC.Visible
        if MC.Visible then
            local MS = MC.AbsoluteSize
            local MP = MC.AbsolutePosition
            local HO = 15
            local CX = MP.X + (MS.X / 2)
            local TY = MP.Y - HO
            TL.Size = UDim2.new(0, MS.X * 0.9, 0, 160)
            TL.Position = UDim2.fromOffset(CX, TY)
        end
    end

    MC:GetPropertyChangedSignal("AbsolutePosition"):Connect(UP)
    MC:GetPropertyChangedSignal("AbsoluteSize"):Connect(UP)
    MC:GetPropertyChangedSignal("Visible"):Connect(UP)
    UP()
end
CreateTitle()
