--This script will handle regarding the display and events of the player ui
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList
local CollectionService = game:GetService("CollectionService")
local Owner = game:GetService("ServerStorage").Owner
local brickList = {"Brick1x1", "Brick2x1", "Brick1x2", "Brick2x2", "Brick2x2x2", "Brick3x2", "Brick3x3", "Brick5x1", "Brick1x5x1"}
local AddBrick = game.ReplicatedStorage.AddBrick
local TogglePlayMode = game.ReplicatedStorage.TogglePlayMode
local OpenCreationSettings= game.ReplicatedStorage.OpenCreationSettings
local BrickSelected = game.ReplicatedStorage.BrickSelected
local playMode = false
local PlayerUIHandler = {}
local CloneBricks = game.ReplicatedStorage.CloneBricks
local UpdateBrick = game.ReplicatedStorage.UpdateBrick
local DeleteBrick = game.ReplicatedStorage.DeleteBrick
local OpenColorList = game.ReplicatedStorage.OpenColorList
local ColorChosen = game.ReplicatedStorage.ColorChosen

PlayerUIHandler.buildersList = {}


function PlayerUIHandler:OnBrickListButtonClick(player, brickType)
    if player.Name then
        local isBrickType = table.find(brickList, brickType)
        if isBrickType ~= nil then
            local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
            if isBuilder ~= nil then

                    local newBrick = Instance.new("Part")
                    newBrick.Parent = workspace
                    newBrick.Name = "Brick"
                    newBrick.Anchored = true
                    newBrick.Position = Vector3.new(0, 5, 0)
                    
                    if brickType == "Brick1x1" then
                        newBrick.Size = Vector3.new(1, 1, 1)
                    end
                    if brickType == "Brick2x2" then
                        newBrick.Size = Vector3.new(2, 1, 2)
                    end
                    if brickType == "Brick1x2" then
                        newBrick.Size = Vector3.new(1, 1, 2)
                    end
                    if brickType == "Brick2x1" then
                        newBrick.Size = Vector3.new(2, 1, 1)
                    end
                    if brickType == "Brick3x3" then
                        newBrick.Size = Vector3.new(3, 1, 3)
                    end
                    if brickType == "Brick3x2" then
                        newBrick.Size = Vector3.new(3, 1, 2)
                    end
                    if brickType == "Brick5x1" then
                        newBrick.Size = Vector3.new(5, 1, 1)
                    end
                    if brickType == "Brick2x2x2" then
                        newBrick.Size = Vector3.new(2, 2, 2)
                    end
                    if brickType == "Brick1x5x1" then
                        newBrick.Size = Vector3.new(1, 5, 1)
                    end
                    local clicked = false
                    local clickDetector = Instance.new("ClickDetector")
                    clickDetector.MaxActivationDistance = 90000000
                    clickDetector.Parent = newBrick
                    clickDetector.MouseClick:Connect(function(player)
                        local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
                        if isBuilder ~= nil then
                            if clicked == false then
                                clicked = true
                                newBrick.Transparency = 0.3
                                CollectionService:AddTag(newBrick, "Selected")
                                BrickSelected:FireClient(player, newBrick, clicked)
                            else
                                clicked = false
                                CollectionService:RemoveTag(newBrick, "Selected")
                                BrickSelected:FireClient(player, newBrick, clicked)
                                newBrick.Transparency = 0
                            end
                        end
                        
                    end)
                    player.PlayerGui.BrickList.Enabled = false
                end
            end
        end
    end

function PlayerUIHandler:CloneBricks(brick, brickCFrame)
    local clonedBrick = brick:Clone()
    clonedBrick.Transparency = 0
    clonedBrick.CFrame = brickCFrame
    clonedBrick.Parent = game.Workspace
    local clicked = false
    clonedBrick.ClickDetector.MouseClick:Connect(function(player)
        local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
        if isBuilder ~= nil then
            if clicked == false then
                clicked = true
                clonedBrick.Transparency = 0.3
                CollectionService:AddTag(clonedBrick, "Selected")
                BrickSelected:FireClient(player, clonedBrick, clicked)
            else
                clicked = false
                CollectionService:RemoveTag(clonedBrick, "Selected")
                BrickSelected:FireClient(player, clonedBrick, clicked)
                clonedBrick.Transparency = 0
            end
        end                 
    end)
