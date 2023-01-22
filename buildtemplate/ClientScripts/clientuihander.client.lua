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
local Brick1x1x1, Brick1x2x1, Brick2x1x1, Brick2x1x2 = brickListFrame["1x1x1Brick"], brickListFrame["1x2x1Brick"], brickListFrame["2x1x1Brick"], brickListFrame["2x1x2Brick"]
local Brick2x2x2, Brick3x1x2, Brick3x1x3, Brick5x1x1, Brick1x1x5 = brickListFrame["2x2x2Brick"], brickListFrame["3x1x2Brick"], brickListFrame["3x1x3Brick"], brickListFrame["5x1x1Brick"], brickListFrame["1x1x5Brick"]
local Brick1x1x2, Brick1x1x3, Brick1x1x4, Brick1x3x1, Brick1x5x1, Brick2x3x2, Brick4x1x1, Brick4x1x2, Brick4x1x3, Brick4x1x4, Brick4x2x1, Brick4x2x2, Brick4x3x1, Brick4x4x1, Brick4x4x4, Brick4x5x1, Brick5x1x2, Brick5x1x5, Brick5x2x1, Brick5x2x2, Brick5x3x2, Brick5x3x3, Brick5x4x3, Brick5x4x4, Brick5x5x5, Brick6x1x1, Brick8x1x1, Brick8x1x8, Brick8x2x1, Brick8x3x1, Brick8x4x1, Brick8x5x1, Brick8x8x8 = brickListFrame["1x1x2Brick"], brickListFrame["1x1x3Brick"], brickListFrame["1x1x4Brick"], brickListFrame["1x3x1Brick"], brickListFrame["1x5x1Brick"], brickListFrame["2x3x2Brick"], brickListFrame["4x1x1Brick"], brickListFrame["4x1x2Brick"], brickListFrame["4x1x3Brick"], brickListFrame["4x1x4Brick"], brickListFrame["4x2x1Brick"], brickListFrame["4x2x2Brick"], brickListFrame["4x3x1Brick"], brickListFrame["4x4x1Brick"], brickListFrame["4x4x4Brick"], brickListFrame["4x5x1Brick"], brickListFrame["5x1x2Brick"], brickListFrame["5x1x5Brick"], brickListFrame["5x2x1Brick"], brickListFrame["5x2x2Brick"], brickListFrame["5x3x2Brick"], brickListFrame["5x3x3Brick"], brickListFrame["5x4x3Brick"], brickListFrame["5x4x4Brick"], brickListFrame["5x5x5Brick"], brickListFrame["6x1x1Brick"], brickListFrame["8x1x1Brick"], brickListFrame["8x1x8Brick"], brickListFrame["8x2x1Brick"], brickListFrame["8x3x1Brick"], brickListFrame["8x4x1Brick"], brickListFrame["8x5x1Brick"], brickListFrame["8x8x8Brick"]

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

for index, brickButton in ipairs(brickListFrame:GetChildren()) do
    if brickButton.Name ~= "BrickGrid" and brickButton.Name ~= "UIPadding" and brickButton.Name ~= "UIGridLayout" then
        brickButton.Activated:Connect(function()
           local splitString = (string.split(brickButton.Name, "Brick"))
           local newName = splitString[1]
            AddBrick:FireServer(player, newName)
        end)
    end
end


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

return ClientUIHandler