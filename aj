local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

print("https://discord.gg/RZhX75z4b")

local BrainrotCard = require(ReplicatedStorage.Shared.BrainrotCard)
local OverheadController = require(ReplicatedStorage.Controllers.AnimalOverheadController)

local oldObserve
oldObserve = hookfunction(BrainrotCard.ObserveOneOfOne, function(record, callback)
    return oldObserve(record, function(_)
        callback(true)
    end)
end)

local originalPopulate
originalPopulate = hookfunction(OverheadController.Populate, function(self, data)
    originalPopulate(self, data)
    local banner = data.Overhead:FindFirstChild("1OF1Banner")
    if banner then
        banner.Visible = true
    end
end)

for _, instance in ipairs(Workspace:GetDescendants()) do
    if instance.Name == "1OF1Banner" then
        instance.Visible = true
    end
end

Workspace.DescendantAdded:Connect(function(instance)
    if instance.Name == "1OF1Banner" then
        instance.Visible = true
    end
end)
