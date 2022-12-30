local startBuildServer = game.ReplicatedStorage.StartBuildServer
local TeleportService = game:GetService("TeleportService") 

local function createBuildServer(player)
    if player.UserId then
        local code = TeleportService:ReserveServer(11960320745)
        local TeleportOptions = Instance.new("TeleportOptions")
        TeleportOptions.ReservedServerAccessCode = code
        TeleportService:TeleportAsync(11960320745, {player}, TeleportOptions)
    end
end

startBuildServer.OnServerEvent:Connect(createBuildServer)