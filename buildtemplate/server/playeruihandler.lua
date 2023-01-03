--This script will handle regarding the display and events of the player ui
local Knit = require(game:GetService("ReplicatedStorage").Packages.knit)
local Packages = game:GetService("ReplicatedStorage").Packages
local PlayerUIHandler = Knit.CreateService {Name = "PlayerUIHandler", Client = {}}
local Signal = require(Packages.Signal)
local Roact = game:GetService("ReplicatedStorage").Roact
PlayerUIHandler.BrickListButtonOpen = Signal.new()

function PlayerUIHandler:BrickListButtonHandler(player)
--check to see if player is inside of the builders list from the server info data.
    PlayerUIHandler.BrickListButtonOpen:Connect(function(player) 
       --load the brick list ui
    end)

end

function PlayerUIHandler:CreateBuildUI()
    --build the ui for each builder in the builders list
end

return PlayerUIHandler