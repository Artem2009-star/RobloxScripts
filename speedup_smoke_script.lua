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

    -- Функція для створення великої кількості диму
    local function createSmoke()
        for i = 1, 50 do  -- Створюємо 50 димових ефектів
            local smoke = Instance.new("Smoke")
            smoke.Parent = handle
            smoke.Opacity = 0.8
            smoke.RiseVelocity = 10  -- Змінюємо швидкість підйому
            smoke.Size = math.random(20, 50)  -- Рандомізуємо розмір
            smoke.Color = Color3.fromRGB(150, 150, 150)  -- Сірий колір
            smoke.Enabled = true
        end
    end

    -- Коли предмет активується, створюємо багато диму
    tool.Activated:Connect(function()
        print("Smoke effect activated!")
        createSmoke()

        -- Можна додати затримку перед зупинкою диму, якщо потрібно
        task.wait(5)  -- Дим буде видно 5 секунд
    end)
else
    print(toolName .. " не знайдений у рюкзаку!")
end
