local cameraSpawn = game.Workspace.CameraSpawn
local camera = game.Workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Scriptable
local position = Vector3.new(cameraSpawn.Position.x, cameraSpawn.Position.y + 4, cameraSpawn.Position.z)
local lookAt = Vector3.new(cameraSpawn.Orientation.x - 50, cameraSpawn.Orientation.y, cameraSpawn.Orientation.z)
local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local movingForward, movingBackward, movingLeft, movingRight = false, false, false, false
local RunService = game:GetService("RunService") 
local mouseTwo = false
local velocityForward = CFrame.new(0, 0, -0.3)
local velocityBackward = CFrame.new(0, 0, 0.3)
local velocityLeft = CFrame.new(-0.3, 0, 0)
local velocityRight = CFrame.new(0.3, 0, 0)
local sensitivity = 0.2
game.Workspace.CurrentCamera.CFrame = CFrame.new(position, lookAt)
UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter


player.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    local humanoidRootPart = humanoid.RootPart
    humanoidRootPart.Anchored = true
    humanoidRootPart.CanCollide = false
end)

UserInputService.InputBegan:Connect(function(input)

    if input.KeyCode == Enum.KeyCode.W then
        movingForward = true
    end
    if input.KeyCode == Enum.KeyCode.S then
        movingBackward = true
    end
    if input.KeyCode == Enum.KeyCode.A then
        movingLeft = true
    end
    if input.KeyCode == Enum.KeyCode.D then
        movingRight = true
    end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        mouseTwo = true
    end

    while movingForward do
        task.wait(0.01)
        camera.CFrame = camera.CFrame * velocityForward
    end
    while movingBackward do
        task.wait(0.01)
        camera.CFrame = camera.CFrame * velocityBackward
    end
    while movingLeft do
        task.wait(0.01)
        camera.CFrame = camera.CFrame * velocityLeft
    end
    while movingRight do
        task.wait(0.01)
        camera.CFrame = camera.CFrame * velocityRight
    end
end)

local function onRenderStep()
    if mouseTwo then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
        local delta = UserInputService:GetMouseDelta()
        local rotationX, rotationY, rotationZ = camera.CFrame:ToOrientation()
        local rotationZDeg = math.deg(rotationZ)
        if rotationZDeg > 0 or rotationZDeg < 0 then
            camera.CFrame = camera.CFrame * CFrame.Angles(-math.rad(0),-math.rad(0),math.rad(-rotationZDeg))
        end
        camera.CFrame = camera.CFrame * CFrame.Angles(-math.rad(delta.Y) * sensitivity,-math.rad(delta.X) * sensitivity,math.rad(0))
    end
end



UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then
        movingForward = false
    end
    if input.KeyCode == Enum.KeyCode.S then
        movingBackward = false
    end
    if input.KeyCode == Enum.KeyCode.A then
        movingLeft = false
    end
    if input.KeyCode == Enum.KeyCode.D then
        movingRight = false
    end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        mouseTwo = false
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end
end)

RunService:BindToRenderStep("MeasureMouseMovement", Enum.RenderPriority.Input.Value, onRenderStep)