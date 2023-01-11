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
local Brick2x2x2, Brick3x2, Brick3x3, Brick5x1, Brick1x1x5 = brickListFrame["2x2x2Brick"], brickListFrame["3x2Brick"], brickListFrame["3x3Brick"], brickListFrame["5x1Brick"], brickListFrame["1x5x1Brick"]
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
    AddBrick:FireServer(player, "Brick1x1")
end)
Brick2x1.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x1")
end)
Brick1x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick1x2")
end)
Brick2x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x2")
end)
Brick2x2x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x2x2")
end)
Brick3x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick3x2")
end)
Brick3x3.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick3x3")
end)
Brick5x1.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick5x1")
end)
Brick1x1x5.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick1x5x1")
end)


return ClientUIHandler