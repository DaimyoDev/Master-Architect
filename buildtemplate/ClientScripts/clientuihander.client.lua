local ClientUIHandler = {}
local player = game:GetService("Players").LocalPlayer
local camera = game.Workspace.CurrentCamera
local PlayerGui = player:WaitForChild("PlayerGui")
local BrickListButton = PlayerGui:WaitForChild("BuildUI").BrickListButton
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList
local brickList = PlayerGui:WaitForChild("BrickList")
local brickListFrame = brickList.BrickListFrame
local Brick1x1, Brick1x2, Brick2x1, Brick2x2 = brickListFrame["1x1Brick"], brickListFrame["1x2Brick"], brickListFrame["2x1Brick"], brickListFrame["2x2Brick"]
local AddBrick = game.ReplicatedStorage.AddBrick

local function OnBrickListButtonClick()
    ChangeBrickList:FireServer(player)
    
end

BrickListButton.Activated:Connect(OnBrickListButtonClick)

Brick1x1.Activated:Connect(function()
    print("hi")
    AddBrick:FireServer(player, "Brick1x1", camera.Name, camera.CFrame.Position, camera.CFrame.LookVector)
end)
Brick2x1.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x1", camera.Name, camera.CFrame.Position, camera.CFrame.LookVector)
end)
Brick1x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick1x2", camera.Name, camera.CFrame.Position, camera.CFrame.LookVector)
end)
Brick2x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x2", camera.Name, camera.CFrame.Position, camera.CFrame.LookVector)
end)

return ClientUIHandler