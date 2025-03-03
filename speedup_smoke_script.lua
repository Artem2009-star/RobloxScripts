-- Шукаємо предмет з точним ім'ям
local toolName = "Speed Up!"  -- Якщо це твоє ім'я предмету, заміни на актуальне

local player = game.Players.LocalPlayer
local backpack = player.Backpack

-- Перевірка наявності предмету в інвентарі
local tool = backpack:FindFirstChild(toolName)

if tool then
    print(toolName .. " found in backpack!")
    -- Код для активації ефекту диму або іншого
    local part = tool.Handle  -- Можливо, треба буде змінити, залежно від об'єкта
    local smoke = Instance.new("Smoke")
    smoke.Parent = part
    smoke.Opacity = 0.5
    smoke.RiseVelocity = 5
    smoke.Size = 10
    smoke.Color = Color3.fromRGB(150, 150, 150)
    smoke.Enabled = true
else
    print(toolName .. " not found in backpack!")
end
