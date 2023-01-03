--All that needs to go here is to fire events to the server
local Knit = require(game:GetService("ReplicatedStorage").Packages.knit)
local ClientUIEventsHandler = Knit.CreateController { Name = "ClientUIEventsHandler" }
local PlayerUIHandler

function ClientUIEventsHandler:KnitStart() 
    PlayerUIHandler = Knit.GetService("PlayerUIHandler")
end

function ClientUIEventsHandler:OnBrickListButtonClick()
    PlayerUIHandler.BrickListButtonOpen:Fire()
end

return ClientUIEventsHandler