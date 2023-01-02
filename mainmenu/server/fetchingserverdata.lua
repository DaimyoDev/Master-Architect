local DataStoreService = game:GetService("DataStoreService")
local serverList = DataStoreService:GetDataStore("ServerList")
local TeleportService = game:GetService("TeleportService")
local TeleportOptions = Instance.new("TeleportOptions")
local teleportData = {}

local fetchingServerData = {}

function fetchingServerData.CheckForServer(player)
    local success, ownsServer = pcall(function()
        return serverList:GetAsync(player.Name) 
    end)
    if ownsServer == nil then
        local code = TeleportService:ReserveServer(11960320745)
        teleportData["reservedServerCode"] = code
        local success, errorMessage = pcall(function() 
            serverList:SetAsync(player.Name, code)
        end)
        if not success then
            print(errorMessage)
        end
        TeleportOptions.ReservedServerAccessCode = code
        TeleportOptions:SetTeleportData(teleportData)
        TeleportService:TeleportAsync(11960320745, {player}, TeleportOptions)
    else
        TeleportOptions.ReservedServerAccessCode = serverList:GetAsync(player.Name)
        teleportData["reservedServerCode"] = serverList:GetAsync(player.Name)
        TeleportOptions:SetTeleportData(teleportData)
        TeleportService:TeleportAsync(11960320745, {player}, TeleportOptions)
    end
    if ownsServer ~= nil then
        print(ownsServer)
    end
end

return fetchingServerData