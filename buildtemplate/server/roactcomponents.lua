--this will contain all of the ui components for our ui
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)
local RoactComponents = Knit.CreateService {Name = "RoactComponents"}
local Roact = game:GetService("ReplicatedStorage").Roact

function RoactComponents.BrickListButton(props)

    return Roact.createElement("ImageButton", {
        Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
        Size = UDim2.new(0, 175, 0, 77)
    })
end

return RoactComponents