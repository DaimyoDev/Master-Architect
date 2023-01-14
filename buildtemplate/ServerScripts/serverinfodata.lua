local DataStoreService = game:GetService("DataStoreService") 
local serverInfoStore = DataStoreService:GetDataStore("ServerInfoStore")
local serverOwner = DataStoreService:GetDataStore("ServerInfoStore", "owner")
local serverBuildersList = DataStoreService:GetDataStore("ServerInfoStore", "builders")
local OnBuilderListLoaded = game:GetService("ServerStorage").OnBuilderListLoaded
local OnOwner = game:GetService("ServerStorage").OnOwnerLoaded
local Owner = game:GetService("ServerStorage").Owner
local serverPassword = DataStoreService:GetDataStore("ServerList", "password")
local serverId = game.PrivateServerId
local SetPassword = game.ReplicatedStorage.SetPassword


local ServerInfoData = {}

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
                if buildersList ~= nil then
                    for index, builder in ipairs(buildersList) do
                        table.insert(self.builders, builder)
                    end
                    OnBuilderListLoaded:Fire(buildersList)
                end
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
            OnOwner:Fire(player)
            --fire event that owner has been set
            
        end
        if owner == nil then
            table.insert(self.builders, player.Name)
            local success, error = pcall(function()
                serverOwner:SetAsync(player.Name, player.Name)
            end)
            local successBuild, error = pcall(function() 
                serverBuildersList:SetAsync(player.Name, self.builders)
            end)
            if success then
                Owner.Value = player.Name
                OnOwner:Fire(player)
                OnBuilderListLoaded:Fire(self.builders)
            end
        end
    end
end

--Update server info functions


function ServerInfoData:AddToServerBuildersList(player)
--when player adds someone to the builders list we will fire an event that will then call load build ui for that player


end

function ServerInfoData:RemoveFromServerBuildersList(player)


end

function updatePassword(player, password)
    print(player)
--check to see if the person changing the password is the owner and then set the new password into the data store.
    if player.Name == Owner.Value then
        local success, error = pcall(function()
            serverPassword:SetAsync(player.Name, tostring(password))
        end)
        if success then
            print(password)
        end
        if error then
            print(error)
        end
    end
end

SetPassword.OnServerEvent:Connect(updatePassword)

return ServerInfoData
