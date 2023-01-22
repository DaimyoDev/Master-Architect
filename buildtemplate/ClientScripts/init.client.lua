--when received message from server for the builderlist build a ui for each builder in the list. Make sure to check if the player is the owner before allowing the player to delete and add builders
local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local BrickSelected = game.ReplicatedStorage.BrickSelected
local bricksSelected = {}
local CloneBricks = game.ReplicatedStorage.CloneBricks
local UpdateBrick = game.ReplicatedStorage.UpdateBrick
local DeleteBrick = game.ReplicatedStorage.DeleteBrick
local moveSpeedChanger = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("BuildUI").MoveBricks.TextBox
local player = game:GetService("Players").LocalPlayer

local colorsList = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ColorsList")
local ColorChosen = game.ReplicatedStorage.ColorChosen
local brickColorList = colorsList.BrickColor
local Black, Blue, Brown, Green, Orange, Pink, Purple, Red, Yellow = brickColorList.Black, brickColorList.Blue, brickColorList.Brown, brickColorList.Green, brickColorList.Orange, brickColorList.Pink, brickColorList.Purple, brickColorList.Red, brickColorList.Yellow
local Asphalt, AutumnRed, AzureBlue, Beige, BrickRed, BrilliantBlue, Bronze, Bumblebee, Burgundy, CalmBlue, CandyRed, Charcoal, Cookie, Cream, Cyan, DarkGreen, FrenchRose, Gold, GrapePurple, GraphiteBlack, GraphiteGrey, Grey, HealthyGreen, HotPink, Ivory, Jade, KhakiGrey, Lavender, LightGrey, LightLime, LightOrange, Lime, Mahogany, CornYellow, MiddleBlue, MidGrey, Mint, OchreBrown, OffWhite,  PastelBlue, PastelPink, PastelPurple, PastelYellow, Peach, PearlGreen, PineBrown, RedOrange, RoyalePurple, Rust, SaffronYellow, SalmonPink, SpringBud, SunYellow, Teal, Turquoise, White = brickColorList.Asphalt, brickColorList.AutumnRed, brickColorList.AzureBlue, brickColorList.Beige, brickColorList.BrickRed, brickColorList.BrilliantBlue, brickColorList.Bronze, brickColorList.Bumblebee, brickColorList.Burgundy, brickColorList.CalmBlue, brickColorList.CandyRed, brickColorList.Charcoal, brickColorList.Cookie, brickColorList.Cream, brickColorList.Cyan, brickColorList.DarkGreen, brickColorList.FrenchRose, brickColorList.Gold, brickColorList.GrapePurple, brickColorList.GraphiteBlack, brickColorList.GraphiteGrey, brickColorList.Grey, brickColorList.HealthyGreen, brickColorList.HotPink, brickColorList.Ivory, brickColorList.Jade, brickColorList.KhakiGrey, brickColorList.Lavender, brickColorList.LightGrey, brickColorList.LightLime, brickColorList.LightOrange, brickColorList.Lime, brickColorList.Mahogany, brickColorList.CornYellow, brickColorList.MiddleBlue, brickColorList.MidGrey, brickColorList.Mint, brickColorList.OchreBrown, brickColorList.OffWhite, brickColorList.PastelBlue, brickColorList.PastelPink, brickColorList.PastelPurple, brickColorList.PastelYellow, brickColorList.Peach, brickColorList.PearlGreen, brickColorList.PineBrown, brickColorList.RedOrange, brickColorList.RoyalePurple, brickColorList.Rust, brickColorList.SaffronYellow, brickColorList.SalmonPink, brickColorList.SpringBud, brickColorList.SunYellow, brickColorList.Teal, brickColorList.Turquoise, brickColorList.White

local function moveBrick(newBrick)
    if CollectionService:HasTag(newBrick, "Selected") then
        table.insert(bricksSelected, newBrick)
    else
       local index = table.find(bricksSelected, newBrick)
       if index ~= nil then
            table.remove(bricksSelected, index)
       end
    end
    while CollectionService:HasTag(newBrick, "Selected") do
        task.wait(0.05)
        if UserInputService:IsKeyDown(Enum.KeyCode.Y) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, 0, tonumber(moveSpeedChanger.Text))
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.H) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, 0, -tonumber(moveSpeedChanger.Text))
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.G) then 
            newBrick.Position = newBrick.Position + Vector3.new(tonumber(moveSpeedChanger.Text), 0, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.J) then 
            newBrick.Position = newBrick.Position + Vector3.new(-tonumber(moveSpeedChanger.Text), 0, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.T) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, tonumber(moveSpeedChanger.Text), 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.U) then 
            newBrick.Position = newBrick.Position + Vector3.new(0, -tonumber(moveSpeedChanger.Text), 0)
        end
    end
end

UserInputService.InputBegan:Connect(function(input)
    for index, brick in ipairs(bricksSelected) do
        if input.KeyCode == Enum.KeyCode.R then
            local rotatedCFrame = CFrame.Angles(0, math.rad(15), 0)
            brick.CFrame = brick.CFrame:ToWorldSpace(rotatedCFrame)
        end
        if input.KeyCode == Enum.KeyCode.F then
            local rotatedXCFrame = CFrame.Angles(math.rad(15), 0, 0)
            brick.CFrame = brick.CFrame:ToWorldSpace(rotatedXCFrame)
        end
        if input.KeyCode == Enum.KeyCode.Delete then
            table.remove(bricksSelected, index)
            CollectionService:RemoveTag(brick, "Selected")
            DeleteBrick:FireServer(brick)
        end
        if input.KeyCode == Enum.KeyCode.C then
            CloneBricks:FireServer(brick, brick.CFrame)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.R or input.KeyCode == Enum.KeyCode.F or input.KeyCode == Enum.KeyCode.Y or input.KeyCode == Enum.KeyCode.H or input.KeyCode == Enum.KeyCode.G or input.KeyCode == Enum.KeyCode.J or input.KeyCode == Enum.KeyCode.T or input.KeyCode == Enum.KeyCode.U then
        local bricksSelectedCFrames = {}
        for index, brick in ipairs(bricksSelected) do
            table.insert(bricksSelectedCFrames, brick.CFrame)
        end
        UpdateBrick:FireServer(bricksSelected, bricksSelectedCFrames)
    end
end)

