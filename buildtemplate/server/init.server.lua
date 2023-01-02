local Knit = require(game:GetService("ReplicatedStorage").Packages.knit)
local ServerInfoData = require(script.serverinfodata)
local Players = game:GetService("Players")
local reservedServerCode

Knit.Start():catch(warn)

Players.PlayerAdded:Connect(function(player)
    local joinData = player:GetJoinData()
    local teleportData = joinData.TeleportData
    --The only person with join data should be the owner of the server when it is first created players joining from the join creation button will not send join data.
    if joinData ~= nil then
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
