--when received message from server for the builderlist build a ui for each builder in the list. Make sure to check if the player is the owner before allowing the player to delete and add builders
local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local BrickSelected = game.ReplicatedStorage.BrickSelected
local bricksSelected = {}
local CloneBricks = game.ReplicatedStorage.CloneBricks
local UpdateBrick = game.ReplicatedStorage.UpdateBrick
local DeleteBrick = game.ReplicatedStorage.DeleteBrick
local moveSpeedChanger = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("BuildUI").MoveBricks.TextBox

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
        if UserInputService:IsKeyDown(Enum.KeyCode.I) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, 0, tonumber(moveSpeedChanger.Text))
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.K) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, 0, -tonumber(moveSpeedChanger.Text))
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.J) then 
            newBrick.Position = newBrick.Position + Vector3.new(tonumber(moveSpeedChanger.Text), 0, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.L) then 
            newBrick.Position = newBrick.Position + Vector3.new(-tonumber(moveSpeedChanger.Text), 0, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.U) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, tonumber(moveSpeedChanger.Text), 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.O) then 
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
            local index = table.find(bricksSelected, brick)
            if index ~= nil then
                table.remove(bricksSelected, index)
            end
            DeleteBrick:FireServer(brick)
        end
        if input.KeyCode == Enum.KeyCode.C then
            CloneBricks:FireServer(brick, brick.CFrame)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.R or input.KeyCode == Enum.KeyCode.F or input.KeyCode == Enum.KeyCode.I or input.KeyCode == Enum.KeyCode.K or input.KeyCode == Enum.KeyCode.J or input.KeyCode == Enum.KeyCode.L or input.KeyCode == Enum.KeyCode.U or input.KeyCode == Enum.KeyCode.O then
        for index, brick in ipairs(bricksSelected) do
            UpdateBrick:FireServer(brick, brick.CFrame)
        end
    end
end)

BrickSelected.OnClientEvent:Connect(function(newBrick, clicked)
        moveBrick(newBrick)
end)



