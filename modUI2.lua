local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local COLOR = Color3.fromRGB(81, 47, 84)
local PlayerButton
local function FindButton()
	local Success, Result = pcall(function()
		local RobloxGui = CoreGui:WaitForChild("RobloxGui", 15)
		local ClippingShield = RobloxGui:WaitForChild("SettingsClippingShield", 15)
		local Shield = ClippingShield:WaitForChild("SettingsShield", 15)
		local MenuContainer = Shield:WaitForChild("MenuContainer", 15)
		local PageViewClipper = MenuContainer:WaitForChild("PageViewClipper", 15)
		local PageView = PageViewClipper:WaitForChild("PageView", 15)
		local PageViewInnerFrame = PageView:WaitForChild("PageViewInnerFrame", 15)
		local PlayersTab = PageViewInnerFrame:WaitForChild("Players", 15)
		return PlayersTab:WaitForChild("ImageButton", 15)
	end)
	if Success and Result then
		return Result
	else
		return nil
	end
end
PlayerButton = FindButton()
if not PlayerButton then
	return
end
local function EnforceColor()
	if PlayerButton.BackgroundColor3 ~= COLOR then
		PlayerButton.BackgroundColor3 = COLOR
	end
end
local Connection = RunService.Heartbeat:Connect(EnforceColor)
