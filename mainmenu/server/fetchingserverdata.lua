local DataStoreService = game:GetService("DataStoreService")
local serverList = DataStoreService:GetDataStore("ServerList")
local serverPermissions = DataStoreService:GetDataStore("ServerList")
local TeleportService = game:GetService("TeleportService")
local TeleportOptions = Instance.new("TeleportOptions")

local fetchingServerData = {}

function fetchingServerData.CheckForServer(player)
    local success, ownsServer = pcall(function()
        return serverList:GetAsync(player.UserId) 
    end)
    if ownsServer == nil then
        local code = TeleportService:ReserveServer(11960320745)
        local success, errorMessage = pcall(function() 
            serverList:SetAsync(player.UserId, code)
        end)
        if not success then
            print(errorMessage)
        end
        TeleportOptions.ReservedServerAccessCode = code
        TeleportService:TeleportAsync(11960320745, {player}, TeleportOptions)
    else
        TeleportOptions.ReservedServerAccessCode = serverList:GetAsync(player.UserId)
        TeleportService:TeleportAsync(11960320745, {player}, TeleportOptions)
    end
    if ownsServer ~= nil then
        print(ownsServer)
    end
end

return fetchingServerData