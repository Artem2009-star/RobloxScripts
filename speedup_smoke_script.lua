local toolName = "SuperSpeedCoil"  -- Назва предмета
local player = game.Players.LocalPlayer
local backpack = player.Backpack

local toolFound = false
local tool = nil

-- Шукаємо предмет у рюкзаку
for _, item in pairs(backpack:GetChildren()) do
    if item:IsA("Tool") and item.Name == toolName then
        toolFound = true
        tool = item
        print(toolName .. " found in backpack!")
        break
    end
end

if toolFound then
    -- Створення диму на самому предметі
    local smoke = Instance.new("Smoke")
    smoke.Parent = tool
    smoke.Opacity = 0.5
    smoke.RiseVelocity = 5
    smoke.Size = 10
    smoke.Color = Color3.fromRGB(150, 150, 150)
    smoke.Enabled = true
else
    print(toolName .. " not found in backpack!")
end
