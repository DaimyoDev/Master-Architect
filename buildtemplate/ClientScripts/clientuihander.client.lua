local ClientUIHandler = {}
local player = game:GetService("Players").LocalPlayer
local camera = game.Workspace.CurrentCamera
local PlayerGui = player:WaitForChild("PlayerGui")
local BrickListButton = PlayerGui:WaitForChild("BuildUI").BrickListButton
local PlayModeButton = PlayerGui:WaitForChild("BuildUI").PlayModeButton
local SelectColorButton = PlayerGui:WaitForChild("BuildUI").SelectColor

--brick list related items
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList
local brickList = PlayerGui:WaitForChild("BrickList")
local brickListFrame = brickList.BrickListFrame
local Brick1x1, Brick1x2, Brick2x1, Brick2x2 = brickListFrame["1x1x1Brick"], brickListFrame["1x1x2Brick"], brickListFrame["2x1x1Brick"], brickListFrame["2x1x2Brick"]
local Brick2x2x2, Brick3x2, Brick3x3, Brick5x1, Brick1x1x5 = brickListFrame["2x2x2Brick"], brickListFrame["3x1x2Brick"], brickListFrame["3x1x3Brick"], brickListFrame["5x1x1Brick"], brickListFrame["1x5x1Brick"]


local creationSettings = PlayerGui:WaitForChild("CreationSettings")
local creationSettingsFrame = creationSettings.CreationSettingsFrame
local passwordTextBox = creationSettingsFrame.PasswordFrame.TextBox
local ownersUI = PlayerGui:WaitForChild("OwnersUI")
local creationSettingsButton = ownersUI.CreationSettingsButton
local AddBrick = game.ReplicatedStorage.AddBrick
local TogglePlayMode = game.ReplicatedStorage.TogglePlayMode
local SetPassword = game.ReplicatedStorage.SetPassword
local OpenCreationSettings= game.ReplicatedStorage.OpenCreationSettings
local OpenColorList = game.ReplicatedStorage.OpenColorList


local function OnBrickListButtonClick()
    ChangeBrickList:FireServer(player)
    
end

local function OnPlayModeButtonClick()
    TogglePlayMode:FireServer(player)
end

local function OnColorListButtonClick()
    OpenColorList:FireServer(player)
end
PlayModeButton.Activated:Connect(OnPlayModeButtonClick)
BrickListButton.Activated:Connect(OnBrickListButtonClick)
SelectColorButton.Activated:Connect(OnColorListButtonClick)

passwordTextBox.FocusLost:Connect(function()
    local password = tostring(passwordTextBox.Text)
    SetPassword:FireServer(password)
end)

creationSettingsButton.Activated:Connect(function()
    OpenCreationSettings:FireServer(player)
end)

Brick1x1.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick1x1x1")
end)
Brick2x1.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x1x1")
end)
Brick1x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick1x1x2")
end)
Brick2x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x1x2")
end)
Brick2x2x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick2x2x2")
end)
Brick3x2.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick3x1x2")
end)
Brick3x3.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick3x1x3")
end)
Brick5x1.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick5x1x1")
end)
Brick1x1x5.Activated:Connect(function()
    AddBrick:FireServer(player, "Brick1x5x1")
end)


return ClientUIHandler