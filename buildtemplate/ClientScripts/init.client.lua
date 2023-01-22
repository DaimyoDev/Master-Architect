--when received message from server for the builderlist build a ui for each builder in the list. Make sure to check if the player is the owner before allowing the player to delete and add builders
local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local BrickSelected = game.ReplicatedStorage.BrickSelected
local bricksSelected = {}
local CloneBricks = game.ReplicatedStorage.CloneBricks
local UpdateBrick = game.ReplicatedStorage.UpdateBrick
local DeleteBrick = game.ReplicatedStorage.DeleteBrick
local moveSpeedChanger = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("BuildUI").MoveBricks.TextBox
local player = game:GetService("Players").LocalPlayer

local colorsList = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ColorsList")
local ColorChosen = game.ReplicatedStorage.ColorChosen
local brickColorList = colorsList.BrickColor

for index, brickButton in ipairs(brickColorList:GetChildren()) do
    if brickButton.Name ~= "BrickGrid" then
        brickButton.Activated:Connect(function()
        ColorChosen:FireServer(player, bricksSelected, brickButton.Name)
        colorsList.Enabled = false
        end)
    end
end

local function moveBrick(newBrick)
    if CollectionService:HasTag(newBrick, "Selected") then
        table.insert(bricksSelected, newBrick)
    else
       local index = table.find(bricksSelected, newBrick)
       if index ~= nil then
            table.remove(bricksSelected, index)
       end
    end
    while CollectionService:HasTag(newBrick, "Selected") do
        task.wait(0.05)
        if UserInputService:IsKeyDown(Enum.KeyCode.Y) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, 0, tonumber(moveSpeedChanger.Text))
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.H) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, 0, -tonumber(moveSpeedChanger.Text))
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.G) then 
            newBrick.Position = newBrick.Position + Vector3.new(tonumber(moveSpeedChanger.Text), 0, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.J) then 
            newBrick.Position = newBrick.Position + Vector3.new(-tonumber(moveSpeedChanger.Text), 0, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.T) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, tonumber(moveSpeedChanger.Text), 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.U) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, -tonumber(moveSpeedChanger.Text), 0)
        end
    end
end

UserInputService.InputBegan:Connect(function(input)
    for index, brick in ipairs(bricksSelected) do
        if input.KeyCode == Enum.KeyCode.R then
            local rotatedCFrame = CFrame.Angles(0, math.rad(15), 0)
            brick.CFrame = brick.CFrame:ToWorldSpace(rotatedCFrame)
        end
        if input.KeyCode == Enum.KeyCode.F then
            local rotatedXCFrame = CFrame.Angles(math.rad(15), 0, 0)
            brick.CFrame = brick.CFrame:ToWorldSpace(rotatedXCFrame)
        end
        if input.KeyCode == Enum.KeyCode.Delete then
            table.remove(bricksSelected, index)
            CollectionService:RemoveTag(brick, "Selected")
            DeleteBrick:FireServer(brick)
        end
        if input.KeyCode == Enum.KeyCode.C then
            print(brick.Material)
            CloneBricks:FireServer(brick, brick.CFrame)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.R or input.KeyCode == Enum.KeyCode.F or input.KeyCode == Enum.KeyCode.Y or input.KeyCode == Enum.KeyCode.H or input.KeyCode == Enum.KeyCode.G or input.KeyCode == Enum.KeyCode.J or input.KeyCode == Enum.KeyCode.T or input.KeyCode == Enum.KeyCode.U then
        local bricksSelectedCFrames = {}
        for index, brick in ipairs(bricksSelected) do
            table.insert(bricksSelectedCFrames, brick.CFrame)
        end
        UpdateBrick:FireServer(bricksSelected, bricksSelectedCFrames)
    end
end)

BrickSelected.OnClientEvent:Connect(function(newBrick)
        moveBrick(newBrick)
end)