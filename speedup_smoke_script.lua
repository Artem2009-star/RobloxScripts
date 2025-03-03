local toolName = "SuperSpeedCoil"  -- Заміни на правильне ім'я предмета
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
    -- Перевіряємо наявність Handle або іншої частини
    local part = tool:FindFirstChild("Handle") or tool:FindFirstChild("Base")

    if part then
        local smoke = Instance.new("Smoke")
        smoke.Parent = part
        smoke.Opacity = 0.5
        smoke.RiseVelocity = 5
        smoke.Size = 10
        smoke.Color = Color3.fromRGB(150, 150, 150)
        smoke.Enabled = true
    else
        print("Handle or Base not found in " .. toolName)
    end
else
    print(toolName .. " not found in backpack!")
end
