--[[
!how to use this! [WIP SCRIPT]

put this in your script and change "DropItemText" to whatever and same for "KeyLetter" and "Time"

DropItemText = "Default" -- the text that says what the action is
KeyLetter = "E" -- the key
Time = 5 -- time till the alert disappears
TweenTime = 2 --how long the tween should last
loadstring(game:HttpGet("https://raw.githubusercontent.com/bamb421/bigpoop/refs/heads/main/scripts/doors/KeybindAlert.lua"))()

dont make the variables local or it wont work

note: this script is rushed asf because i forgot to save it and had to rewrite most of it

pls dont skid :(

--CREDITS--
Bamb - I coded mostly everything.
frstee -- Gui to Lua Plugin
]]

local player = game.Players.LocalPlayer
local playergui = player.PlayerGui 
local mainui = playergui:WaitForChild("MainUI")
local parenttext = mainui.MainFrame.Healthbar.TempControls
local DropItem = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local ButtonHolder = Instance.new("Frame")
local Key = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIPadding_2 = Instance.new("UIPadding")
local TweenService = game:GetService("TweenService")

function createNotif()
	DropItem.Name = "DropItem"
	DropItem.Parent = parenttext
	DropItem.AnchorPoint = Vector2.new(0, 0.5)
	DropItem.BackgroundColor3 = Color3.fromRGB(4, 4, 4)
	DropItem.BackgroundTransparency = 1.000
	DropItem.BorderColor3 = Color3.fromRGB(27, 42, 53)
	DropItem.LayoutOrder = 5
	DropItem.Position = UDim2.new(1.25, 0, 0.5, 0)
	DropItem.Size = UDim2.new(1, 0, 1, 0)
	DropItem.Font = Enum.Font.Oswald
	DropItem.Text = DropItemText
	DropItem.TextColor3 = Color3.fromRGB(247, 241, 234)
	DropItem.TextScaled = true
	DropItem.TextSize = 100.000
	DropItem.TextStrokeColor3 = Color3.fromRGB(59, 59, 59)
	DropItem.TextStrokeTransparency = 0.090
	DropItem.TextWrapped = true
	DropItem.TextXAlignment = Enum.TextXAlignment.Left
	DropItem.TextYAlignment = Enum.TextYAlignment.Bottom

	UIPadding.Parent = DropItem
	UIPadding.PaddingLeft = UDim.new(0.25, 0)

	ButtonHolder.Name = "ButtonHolder"
	ButtonHolder.Parent = DropItem
	ButtonHolder.AnchorPoint = Vector2.new(1, 0.5)
	ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonHolder.BackgroundTransparency = 1.000
	ButtonHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ButtonHolder.BorderSizePixel = 0
	ButtonHolder.Position = UDim2.new(-0.100000001, 0, 0.5, 0)
	ButtonHolder.Size = UDim2.new(1, 0, 1, 0)
	ButtonHolder.SizeConstraint = Enum.SizeConstraint.RelativeYY

	Key.Name = "Key"
	Key.Parent = ButtonHolder
	Key.AnchorPoint = Vector2.new(0.5, 0.5)
	Key.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
	Key.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Key.Position = UDim2.new(0.5, 0, 0.5, 0)
	Key.Size = UDim2.new(1, 0, 1, 0)
	Key.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Key.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	Key.Text = KeyLetter
	Key.TextColor3 = Color3.fromRGB(85, 67, 65)
	Key.TextScaled = true
	Key.TextSize = 14.000
	Key.TextWrapped = true

	UICorner.CornerRadius = UDim.new(0.200000003, 0)
	UICorner.Parent = Key

	UIPadding_2.Parent = Key
	UIPadding_2.PaddingBottom = UDim.new(0.100000001, 0)
	UIPadding_2.PaddingTop = UDim.new(0.100000001, 0)

	return UIPadding, DropItem
end

function tweenNotif(UIPadding, DropItem)
	local tweenInfo = TweenInfo.new(TweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)
	local tween = TweenService:Create(UIPadding, tweenInfo, {PaddingTop = UDim.new(1, 0)})
	tween:Play()
	task.wait(TweenTime)
	DropItem:Destroy()
end

local UIPadding, DropItem = createNotif()
task.wait(Time)
task.spawn(tweenNotif, UIPadding, DropItem)

