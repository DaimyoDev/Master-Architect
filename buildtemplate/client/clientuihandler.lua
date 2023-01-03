--All that needs to go here is to fire events to the server
local Knit = require(game:GetService("ReplicatedStorage").Packages.knit)
local ClientUIEventsHandler = Knit.CreateController { Name = "ClientUIEventsHandler" }
local PlayerUIHandler = Knit.GetService("PlayerUIHandler")

function ClientUIEventsHandler:OnBrickListButtonClick()
    PlayerUIHandler.BrickListButtonOpen:Fire()
end

--check to see if the player has the brick list button. If they do fire the event. They will only have it if they have permission to build stuff.

return ClientUIEventsHandler