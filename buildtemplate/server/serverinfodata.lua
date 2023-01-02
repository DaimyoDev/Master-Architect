local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)
local DataStoreService = game:GetService("DataStoreService") 
local serverInfoStore = DataStoreService:GetDataStore("ServerInfoStore")
local serverOwner = DataStoreService:GetDataStore("ServerInfoStore", "owner")
local serverBuildersList = DataStoreService:GetDataStore("ServerInfoStore", "builders")
local serverList = DataStoreService:GetDataStore("ServerList")
local serverId = game.PrivateServerId
local builders = {}

local ServerInfoData = Knit.CreateService { Name = "ServerInfoData", Client = {} }

function ServerInfoData:LoadServerData()
--check to see if there is any server info for this server

    local successServer, serverInfo = pcall(function()
        serverInfoStore:GetAsync(serverId)
    end)

    if successServer then
        --if there is not data for this server add server to the server info list
        if serverInfo == nil then
            local success, error = pcall(function()
                serverInfoStore:SetAsync(serverId, serverId)
            end)
        end
        --If there is a owner add them to the builders list then update the builder's list
        local successOwner, owner = pcall(function()
            serverOwner:GetAsync(serverId)
        end)
        if successOwner then
            if owner then
                table.insert(builders, owner)
                local success, error = pcall(function()
                    serverBuildersList:SetAsync(serverId, builders)
                end)
            end
        end
    end
end

function ServerInfoData:SaveData()


end
--after join data is detected which should only be the owner set the owner
function ServerInfoData:SetOwner(player)
    local success, error = pcall(function()
        serverOwner:SetAsync(serverId, player)
    end)
end




--Load server permissions list



--Update server info functions


function ServerInfoData:AddToServerBuildersList(player)



end

return ServerInfoData
