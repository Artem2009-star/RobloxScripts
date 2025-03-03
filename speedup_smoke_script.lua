-- Перевірка на наявність предмета
local toolName = "Speed Up!"  -- Тут ставиш ім'я твого предмета
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

-- Якщо знайшов предмет, створюємо дим
if tool then
    tool.Activated:Connect(function()
        -- Створюємо багато диму
        local handle = tool:FindFirstChild("Handle")
        if handle then
            for i = 1, 5000 do
                local smoke = Instance.new("Smoke")
                smoke.Parent = handle
                smoke.Opacity = 1
                smoke.RiseVelocity = 50
                smoke.Size = math.random(100, 200)
                smoke.Color = Color3.fromRGB(169, 169, 169)  -- Сірий колір
                smoke.Enabled = true
            end
        else
            warn("Handle not found!")
        end
    end)
else
    print(toolName .. " not found in backpack!")
end
