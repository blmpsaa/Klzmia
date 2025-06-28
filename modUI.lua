local CoreGui = game:GetService("CoreGui")
local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")

local TARGET_COLOR = Color3.fromRGB(81, 47, 84)
local CHAT_TEXT_COLOR = Color3.fromRGB(210, 122, 217)
local CHAT_BG_COLOR = Color3.fromRGB(47, 27, 49)
local PLAYER_HEADER_COLOR = Color3.fromRGB(246, 143, 255)

local function ApplyGlobalMods()
    pcall(function()
        CoreGui.RobloxGui.SettingsClippingShield.DarkenBackground.BackgroundColor3 = TARGET_COLOR
        TextChatService.BubbleChatConfiguration.TextColor3 = CHAT_TEXT_COLOR
        TextChatService.ChatWindowConfiguration.BackgroundColor3 = CHAT_BG_COLOR
        TextChatService.ChatWindowConfiguration.TextColor3 = CHAT_TEXT_COLOR
        TextChatService.ChatWindowConfiguration.BackgroundTransparency = 0.2
        TextChatService.ChatInputBarConfiguration.BackgroundColor3 = TARGET_COLOR
        TextChatService.ChatInputBarConfiguration.PlaceholderColor3 = CHAT_TEXT_COLOR
        TextChatService.ChatInputBarConfiguration.TextColor3 = CHAT_TEXT_COLOR

        local TopBarApp = CoreGui.TopBarApp.TopBarApp
        TopBarApp.MenuIconHolder.TriggerPoint.Background.ScalingIcon.ImageColor3 = CHAT_TEXT_COLOR
        local UnibarMenu = TopBarApp.UnibarLeftFrame.UnibarMenu["2"]["3"]
        UnibarMenu.nine_dot.IntegrationIconFrame.IntegrationIcon.Overflow.ImageColor3 = CHAT_TEXT_COLOR
        UnibarMenu.nine_dot.IntegrationIconFrame.IntegrationIcon.Close.ImageColor3 = CHAT_TEXT_COLOR
        UnibarMenu.chat.IntegrationIconFrame.IntegrationIcon.ImageColor3 = CHAT_TEXT_COLOR

        local MenuContainer = CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer
        MenuContainer.BackgroundColor3 = TARGET_COLOR
        
        local BottomButtons = MenuContainer.BottomButtonFrame
        BottomButtons.LeaveGameButtonButton.Border.Transparency = 0
        BottomButtons.LeaveGameButtonButton.Border.Thickness = 4
        BottomButtons.LeaveGameButtonButton.Border.Color = CHAT_TEXT_COLOR
        BottomButtons.LeaveGameButtonButton.LeaveGameButtonTextLabel.TextColor3 = CHAT_TEXT_COLOR
        BottomButtons.LeaveGameButtonButton.LeaveGameHint.BackgroundColor3 = CHAT_TEXT_COLOR
        BottomButtons.LeaveGameButtonButton.LeaveGameHint.ImageColor3 = CHAT_TEXT_COLOR
        BottomButtons.ResetCharacterButtonButton.Border.Thickness = 4
        BottomButtons.ResetCharacterButtonButton.Border.Transparency = 0
        BottomButtons.ResetCharacterButtonButton.Border.Color = CHAT_TEXT_COLOR
        BottomButtons.ResetCharacterButtonButton.ResetCharacterHint.ImageColor3 = CHAT_TEXT_COLOR
        BottomButtons.ResetCharacterButtonButton.ResetCharacterButtonTextLabel.TextColor3 = CHAT_TEXT_COLOR
        BottomButtons.ResumeButtonButton.Border.Color = CHAT_TEXT_COLOR
        BottomButtons.ResumeButtonButton.Border.Thickness = 4
        BottomButtons.ResumeButtonButton.Border.Transparency = 0
        BottomButtons.ResumeButtonButton.ResumeHint.ImageColor3 = CHAT_TEXT_COLOR
        BottomButtons.ResumeButtonButton.ResumeButtonTextLabel.TextColor3 = CHAT_TEXT_COLOR

        local PageViewInnerFrame = MenuContainer.PageViewClipper.PageView.PageViewInnerFrame
        PageViewInnerFrame.Players.ImageButton.BackgroundColor3 = TARGET_COLOR

        local RightComponent = PageViewInnerFrame.ReportAbuseMenuNewContainerPage.AbuseReportMenuNewRoot.FocusNavigationCoreScriptsWrapper.AbuseReportMenuPlaceholderFrame.MenuLayoutFrame.Menu.MenuItemsContainer.MenuItems.MenuItems.FreeComments.RightComponentWrapper.RightComponent
        RightComponent.BackgroundTransparency = 0
        RightComponent.AbuseReportsText.BackgroundTransparency = 0
    end)
    pcall(function()
        local PlayerListLegacy = CoreGui.PlayerList.Children.OffsetFrame.PlayerScrollList.SizeOffsetFrame
        PlayerListLegacy.ScrollingFrameContainer.BackgroundColor3 = TARGET_COLOR
        PlayerListLegacy.TitleBar.BackgroundColor3 = TARGET_COLOR
        PlayerListLegacy.TopRoundedRect.DismissIconFrame.BackgroundColor3 = TARGET_COLOR
        PlayerListLegacy.BottomRoundedRect["1"].BackgroundColor3 = TARGET_COLOR
    end)
