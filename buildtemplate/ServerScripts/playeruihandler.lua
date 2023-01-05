--This script will handle regarding the display and events of the player ui
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList
local Owner = game:GetService("ServerStorage").Owner
local brickList = {"Brick1x1", "Brick2x1", "Brick1x2", "Brick2x2"}
local AddBrick = game.ReplicatedStorage.AddBrick
local TogglePlayMode = game.ReplicatedStorage.TogglePlayMode
local playMode = false
local PlayerUIHandler = {}

PlayerUIHandler.buildersList = {}


function PlayerUIHandler:OnBrickListButtonClick(player, brickType, camera, cameraPosition, cameraFacing)
    if player.Name then
        local isBrickType = table.find(brickList, brickType)
        if isBrickType ~= nil then
            local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
            if isBuilder ~= nil then
                if camera == game.Workspace.CurrentCamera.Name then
                    local newBrick = Instance.new("Part")
                    newBrick.Parent = workspace
                    newBrick.Name = "Brick"
                    newBrick.Anchored = true
                    if typeof(cameraPosition) == "Vector3" and typeof(cameraFacing) == "Vector3" then
                        
                        if cameraFacing.X > 0 and cameraFacing.Z > 0 then
                            newBrick.Position = cameraPosition + Vector3.new(7, 0, 7)
                            if cameraFacing.Y > 0 then
                                newBrick.Position = newBrick.Position + Vector3.new(0, 7, 0)
                            else
                                newBrick.Position = newBrick.Position + Vector3.new(0, -7, 0)
                            end
                        end
                        if cameraFacing.X < 0 and cameraFacing.Z > 0 then
                            newBrick.Position = cameraPosition + Vector3.new(-7, 0, 7)
                            if cameraFacing.Y > 0 then
                                newBrick.Position = newBrick.Position + Vector3.new(0, 7, 0)
                            else
                                newBrick.Position = newBrick.Position + Vector3.new(0, -7, 0)
                            end
                        end
                        if cameraFacing.X > 0 and cameraFacing.Z < 0 then
                            newBrick.Position = cameraPosition + Vector3.new(7, 0, -7)
                            if cameraFacing.Y > 0 then
                                newBrick.Position = newBrick.Position + Vector3.new(0, 7, 0)
                            else
                                newBrick.Position = newBrick.Position + Vector3.new(0, -7, 0)
                            end
                        end
                        if cameraFacing.X < 0 and cameraFacing.Z < 0 then
                            newBrick.Position = cameraPosition + Vector3.new(-7, 0, -7)
                            if cameraFacing.Y > 0 then
                                newBrick.Position = newBrick.Position + Vector3.new(0, 7, 0)
                            else
                                newBrick.Position = newBrick.Position + Vector3.new(0, -7, 0)
                            end
                        end
                    end
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
                                --send a remote event to the server that a brick has been selected and when you are able to move it with click and drag. Make sure that you can't move the brick through collisions. I'll make an option to where you can in the future.
                            else
                                clicked = false
                                newBrick.Transparency = 0
                            end
                        end
                        
                    end)
                    player.PlayerGui.BrickList.Enabled = false
                end
            end
        end
    end

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

function PlayerUIHandler:LoadCreationSettingsButton(player)
    
end

function PlayerUIHandler:CreationSettingsButtonHandler(player)
    --check to see if the player is a player and if they are the owner if not reject them
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

return PlayerUIHandler