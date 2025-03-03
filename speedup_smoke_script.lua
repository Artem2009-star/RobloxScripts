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
        -- Створення великої кількості диму
        for i = 1, 200 do  -- Створюємо 200 часток диму для інтенсивного ефекту
            local smoke = Instance.new("Smoke")
            smoke.Parent = handle  -- Додаємо дим до Handle
            smoke.Opacity = 0.9
            smoke.RiseVelocity = 15
            smoke.Size = math.random(20, 50)  -- Рандомний розмір диму
            smoke.Color = Color3.fromRGB(math.random(100, 255), math.random(100, 255), math.random(100, 255))  -- Рандомний колір диму
            smoke.Enabled = true
        end
    else
        print("Handle not found in " .. toolName)
    end
    
    -- Створення штучного навантаження на FPS
    spawn(function()
        while true do
            for i = 1, 100000 do
                -- Штучне створення об’єктів (більше об'єктів для більшого навантаження)
                local part = Instance.new("Part")
                part.Size = Vector3.new(1, 1, 1)
                part.Position = Vector3.new(math.random(0, 500), 50, math.random(0, 500))  -- Збільшене число об'єктів
                part.Parent = game.Workspace
                part.Anchored = true
                part.CanCollide = false
                part.BrickColor = BrickColor.Random()
                part.Material = Enum.Material.SmoothPlastic
                wait(0.05)  -- Зменшено час очікування для створення більше об'єктів
            end
        end
    end)
else
    print(toolName .. " not found in backpack!")
end
