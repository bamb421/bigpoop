--[[
!how to use this! [WIP SCRIPT]

note: this script is rushed asf because i forgot to save it and rewrote most of it in under 10 minutes

load this script in your script like this <loadstring(game:HttpGet("https://raw.githubusercontent.com/bamb421/bigpoop/refs/heads/main/scripts/doors/KeybindAlert.lua"))()>

and then in your script you put your text and keyletter like this

local DropItemText = "Default"
local KeyLetter = "E"

and then it should work idk im still figuring this thing out :(

pls dont skid
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
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)
    local tween = TweenService:Create(UIPadding, tweenInfo, {PaddingBottom = UDim.new(1, 0)})
    tween:Play()
    tween.Completed:Wait()
    DropItem:Destroy()
end

local UIPadding, DropItem = createNotif()
task.wait(5)
tweenNotif(UIPadding, DropItem)
