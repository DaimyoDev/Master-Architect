local ClientUIHandler = {}
local player = game:GetService("Players").LocalPlayer
local camera = game.Workspace.CurrentCamera
local PlayerGui = player:WaitForChild("PlayerGui")
local BrickListButton = PlayerGui:WaitForChild("BuildUI").BrickListButton
local PlayModeButton = PlayerGui:WaitForChild("BuildUI").PlayModeButton
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList
local brickList = PlayerGui:WaitForChild("BrickList")
local brickListFrame = brickList.BrickListFrame
local Brick1x1, Brick1x2, Brick2x1, Brick2x2 = brickListFrame["1x1Brick"], brickListFrame["1x2Brick"], brickListFrame["2x1Brick"], brickListFrame["2x2Brick"]
local creationSettings = PlayerGui:WaitForChild("CreationSettings")
local creationSettingsFrame = creationSettings.CreationSettingsFrame
local passwordTextBox = creationSettingsFrame.PasswordFrame.TextBox
local ownersUI = PlayerGui:WaitForChild("OwnersUI")
local creationSettingsButton = ownersUI.CreationSettingsButton
local AddBrick = game.ReplicatedStorage.AddBrick
local TogglePlayMode = game.ReplicatedStorage.TogglePlayMode
local SetPassword = game.ReplicatedStorage.SetPassword
local OpenCreationSettings= game.ReplicatedStorage.OpenCreationSettings

local function OnBrickListButtonClick()
    ChangeBrickList:FireServer(player)
    
end

local function OnPlayModeButtonClick()
    TogglePlayMode:FireServer(player)
end

PlayModeButton.Activated:Connect(OnPlayModeButtonClick)
BrickListButton.Activated:Connect(OnBrickListButtonClick)

passwordTextBox.FocusLost:Connect(function()
    local password = tostring(passwordTextBox.Text)
    SetPassword:FireServer(password)
end)

creationSettingsButton.Activated:Connect(function()
    OpenCreationSettings:FireServer(player)
end)

Brick1x1.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick1x1", camera.Name)
end)
Brick2x1.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x1", camera.Name)
end)
Brick1x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick1x2", camera.Name)
end)
Brick2x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x2", camera.Name)
end)

return ClientUIHandler