local ClientUIHandler = {}
local player = game:GetService("Players").LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local BrickListButton = PlayerGui:WaitForChild("BuildUI").BrickListButton
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList

local function OnBrickListButtonClick()
    ChangeBrickList:FireServer(player)
    
end

BrickListButton.Activated:Connect(OnBrickListButtonClick)

return ClientUIHandler