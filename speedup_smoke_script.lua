local toolName = "SuperSpeedCoil"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local speedUpEvent = ReplicatedStorage:WaitForChild("SpeedUpEffect")
local player = game.Players.LocalPlayer
local backpack = player.Backpack

local tool = nil

-- Шукаємо предмет у рюкзаку
for _, item in pairs(backpack:GetChildren()) do
    if item:IsA("Tool") and item.Name == toolName then
        tool = item
        break
    end
end

if tool then
    -- Перевірка на клік по предмету
    tool.Activated:Connect(function()
        -- Викликаємо подію на сервері, щоб створити дим для всіх
        speedUpEvent:FireServer(tool)
    end)
else
    print(toolName .. " not found in backpack!")
end
