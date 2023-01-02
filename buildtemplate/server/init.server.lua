local Knit = require(game:GetService("ReplicatedStorage").Packages.knit)
local ServerInfoData = require(script.serverinfodata)
local Players = game:GetService("Players")


Knit.Start():catch(warn)

Players.PlayerAdded:Connect(function(player)
    local joinData = player:GetJoinData()
    --The only person with join data should be the owner of the server when it is first created or launched.
    if joinData ~= nil then
        local teleportData = joinData.TeleportData
        local reservedAccessCode = teleportData.reservedServerCode
        print(reservedAccessCode)
        ServerInfoData:SetOwner(player)
    end
end)
ServerInfoData:LoadServerData()