end

local function ProcessPlayerLabel(PlayerLabel)
    pcall(function()
        PlayerLabel.BackgroundColor3 = TARGET_COLOR
    end)
end

task.spawn(function()
    local RobloxGui = CoreGui:WaitForChild("RobloxGui")
    local SettingsShield = RobloxGui:WaitForChild("SettingsClippingShield"):WaitForChild("SettingsShield")
    local TopBar = CoreGui:WaitForChild("TopBarApp")
    local PlayerListLegacyContainer = CoreGui:WaitForChild("PlayerList")

    ApplyGlobalMods()

    local PlayerListContainer = SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame:WaitForChild("Players")
    
    for _, ExistingLabel in ipairs(PlayerListContainer:GetChildren()) do
        if ExistingLabel.Name:find("PlayerLabel") then
            ProcessPlayerLabel(ExistingLabel)
        end
    end
    
    PlayerListContainer.ChildAdded:Connect(ProcessPlayerLabel)

    local UnibarFrame = TopBar:WaitForChild("TopBarApp"):WaitForChild("UnibarLeftFrame")
    local HealthBarFill = UnibarFrame:WaitForChild("HealthBar"):WaitForChild("HealthBar"):WaitForChild("Fill")
    local ChatButton = UnibarFrame:WaitForChild("UnibarMenu"):WaitForChild("2"):WaitForChild("3"):WaitForChild("chat")
    
    RunService.RenderStepped:Connect(function()
        pcall(function()
            if HealthBarFill.ImageColor3 ~= CHAT_TEXT_COLOR then
                HealthBarFill.ImageColor3 = CHAT_TEXT_COLOR
            end

            local Badge = ChatButton:FindFirstChild("5") and ChatButton["5"]:FindFirstChild("Badge")
            if Badge and Badge.BackgroundColor3 ~= CHAT_TEXT_COLOR then
                Badge.BackgroundColor3 = CHAT_TEXT_COLOR
            end

            local PlayerDropDown = PlayerListLegacyContainer.Children.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer:FindFirstChild("PlayerDropDown")
            if PlayerDropDown and PlayerDropDown.Visible then
                local InnerFrame = PlayerDropDown.InnerFrame
                InnerFrame.FriendButton.CurrentButtonContainer.DropDownButton.BackgroundColor3 = TARGET_COLOR
                InnerFrame.BlockButton.BackgroundColor3 = TARGET_COLOR
                InnerFrame.InspectButton.BackgroundColor3 = TARGET_COLOR
                InnerFrame.ReportButton.ImageColor3 = TARGET_COLOR
                InnerFrame.PlayerHeader.Background.ImageColor3 = PLAYER_HEADER_COLOR
            end
        end)
    end)
end)