end

function PlayerUIHandler:UpdateBrick(brickList, brickListCFrames)
    for index, brick in ipairs(brickList) do
        local brickCFrame = brickListCFrames[index]
        brick.CFrame = brickCFrame
    end
end

function PlayerUIHandler:DeleteBrick(brick)
    brick:Destroy()
end

function PlayerUIHandler:UpdateBuildersList(newBuildersList)
    self.buildersList = newBuildersList
end

function PlayerUIHandler:LoadBuildUI(builder)
    if builder then
        local isBuilder = table.find(PlayerUIHandler.buildersList, builder)
        if isBuilder ~= nil then
            local PlayersList = game:GetService("Players"):GetPlayers()
            for index, player in ipairs(PlayersList) do
                if player.Name == builder then
                    player.PlayerGui.BuildUI.Enabled = true
                end
            end
        end
    end
end

function PlayerUIHandler:LoadColorList(player)
    if player.Name then
        local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
        if isBuilder ~= nil then
        player.PlayerGui.ColorsList.Enabled = true
        end
    end
end

function PlayerUIHandler:SetBrickColor(player, brickList, color)
    if player.Name then
        local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
        if isBuilder ~= nil then
            for index, brick in ipairs(brickList) do
                if color == "Black" then
                    brick.Color = Color3.fromRGB(0, 0, 0)
                end
                if color == "Blue" then
                    brick.Color = Color3.fromRGB(20, 24, 255)
                end
                if color == "Brown" then
                    brick.Color = Color3.fromRGB(95, 47, 15)
                end
                if color == "Green" then
                    brick.Color = Color3.fromRGB(13, 135, 21)
                end
                if color == "Orange" then
                    brick.Color = Color3.fromRGB(255, 170, 0)
                end
                if color == "Pink" then
                    brick.Color = Color3.fromRGB(255, 49, 245)
                end
                if color == "Purple" then
                    brick.Color = Color3.fromRGB(144, 17, 255)
                end
                if color == "Red" then
                    brick.Color = Color3.fromRGB(255, 0, 0)
                end
                if color == "Yellow" then
                    brick.Color = Color3.fromRGB(255, 247, 0)
                end
            end
        end
    end
end

function PlayerUIHandler:LoadCreationSettingsButton(player)
    
end

function PlayerUIHandler:CreationSettingsButtonHandler(player)
    if player.Name == Owner.Value then
        player.PlayerGui.CreationSettings.Enabled = true
    end
end

function PlayerUIHandler:BrickListButtonHandler(player)
    if player.Name then
        local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
        if isBuilder ~= nil then
        player.PlayerGui.BrickList.Enabled = true
        end
    end
end

function PlayerUIHandler:UnloadBrickListButton(player)
    if playMode == false then
        player.PlayerGui.BuildUI.BrickListButton.Active = false
        player.PlayerGui.BuildUI.BrickListButton.Visible = false
        TogglePlayMode:FireClient(player, "false")
        playMode = true
    else
        player.PlayerGui.BuildUI.BrickListButton.Active = true
        player.PlayerGui.BuildUI.BrickListButton.Visible = true
        TogglePlayMode:FireClient(player, "true")
        playMode = false
    end
end


TogglePlayMode.OnServerEvent:Connect(PlayerUIHandler.UnloadBrickListButton)
ChangeBrickList.OnServerEvent:Connect(PlayerUIHandler.BrickListButtonHandler)
AddBrick.OnServerEvent:Connect(PlayerUIHandler.OnBrickListButtonClick)
OpenCreationSettings.OnServerEvent:Connect(PlayerUIHandler.CreationSettingsButtonHandler)
CloneBricks.OnServerEvent:Connect(PlayerUIHandler.CloneBricks)
UpdateBrick.OnServerEvent:Connect(PlayerUIHandler.UpdateBrick)
DeleteBrick.OnServerEvent:Connect(PlayerUIHandler.DeleteBrick)
OpenColorList.OnServerEvent:Connect(PlayerUIHandler.LoadColorList)
ColorChosen.OnServerEvent:Connect(PlayerUIHandler.SetBrickColor)

return PlayerUIHandler