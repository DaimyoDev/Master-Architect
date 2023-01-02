local Knit = require(game:GetService("ReplicatedStorage").Packages.knit)
local ServerInfoData = require(script.serverinfodata)
local Players = game:GetService("Players")

Knit.Start():catch(warn)

Players.PlayerAdded:Connect(function(player)
ServerInfoData:CheckIfOwner(player)
end)
ServerInfoData:LoadServerData()