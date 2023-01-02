local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

local PlayerModeService = Knit.CreateService { Name = "PlayerModeService", Client = {} }


--when players are in build mode we want them to be able to use the brick ui and building tools including the camera.
--when players are in play mode we want to get rid of their free camera. NOTE:
--Exploiters will be able to use free camera regardless. However they won't be able to build or do anything beside that.
--Why would an expoiter do this? Because they are stupid LMAO. The free camera won't help them at all.
--We want to prevent the player in play mode from accessing any of the build functions and tools. Hence it will all
--be serverside. The player asks if it can do it and the server decides if it can.

function PlayerModeService:BuildMode(player)

end

function PlayerModeService:PlayerMode(player)

end

return PlayerModeService