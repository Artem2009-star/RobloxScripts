local player = game.Players.LocalPlayer
local backpack = player.Backpack

-- Перевірка всіх елементів у рюкзаку
for _, item in pairs(backpack:GetChildren()) do
    if item:IsA("Tool") then
        print(item.Name)
    end
end
