local ReplicatedStorage = game:GetService("ReplicatedStorage")
local speedUpEvent = ReplicatedStorage:WaitForChild("SpeedUpEffect")

-- Функція для створення диму
local function createSmoke(tool)
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
end

-- Прослуховування події від клієнта
speedUpEvent.OnServerEvent:Connect(function(player, tool)
    createSmoke(tool)
end)
