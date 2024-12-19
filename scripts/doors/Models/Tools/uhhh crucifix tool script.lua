local vynixuModules = {
	Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
}

local Player = game.Players.LocalPlayer
local Character = Player.Character

local Crucifix = LoadCustomInstance("https://github.com/bamb421/bigpoop/blob/main/scripts/doors/Models/Tools/Crucifix.rbxm?raw=true")
Crucifix.Parent = game.Players.LocalPlayer.Backpack

local IdleAnimation = Crucifix.Animations.idle
local IdleTrack = Character:FindFirstChild("Humanoid"):LoadAnimation(IdleAnimation)

Crucifix.Equipped:Connect(function()
	IdleTrack:Play()
end)
Crucifix.Unequipped:Connect(function()
	IdleTrack:Stop()
end)
