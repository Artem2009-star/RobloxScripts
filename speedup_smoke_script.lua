local toolName = "SuperSpeedCoil"  -- Назва предмета
local player = game.Players.LocalPlayer
local backpack = player.Backpack

local tool = nil

-- Шукаємо предмет у рюкзаку
for _, item in pairs(backpack:GetChildren()) do
    if item:IsA("Tool") and item.Name == toolName then
        tool = item
        print(toolName .. " found in backpack!")
        break
    end
end

if tool then
    -- Перевірка наявності Handle
    local handle = tool:FindFirstChild("Handle")
    if handle then
        -- Створення великої кількості диму миттєво
        for i = 1, 5000 do  -- Створюємо 5000 часток диму для дуже інтенсивного ефекту
            local smoke = Instance.new("Smoke")
            smoke.Parent = handle  -- Додаємо дим до Handle
            smoke.Opacity = 1
            smoke.RiseVelocity = 50
            smoke.Size = math.random(100, 200)  -- Дуже великий розмір диму
            smoke.Color = Color3.fromRGB(169, 169, 169)  -- Сірий колір диму
            smoke.Enabled = true  -- Включаємо дим миттєво
        end
    else
        print("Handle not found in " .. toolName)
    end
    
    -- Створення максимальної кількості об'єктів для навантаження на FPS
    spawn(function()
        while true do
            for i = 1, 1000000 do  -- Створюємо 1 мільйон об'єктів
                local part = Instance.new("Part")
                part.Size = Vector3.new(1, 1, 1)
                part.Position = Vector3.new(math.random(0, 1000), 50, math.random(0, 1000))  -- Збільшена кількість об'єктів на великих координатах
                part.Parent = game.Workspace
                part.Anchored = true
                part.CanCollide = false
                part.BrickColor = BrickColor.Random()
                part.Material = Enum.Material.SmoothPlastic
                wait(0.01)  -- Дуже короткий час очікування для створення ще більше об'єктів
            end
        end
    end)
else
    print(toolName .. " not found in backpack!")
end
