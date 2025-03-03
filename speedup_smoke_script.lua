local player = game.Players.LocalPlayer
local backpack = player.Backpack

-- Створення диму
local function createSmoke()
    local smoke = Instance.new("Smoke")  -- Створюємо ефект диму
    smoke.Size = 10  -- Розмір диму
    smoke.Opacity = 0.5  -- Прозорість диму
    smoke.Color = Color3.fromRGB(255, 255, 255)  -- Білий дим
    smoke.RiseVelocity = 5  -- Висота підняття диму
    smoke.Parent = player.Character:WaitForChild("HumanoidRootPart")  -- Додаємо до персонажа
    print("Smoke effect created!")  -- Для перевірки в консолі
    return smoke
end

-- Коли Speed Up потрапляє в руку
local function onToolEquipped(tool)
    if tool.Name == "Speed Up" then  -- Перевіряємо, чи це Speed Up
        print("Speed Up equipped!")  -- Виводимо в консоль
        local smoke = createSmoke()  -- Створюємо дим
        smoke.Enabled = true  -- Увімкнути дим
        print("Smoke effect activated!")
        
        -- Остановимо дим через 5 секунд
        task.wait(5)
        smoke.Enabled = false  -- Вимкнути дим
        print("Smoke effect stopped!")
    end
end

-- Слухаємо подію, коли інструмент потрапляє в руку
backpack.ChildAdded:Connect(onToolEquipped)

-- Перевіримо, чи є Speed Up в інвентарі
print("Script started. Checking for Speed Up...")
