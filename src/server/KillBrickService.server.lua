-- Getting all services
local Workspace = game:GetService("Workspace")

-- Creating necessary empty tables
local KillBricksTable = {}

-- Get all the killbricks in the obby
local function getKillBricks()
    local Table = {}
    for i, instance in pairs(Workspace:GetChildren()) do
        -- Get instances from the folder (Obbies)
        if instance:IsA("Folder") then
            for _i_, instance_ in pairs(instance:GetChildren()) do
                -- Get instances from the folder (Stages)
                if instance_:IsA("Folder") then
                    for i_, part in pairs(instance_:GetChildren()) do
                        -- Get killbricks if existent
                        if part:IsA("BasePart") and part.Name == "KillBrick" then
                            table.insert(Table, part)
                        end
                    end
                end
            end
        end
    end

    return(Table)
end

KillBricksTable = getKillBricks()

-- Kill it if it's a player
for _, KillBrick in KillBricksTable do
    KillBrick.Touched:Connect(function(part)
        local character = part:FindFirstAncestorOfClass("Model")
        local humanoid = character and character:FindFirstChild("Humanoid")

        if humanoid then
            humanoid.Health = 0
        end
    end)
end