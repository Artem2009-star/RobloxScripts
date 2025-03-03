local toolName = "Speed Up!"
local player = game.Players.LocalPlayer
local backpack = player.Backpack

local toolFound = false
for _, item in pairs(backpack:GetChildren()) do
    if item:IsA("Tool") and item.Name == toolName then
        toolFound = true
        print(toolName .. " found in backpack!")
        break
    end
end

if toolFound then
    local tool = backpack:FindFirstChild(toolName)
    local part = tool.Handle
    local smoke = Instance.new("Smoke")
    smoke.Parent = part
    smoke.Opacity = 0.5
    smoke.RiseVelocity = 5
    smoke.Size = 10
    smoke.Color = Color3.fromRGB(150, 150, 150)
    smoke.Enabled = true
else
    print(toolName .. " not found in backpack!")
end
