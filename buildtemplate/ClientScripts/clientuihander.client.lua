local ClientUIHandler = {}
local player = game:GetService("Players").LocalPlayer
local camera = game.Workspace.CurrentCamera
local PlayerGui = player:WaitForChild("PlayerGui")
local BrickListButton = PlayerGui:WaitForChild("BuildUI").BrickListButton
local PlayModeButton = PlayerGui:WaitForChild("BuildUI").PlayModeButton
local SelectColorButton = PlayerGui:WaitForChild("BuildUI").SelectColor
local SelectMaterialButton = PlayerGui:WaitForChild("BuildUI").SelectMaterial

--brick list related items
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList
local brickList = PlayerGui:WaitForChild("BrickList")
local brickListFrame = brickList.BrickListFrame

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
local OpenMaterialList = game.ReplicatedStorage.OpenMaterialList

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

local function OnMaterialListButtonClick()
    OpenMaterialList:FireServer(player)
end
PlayModeButton.Activated:Connect(OnPlayModeButtonClick)
BrickListButton.Activated:Connect(OnBrickListButtonClick)
SelectColorButton.Activated:Connect(OnColorListButtonClick)
SelectMaterialButton.Activated:Connect(OnMaterialListButtonClick)
print(SelectMaterialButton)


passwordTextBox.FocusLost:Connect(function()
    local password = tostring(passwordTextBox.Text)
    SetPassword:FireServer(password)
end)

creationSettingsButton.Activated:Connect(function()
    OpenCreationSettings:FireServer(player)
end)

return ClientUIHandler