--DataStore Variables and serverId
local DataStoreService = game:GetService("DataStoreService") 
local serverInfoStore = DataStoreService:GetDataStore("ServerInfoStore")
local serverOwner = DataStoreService:GetDataStore("ServerInfoStore", "owner")
local serverBuildersList = DataStoreService:GetDataStore("ServerInfoStore", "builders")
local serverId = game.PrivateServerId

local ServerInfoData = {}


--Variables for the ServerInfoData service and signals
ServerInfoData.builders = {}

function ServerInfoData:LoadServerData(player)
--check to see if there is any server info for this server
    local successServer, serverInfo = pcall(function()
        return serverInfoStore:GetAsync(player.Name)
    end)

    if successServer then
        --if there is not data for this server add server to the server info list
        if serverInfo == nil then
            local success, error = pcall(function()
                serverInfoStore:SetAsync(player.Name, serverId)
            end)
        end
        --load the builders list and update the ServerInfoData.builders property
        local success, buildersList = pcall(function()
            return serverBuildersList:GetAsync(player.Name)
        end)
        if success then
            --if the builders list is not empty update the ServerInfoData.builders property
            if buildersList ~= {} or buildersList ~= nil then
                self.builders = buildersList
            end
        end
    end
end

function ServerInfoData:SaveBuildersList(player)
--we will save a new builders list after the owner leaves the server

end
--after join data is detected which should only be the owner set the owner
function ServerInfoData:SetOwner(player)
    --check to see if there is an owner for this server if not set the player as the owner
    local successOwner, owner = pcall(function()
        return serverOwner:GetAsync(player.Name)
    end)
    if successOwner then
        if owner ~= nil then
            --PlayerUIHandler.CreateCreationSettings()
        end
        if owner == nil then
            table.insert(self.builders, player.Name)
            local success, error = pcall(function()
                serverOwner:SetAsync(player.Name, player.Name)
            end)
            if success then
                --PlayerUIHandler.CreateCreationSettings()
            end
        end
    end
end

--Update server info functions


function ServerInfoData:AddToServerBuildersList(player)



end

return ServerInfoData
