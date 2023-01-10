--when received message from server for the builderlist build a ui for each builder in the list. Make sure to check if the player is the owner before allowing the player to delete and add builders
local UserInputService = game:GetService("UserInputService")
local BrickSelected = game.ReplicatedStorage.BrickSelected
local brickSelected = false
local camera = game.Workspace.CurrentCamera
local currentBrick

local function moveBrick(newBrick)
    currentBrick = newBrick
    while brickSelected do
        task.wait(0.01)
        if UserInputService:IsKeyDown(Enum.KeyCode.I) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, 0, 0.5)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.K) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, 0, -0.5)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.J) then 
            newBrick.Position = newBrick.Position + Vector3.new(0.5, 0, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.L) then 
            newBrick.Position = newBrick.Position + Vector3.new(-0.5, 0, 0)
        end
    end
end

UserInputService.InputBegan:Connect(function(input)
    if brickSelected then

    end
end)

BrickSelected.OnClientEvent:Connect(function(newBrick, clicked)
    if clicked then
        brickSelected = true
        moveBrick(newBrick)
    else
        brickSelected = false
    end

end)



