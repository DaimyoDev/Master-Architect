local startBuildServer = game.ReplicatedStorage.StartBuildServer
local fetchingServerData = require(script.Parent.fetchingserverdata)

local function createBuildServer(player)
    if player.UserId then
        fetchingServerData.CheckForServer(player)
    end
end

startBuildServer.OnServerEvent:Connect(createBuildServer)