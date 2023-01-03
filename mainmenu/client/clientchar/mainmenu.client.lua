local player = game.Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local buildCreationButton = player:WaitForChild("PlayerGui"):WaitForChild("MainMenu")["Menu Frame"].BuildCreation
local startBuildServer = game.ReplicatedStorage.StartBuildServer

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

player.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    local humanoidRootPart = humanoid.RootPart
    humanoidRootPart.Anchored = true
    humanoidRootPart.CanCollide = false
end)

buildCreationButton.Activated:Connect(function()
    startBuildServer:FireServer()
end)