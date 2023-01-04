--DataStore Variables and serverId
local DataStoreService = game:GetService("DataStoreService") 
local serverInfoStore = DataStoreService:GetDataStore("ServerInfoStore")
local serverOwner = DataStoreService:GetDataStore("ServerInfoStore", "owner")
local serverBuildersList = DataStoreService:GetDataStore("ServerInfoStore", "builders")
local OnBuilderListLoaded = game:GetService("ServerStorage").OnBuilderListLoaded
local OnOwner = game:GetService("ServerStorage").OnOwnerLoaded
local Owner = game:GetService("ServerStorage").Owner
local serverId = game.PrivateServerId


local ServerInfoData = {}

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
                OnBuilderListLoaded:Fire(buildersList)
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
            Owner.Value = owner
            OnOwner:Fire(player.Name)
            --fire event that owner has been set
            
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
--when player adds someone to the builders list we will fire an event that will then call load build ui for that player


end

return ServerInfoData
