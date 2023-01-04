--This script will handle regarding the display and events of the player ui
local ChangeBrickList = game.ReplicatedStorage.ChangeBrickList
local Owner = game:GetService("ServerStorage").Owner
local PlayerUIHandler = {}

PlayerUIHandler.buildersList = {}


function PlayerUIHandler:UpdateBuildersList(newBuildersList)
    self.buildersList = newBuildersList
end

function PlayerUIHandler:LoadBuildUI(builder)
    if builder then
        local isBuilder = table.find(PlayerUIHandler.buildersList, builder)
        if isBuilder ~= nil then
            local PlayersList = game:GetService("Players"):GetPlayers()
            for index, player in ipairs(PlayersList) do
                if player.Name == builder then
                    player.PlayerGui.BuildUI.Enabled = true
                end
            end
        end
    end
end

function PlayerUIHandler:LoadCreationSettingsButton(player)
    
end

function PlayerUIHandler:CreationSettingsButtonHandler(player)
    --check to see if the player is a player and if they are the owner if not reject them
end

function PlayerUIHandler:BrickListButtonHandler(player)
    if player.Name then
        local isBuilder = table.find(PlayerUIHandler.buildersList, player.Name)
        if isBuilder ~= nil then
        player.PlayerGui.BrickList.Enabled = true
        end
    end
end

ChangeBrickList.OnServerEvent:Connect(PlayerUIHandler.BrickListButtonHandler)

return PlayerUIHandler