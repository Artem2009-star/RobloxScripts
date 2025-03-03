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
    -- Створення великої кількості диму
    for i = 1, 50 do  -- Створюємо 50 часток диму для інтенсивного ефекту
        local smoke = Instance.new("Smoke")
        smoke.Parent = tool.Handle  -- Додаємо дим до Handle або іншу частину, якщо Handle відсутня
        smoke.Opacity = 0.8
        smoke.RiseVelocity = 10
        smoke.Size = math.random(15, 30)  -- Рандомний розмір диму для додаткового ефекту
        smoke.Color = Color3.fromRGB(math.random(100, 255), math.random(100, 255), math.random(100, 255))  -- Рандомний колір диму
        smoke.Enabled = true
    end
    
    -- Створення штучного навантаження на FPS
    spawn(function()
        while true do
            local startTime = tick()
            -- Простий цикл, що створює навантаження
            for _ = 1, 100000 do end
            local endTime = tick()
            if endTime - startTime < 0.05 then
                print("FPS lowered intentionally!")
            end
            wait(0.1)  -- Відкладення між ітераціями для зниження навантаження
        end
    end)
else
    print(toolName .. " not found in backpack!")
end
