local Players = game:GetService("Players")
local ServerInfoData = require(script.serverinfodata)
local PlayerUIHandler = require(script.playeruihandler)
local OnBuilderListLoaded = game:GetService("ServerStorage").OnBuilderListLoaded
local OnOwnerLoaded = game:GetService("ServerStorage").OnOwnerLoaded
local Owner = game:GetService("ServerStorage").Owner
local reservedServerCode


--When players join see if they are the owner.
Players.PlayerAdded:Connect(function(player)
    --for now keep these for debugging purposes
    ServerInfoData:LoadServerData(player)
    ServerInfoData:SetOwner(player)
    -- these two lines above should be kept for debugging purposes
    local joinData = player:GetJoinData()
    local teleportData = joinData.TeleportData
    --The only person with join data should be the owner of the server when it is first created players joining from the join creation button will not send join data.
    if teleportData ~= {} then
        local success, error = pcall(function()
            reservedServerCode = teleportData.reservedServerCode
        end)
        if success then
            ServerInfoData:SetOwner(player)
            ServerInfoData:LoadServerData(player)
        end
        if error then
            print(error)
        end
    end
end)

--when the builders list is loaded update the player ui handler builders list
OnBuilderListLoaded.Event:Connect(function(newBuildersList)
    PlayerUIHandler:UpdateBuildersList(newBuildersList)
    for index, builder in ipairs(newBuildersList) do
        PlayerUIHandler:LoadBuildUI(builder)
    end
end)

--when the owner has been loaded or set enable the creation settings ui button
OnOwnerLoaded.Event:Connect(function(player)
    PlayerUIHandler:LoadCreationSettingsButton(player)
end)