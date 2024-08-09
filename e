
local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")

local function resizeCharacter(scaleFactor)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Check for existing BodyScales and remove them if present
    local existingScale = character:FindFirstChild("BodyScale")
    if existingScale then
        existingScale:Destroy()
    end

    -- Create and apply BodyScales
    local bodyScale = Instance.new("BodyScale")
    bodyScale.Name = "BodyScale"
    bodyScale.Parent = character

    -- Apply the scale factor to the body parts
    bodyScale.HeadScale = scaleFactor
    bodyScale.BodyWidthScale = scaleFactor
    bodyScale.BodyHeightScale = scaleFactor
    bodyScale.BodyDepthScale = scaleFactor
end

local scaleFactor = 2 -- Adjust this value to make the player bigger or smaller
local isBig = false

-- Toggle size with the "G" key
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        isBig = not isBig
        if isBig then
            resizeCharacter(scaleFactor)
            print("Player is now big!")
        else
            resizeCharacter(1) -- Reset to normal size
            print("Player is now normal size.")
        end
    end
end)
