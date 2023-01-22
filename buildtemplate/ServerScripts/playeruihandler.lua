--This script will handle regarding the display and events of the player ui
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList
local CollectionService = game:GetService("CollectionService")
local Owner = game:GetService("ServerStorage").Owner
local AddBrick = game.ReplicatedStorage.AddBrick
local TogglePlayMode = game.ReplicatedStorage.TogglePlayMode
local OpenCreationSettings= game.ReplicatedStorage.OpenCreationSettings
local BrickSelected = game.ReplicatedStorage.BrickSelected
local playMode = true
local PlayerUIHandler = {}
local CloneBricks = game.ReplicatedStorage.CloneBricks
local UpdateBrick = game.ReplicatedStorage.UpdateBrick
local DeleteBrick = game.ReplicatedStorage.DeleteBrick
local OpenColorList = game.ReplicatedStorage.OpenColorList
local ColorChosen = game.ReplicatedStorage.ColorChosen

PlayerUIHandler.buildersList = {}


function PlayerUIHandler:OnBrickListButtonClick(player, brickType)
    if player.Name then
        local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
        if isBuilder ~= nil then

            local newBrick = Instance.new("Part")
            newBrick.Parent = workspace
            newBrick.Name = "Brick"
            newBrick.Anchored = true
            newBrick.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
                    
            if brickType == "Brick1x1x1" then
                newBrick.Size = Vector3.new(1, 1, 1)
            end
            if brickType == "Brick1x1x2" then
                newBrick.Size = Vector3.new(1, 1, 2)
            end
            if brickType == "Brick1x1x3" then
                newBrick.Size = Vector3.new(1, 1, 3)
            end
            if brickType == "Brick1x1x4" then
                newBrick.Size = Vector3.new(1, 1, 4)
            end
            if brickType == "Brick1x1x5" then
                newBrick.Size = Vector3.new(1, 1, 5)
            end
            if brickType == "Brick1x2x1" then
                newBrick.Size = Vector3.new(1, 2, 1)
            end
            if brickType == "Brick1x3x1" then
                newBrick.Size = Vector3.new(1, 3, 1)
            end
            if brickType == "Brick1x5x1" then
                newBrick.Size = Vector3.new(1, 5, 1)
            end
            if brickType == "Brick2x1x1" then
                newBrick.Size = Vector3.new(2, 1, 1)
            end
            if brickType == "Brick2x1x2" then
                newBrick.Size = Vector3.new(2, 1, 2)
            end
            if brickType == "Brick2x2x2" then
                newBrick.Size = Vector3.new(2, 2, 2)
            end
            if brickType == "Brick2x3x2" then
                newBrick.Size = Vector3.new(2, 3, 2)
            end
            if brickType == "Brick3x1x2" then
                newBrick.Size = Vector3.new(3, 1, 2)
            end
            if brickType == "Brick3x1x3" then
                newBrick.Size = Vector3.new(3, 1, 3)
            end
            if brickType == "Brick4x1x1" then
                newBrick.Size = Vector3.new(4, 1, 1)
            end
            if brickType == "Brick4x1x2" then
                newBrick.Size = Vector3.new(4, 1, 2)
            end
            if brickType == "Brick4x1x3" then
                newBrick.Size = Vector3.new(4, 1, 3)
            end
            if brickType == "Brick4x1x3" then
                newBrick.Size = Vector3.new(4, 1, 3)
            end
            if brickType == "Brick4x1x4" then
                newBrick.Size = Vector3.new(4, 1, 4)
            end
            if brickType == "Brick4x2x1" then
                newBrick.Size = Vector3.new(4, 2, 1)
            end
            if brickType == "Brick4x2x2" then
                newBrick.Size = Vector3.new(4, 2, 2)
            end
            if brickType == "Brick4x3x1" then
                newBrick.Size = Vector3.new(4, 3, 1)
            end
            if brickType == "Brick4x4x1" then
                newBrick.Size = Vector3.new(4, 4, 1)
            end
            if brickType == "Brick4x4x4" then
                newBrick.Size = Vector3.new(4, 4, 4)
            end
            if brickType == "Brick4x5x1" then
                newBrick.Size = Vector3.new(4, 5, 1)
            end
            if brickType == "Brick5x1x1" then
                newBrick.Size = Vector3.new(5, 1, 1)
            end
            if brickType == "Brick5x1x2" then
                newBrick.Size = Vector3.new(5, 1, 2)
            end
            if brickType == "Brick5x1x5" then
                newBrick.Size = Vector3.new(5, 1, 5)
            end
            if brickType == "Brick5x2x1" then
                newBrick.Size = Vector3.new(5, 2, 1)
            end
            if brickType == "Brick5x2x2" then
                newBrick.Size = Vector3.new(5, 2, 2)
            end
            if brickType == "Brick5x3x2" then
                newBrick.Size = Vector3.new(5, 3, 2)
            end
            if brickType == "Brick5x3x3" then
                newBrick.Size = Vector3.new(5, 3, 3)
            end
            if brickType == "Brick5x4x3" then
                newBrick.Size = Vector3.new(5, 4, 3)
            end
            if brickType == "Brick5x4x4" then
                newBrick.Size = Vector3.new(5, 4, 4)
            end
            if brickType == "Brick5x5x5" then
                newBrick.Size = Vector3.new(5, 5, 5)
            end
            if brickType == "Brick6x1x1" then
                newBrick.Size = Vector3.new(6, 1, 1)
            end
            if brickType == "Brick8x1x1" then
                newBrick.Size = Vector3.new(8, 1, 1)
            end
            if brickType == "Brick8x1x8" then
                newBrick.Size = Vector3.new(8, 1, 8)
            end
            if brickType == "Brick8x2x1" then
                newBrick.Size = Vector3.new(8, 2, 1)
            end
            if brickType == "Brick8x3x1" then
                newBrick.Size = Vector3.new(8, 3, 1)
            end
            if brickType == "Brick8x4x1" then
                newBrick.Size = Vector3.new(8, 4, 1)
            end
            if brickType == "Brick8x5x1" then
                newBrick.Size = Vector3.new(8, 5, 1)
            end
            if brickType == "Brick8x8x8" then
                newBrick.Size = Vector3.new(8, 8, 8)
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
                    local success, error = pcall(function() 
                        player.PlayerGui.BuildUI.Enabled = true
                    end)
                    if error then
                        task.wait(5)
                        player.PlayerGui.BuildUI.Enabled = true
                    end
                end
            end
        end
    end
