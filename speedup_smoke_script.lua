local toolName = "SuperSpeedCoil"  -- Назва предмета
local player = game.Players.LocalPlayer
local backpack = player.Backpack
local tool = nil

-- Знайти предмет у рюкзаку
for _, item in pairs(backpack:GetChildren()) do
    if item:IsA("Tool") and item.Name == toolName then
        tool = item
        break
    end
end

if tool then
    -- Отримуємо посилання на частину предмета, яка генерує дим
    local handle = tool:WaitForChild("Handle")
    local smoke = Instance.new("Smoke")
    smoke.Parent = handle
    smoke.Opacity = 0.5
    smoke.RiseVelocity = 5
    smoke.Size = 10
    smoke.Color = Color3.fromRGB(150, 150, 150)

    -- Функція для активації диму
    local function startSmoke()
        print("Smoke effect activated!")
        smoke.Enabled = true
    end

    -- Функція для деактивації диму
    local function stopSmoke()
        print("Smoke effect stopped!")
        smoke.Enabled = false
    end

    -- Коли предмет активується, дим з'являється
    tool.Activated:Connect(function()
        startSmoke()

        -- Можна додати затримку перед зупинкою диму, якщо потрібно
        task.wait(5)  -- Дим буде видно 5 секунд
        stopSmoke()
    end)
else
    print(toolName .. " не знайдений у рюкзаку!")
end
