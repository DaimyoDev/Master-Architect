--This script will handle regarding the display and events of the player ui
local Knit = require(game:GetService("ReplicatedStorage").Packages.knit)
local PlayerUIHandler = Knit.CreateService {Name = "PlayerUIHandler", Client = {}}
local Signal = require(Knit.Util.Signal)
local Roact = game:GetService("ReplicatedStorage").Roact
PlayerUIHandler.BrickListButtonOpen = Signal.new()

function PlayerUIHandler:BrickListButtonHandler(player)
--check to see if player is inside of the builders list from the server info data.
    PlayerUIHandler.BrickListButtonOpen:Connect(function(player) 
       --load the brick list ui
    end)

end

function PlayerUIHandler:CreateBuildUIFromBuildersList(buildersList)
    --check to see if the player is inside of the builders list from the server info data.
    for index, key in ipairs(buildersList) do
       --create build ui
       print(key)
    end
end

return PlayerUIHandler