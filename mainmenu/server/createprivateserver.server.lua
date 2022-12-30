local startBuildServer = game.ReplicatedStorage.StartBuildServer
local TeleportService = game:GetService("TeleportService") 

local function createBuildServer(player) then
    if player.UserId then
        TeleportService:ReserveServer(11960320745)
        local code = player.UserId
        TeleportService:TeleportToPrivateServer(11960320745, code, player)
    end
end