BrickSelected.OnClientEvent:Connect(function(newBrick)
        moveBrick(newBrick)
end)

Asphalt.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Asphalt")
    colorsList.Enabled = false
end)

AutumnRed.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "AutumnRed")
    colorsList.Enabled = false
end)

AzureBlue.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "AzureBlue")
    colorsList.Enabled = false
end)

Beige.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Beige")
    colorsList.Enabled = false
end)

Black.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Black")
    colorsList.Enabled = false
end)

Blue.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Blue")
    colorsList.Enabled = false
end)

BrickRed.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "BrickRed")
    colorsList.Enabled = false
end)

BrilliantBlue.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "BrilliantBlue")
    colorsList.Enabled = false
end)

Bronze.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Bronze")
    colorsList.Enabled = false
end)

Brown.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Brown")
    colorsList.Enabled = false
end)

Bumblebee.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Bumblebee")
    colorsList.Enabled = false
end)

Burgundy.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Burgundy")
    colorsList.Enabled = false
end)

CalmBlue.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "CalmBlue")
    colorsList.Enabled = false
end)

CandyRed.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "CandyRed")
    colorsList.Enabled = false
end)

Charcoal.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Charcoal")
    colorsList.Enabled = false
end)

Cookie.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Cookie")
    colorsList.Enabled = false
end)

Cream.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Cream")
    colorsList.Enabled = false
end)

Cyan.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Cyan")
    colorsList.Enabled = false
end)

DarkGreen.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "DarkGreen")
    colorsList.Enabled = false
end)

FrenchRose.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "FrenchRose")
    colorsList.Enabled = false
end)

Gold.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Gold")
    colorsList.Enabled = false
end)

GrapePurple.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "GrapePurple")
    colorsList.Enabled = false
end)

GraphiteBlack.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "GraphiteBlack")
    colorsList.Enabled = false
end)

GraphiteGrey.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "GraphiteGrey")
    colorsList.Enabled = false
end)

Green.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Green")
    colorsList.Enabled = false
end)

Grey.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Grey")
    colorsList.Enabled = false
end)

HealthyGreen.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "HealthyGreen")
    colorsList.Enabled = false
end)

HotPink.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "HotPink")
    colorsList.Enabled = false
end)

Ivory.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Ivory")
    colorsList.Enabled = false
end)

Jade.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Jade")
    colorsList.Enabled = false
end)

KhakiGrey.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "KhakiGrey")
    colorsList.Enabled = false
end)

Lavender.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Lavender")
    colorsList.Enabled = false
end)

LightGrey.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "LightGrey")
    colorsList.Enabled = false
end)

LightLime.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "LightLime")
    colorsList.Enabled = false
end)

LightOrange.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "LightOrange")
    colorsList.Enabled = false
end)

Lime.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Lime")
    colorsList.Enabled = false
end)

Mahogany.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Mahogany")
    colorsList.Enabled = false
end)

CornYellow.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "CornYellow")
    colorsList.Enabled = false
end)

MiddleBlue.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "MiddleBlue")
    colorsList.Enabled = false
end)

MidGrey.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "MidGrey")
    colorsList.Enabled = false
end)

Mint.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Mint")
    colorsList.Enabled = false
end)

OchreBrown.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "OchreBrown")
    colorsList.Enabled = false
end)

OffWhite.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "OffWhite")
    colorsList.Enabled = false
end)

Orange.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Orange")
    colorsList.Enabled = false
end)

PastelBlue.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "PastelBlue")
    colorsList.Enabled = false
end)

PastelPink.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "PastelPink")
    colorsList.Enabled = false
end)

PastelPurple.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "PastelPurple")
    colorsList.Enabled = false
end)

PastelYellow.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "PastelYellow")
    colorsList.Enabled = false
end)

Peach.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Peach")
    colorsList.Enabled = false
end)

PearlGreen.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "PearlGreen")
    colorsList.Enabled = false
end)

PineBrown.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "PineBrown")
    colorsList.Enabled = false
end)

Pink.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Pink")
    colorsList.Enabled = false
end)

Purple.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Purple")
    colorsList.Enabled = false
end)

Red.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Red")
    colorsList.Enabled = false
end)

RedOrange.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "RedOrange")
    colorsList.Enabled = false
end)

RoyalePurple.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "RoyalePurple")
    colorsList.Enabled = false
end)

Rust.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Rust")
    colorsList.Enabled = false
end)

SaffronYellow.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "SaffronYellow")
    colorsList.Enabled = false
end)

SalmonPink.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "SalmonPink")
    colorsList.Enabled = false
end)

SpringBud.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "SpringBud")
    colorsList.Enabled = false
end)

SunYellow.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "SunYellow")
    colorsList.Enabled = false
end)

Teal.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Teal")
    colorsList.Enabled = false
end)

Turquoise.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Turquoise")
    colorsList.Enabled = false
end)

White.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "White")
    colorsList.Enabled = false
end)

Yellow.Activated:Connect(function() 
    ColorChosen:FireServer(player, bricksSelected, "Yellow")
    colorsList.Enabled = false
end)

