local cameraSpawn = game.Workspace.CameraSpawn
local camera = game.Workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Scriptable
local position = Vector3.new(cameraSpawn.Position.x, cameraSpawn.Position.y + 4, cameraSpawn.Position.z)
local lookAt = Vector3.new(cameraSpawn.Orientation.x - 50, cameraSpawn.Orientation.y, cameraSpawn.Orientation.z)
local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService") 
local velocityForward = CFrame.new(0, 0, -0.3)
local velocityBackward = CFrame.new(0, 0, 0.3)
local velocityLeft = CFrame.new(-0.3, 0, 0)
local velocityRight = CFrame.new(0.3, 0, 0)
local sensitivity = 0.2
local TogglePlayMode = game.ReplicatedStorage.TogglePlayMode
local humanoidRootPart
game.Workspace.CurrentCamera.CFrame = CFrame.new(position, lookAt)

--if play mode then set camera type and change humanoid root part.

player.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = humanoid.RootPart
    humanoidRootPart.Anchored = true
    humanoidRootPart.CanCollide = false
end)

TogglePlayMode.OnClientEvent:Connect(function(playMode)
    if playMode == "false" then
        camera.CameraType = Enum.CameraType.Custom
        local success, error = pcall(function()
            humanoidRootPart.Anchored = false
            humanoidRootPart.CanCollide = true
        end)
    end
    if playMode == "true" then
        camera.CameraType = Enum.CameraType.Scriptable
        local success, error = pcall(function()
            humanoidRootPart.Anchored = true
            humanoidRootPart.CanCollide = false
        end)
    end
    
end)

local function onRenderStep()
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        camera.CFrame = camera.CFrame * velocityForward
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        camera.CFrame = camera.CFrame * velocityBackward
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        camera.CFrame = camera.CFrame * velocityLeft
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        camera.CFrame = camera.CFrame * velocityRight
    end
    if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
        local delta = UserInputService:GetMouseDelta()
        local rotationX, rotationY, rotationZ = camera.CFrame:ToOrientation()
        local rotationZDeg = math.deg(rotationZ)
        if rotationZDeg > 0 or rotationZDeg < 0 then
            camera.CFrame = camera.CFrame * CFrame.Angles(-math.rad(0),-math.rad(0),math.rad(-rotationZDeg))
        end
        camera.CFrame = camera.CFrame * CFrame.Angles(-math.rad(delta.Y) * sensitivity,-math.rad(delta.X) * sensitivity,math.rad(0))
    else
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end
end

RunService:BindToRenderStep("MeasureMouseMovement", Enum.RenderPriority.Input.Value, onRenderStep)