end

function PlayerUIHandler:LoadBuildUIForOwner(player)
    if player.Name == Owner.Value then
        local success, error = pcall(function() 
            player.PlayerGui.BuildUI.Enabled = true
        end)
        if error then
            task.wait(5)
            player.PlayerGui.BuildUI.Enabled = true
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
                if color == "Asphalt" then
                    brick.Color = Color3.fromRGB(32, 32, 32)
                end
                if color == "AutumnRed" then
                    brick.Color = Color3.fromRGB(255, 73, 0)
                end
                if color == "AzureBlue" then
                    brick.Color = Color3.fromRGB(0, 104, 204)
                end
                if color == "Beige" then
                    brick.Color = Color3.fromRGB(255, 241, 190)
                end
                if color == "Black" then
                    brick.Color = Color3.fromRGB(0, 0, 0)
                end
                if color == "Blue" then
                    brick.Color = Color3.fromRGB(20, 24, 255)
                end
                if color == "BrickRed" then
                    brick.Color = Color3.fromRGB(151, 0, 0)
                end
                if color == "BrilliantBlue" then
                    brick.Color = Color3.fromRGB(62, 95, 138)
                end
                if color == "Bronze" then
                    brick.Color = Color3.fromRGB(233, 134, 0)
                end
                if color == "Brown" then
                    brick.Color = Color3.fromRGB(95, 47, 15)
                end
                if color == "Bumblebee" then
                    brick.Color = Color3.fromRGB(255, 213, 0)
                end
                if color == "Burgundy" then
                    brick.Color = Color3.fromRGB(122, 0, 0)
                end
                if color == "CalmBlue" then
                    brick.Color = Color3.fromRGB(118, 186, 255)
                end
                if color == "CandyRed" then
                    brick.Color = Color3.fromRGB(255, 134, 134)
                end
                if color == "Charcoal" then
                    brick.Color = Color3.fromRGB(30, 30, 30)
                end
                if color == "Cookie" then
                    brick.Color = Color3.fromRGB(167, 103, 6)
                end
                if color == "Cream" then
                    brick.Color = Color3.fromRGB(253, 244, 227)
                end
                if color == "Cyan" then
                    brick.Color = Color3.fromRGB(0, 242, 231)
                end
                if color == "DarkGreen" then
                    brick.Color = Color3.fromRGB(0, 62, 0)
                end
                if color == "FrenchRose" then
                    brick.Color = Color3.fromRGB(204, 0, 75)
                end
                if color == "Gold" then
                    brick.Color = Color3.fromRGB(210, 179, 16)
                end
                if color == "GrapePurple" then
                    brick.Color = Color3.fromRGB(86, 0, 58)
                end
                if color == "GraphiteBlack" then
                    brick.Color = Color3.fromRGB(28, 28, 28)
                end
                if color == "GraphiteGrey" then
                    brick.Color = Color3.fromRGB(71, 74, 81)
                end
                if color == "Green" then
                    brick.Color = Color3.fromRGB(13, 135, 21)
                end
                if color == "Grey" then
                    brick.Color = Color3.fromRGB(100, 100, 100)
                end
                if color == "HealthyGreen" then
                    brick.Color = Color3.fromRGB(0, 114, 0)
                end
                if color == "HotPink" then
                    brick.Color = Color3.fromRGB(250, 0, 220)
                end
                if color == "Ivory" then
                    brick.Color = Color3.fromRGB(225, 204, 79)
                end
                if color == "Jade" then
                    brick.Color = Color3.fromRGB(0, 161, 82)
                end
                if color == "KhakiGrey" then
                    brick.Color = Color3.fromRGB(106, 95, 49)
                end
                if color == "Lavender" then
                    brick.Color = Color3.fromRGB(167, 95, 141)
                end
                if color == "LightGrey" then
                    brick.Color = Color3.fromRGB(150, 150, 150)
                end
                if color == "LightLime" then
                    brick.Color = Color3.fromRGB(164, 255, 42)
                end
                if color == "LightOrange" then
                    brick.Color = Color3.fromRGB(255, 184, 23)
                end
                if color == "Lime" then
                    brick.Color = Color3.fromRGB(140, 219, 0)
                end
                if color == "Mahogany" then
                    brick.Color = Color3.fromRGB(76, 47, 39)
                end
                if color == "CornYellow" then
                    brick.Color = Color3.fromRGB(228, 160, 16)
                end
                if color == "MiddleBlue" then
                    brick.Color = Color3.fromRGB(60, 109, 255)
                end
                if color == "MidGrey" then
                    brick.Color = Color3.fromRGB(174, 174, 174)
                end
                if color == "Mint" then
                    brick.Color = Color3.fromRGB(97, 255, 132)
                end
                if color == "OchreBrown" then
                    brick.Color = Color3.fromRGB(149, 95, 32)
                end
                if color == "OffWhite" then
                    brick.Color = Color3.fromRGB(222, 222, 222)
                end
                if color == "Orange" then
                    brick.Color = Color3.fromRGB(255, 170, 0)
                end
                if color == "PastelBlue" then
                    brick.Color = Color3.fromRGB(163, 219, 220)
                end
                if color == "PastelPink" then
                    brick.Color = Color3.fromRGB(255, 219, 220)
                end
                if color == "PastelPurple" then
                    brick.Color = Color3.fromRGB(241, 209, 255)
                end
                if color == "PastelYellow" then
                    brick.Color = Color3.fromRGB(248, 251, 128)
                end
                if color == "Peach" then
                    brick.Color = Color3.fromRGB(255, 217, 181)
                end
                if color == "PearlGreen" then
                    brick.Color = Color3.fromRGB(28, 84, 45)
                end
                if color == "PineBrown" then
                    brick.Color = Color3.fromRGB(58, 32, 0)
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
                if color == "RedOrange" then
                    brick.Color = Color3.fromRGB(201, 60, 32)
                end
                if color == "RoyalePurple" then
                    brick.Color = Color3.fromRGB(95, 22, 250)
                end
                if color == "Rust" then
                    brick.Color = Color3.fromRGB(193, 84, 5)
                end
                if color == "SaffronYellow" then
                    brick.Color = Color3.fromRGB(245, 208, 51)
                end
                if color == "SalmonPink" then
                    brick.Color = Color3.fromRGB(217, 80, 48)
                end
                if color == "SpringBud" then
                    brick.Color = Color3.fromRGB(219, 255, 162)
                end
                if color == "SunYellow" then
                    brick.Color = Color3.fromRGB(243, 159, 24)
                end
                if color == "Teal" then
                    brick.Color = Color3.fromRGB(0, 166, 150)
                end
                if color == "Turquoise" then
                    brick.Color = Color3.fromRGB(63, 136, 143)
                end
                if color == "White" then
                    brick.Color = Color3.fromRGB(255, 255, 255)
                end
                if color == "Yellow" then
                    brick.Color = Color3.fromRGB(255, 247, 0)
                end
            end
            player.PlayerGui.ColorsList.Enabled = false
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
        TogglePlayMode:FireClient(player, "false")
        playMode = true
    else
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