local Player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local WindowTitle = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local Icon = Instance.new("ImageLabel")
local MessageText = Instance.new("TextLabel")
local ButtonFrame = Instance.new("Frame")
local OkButton1 = Instance.new("TextButton")
local OkButton2 = Instance.new("TextButton")

-- Kick function
local function kickPlayer()
    Player:Kick("suck my dick fuckink skid")
end

--Properties:
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 400, 0, 180)

TitleBar.Parent = Frame
TitleBar.BackgroundColor3 = Color3.fromRGB(33, 96, 163)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 30)

WindowTitle.Parent = TitleBar
WindowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WindowTitle.BackgroundTransparency = 1.0
WindowTitle.Position = UDim2.new(0, 10, 0, 0)
WindowTitle.Size = UDim2.new(1, -40, 1, 0)
WindowTitle.Font = Enum.Font.SourceSansBold
WindowTitle.Text = "rat.exe"
WindowTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
WindowTitle.TextSize = 14
WindowTitle.TextXAlignment = Enum.TextXAlignment.Left

CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.0
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.MouseButton1Click:Connect(kickPlayer)

Icon.Parent = Frame
Icon.BackgroundTransparency = 1.0
Icon.Position = UDim2.new(0, 20, 0, 50)
Icon.Size = UDim2.new(0, 32, 0, 32)
Icon.Image = "rbxassetid://11236652215"

MessageText.Parent = Frame
MessageText.BackgroundTransparency = 1.0
MessageText.Position = UDim2.new(0, 70, 0, 55)
MessageText.Size = UDim2.new(1, -80, 0, 50)
MessageText.Font = Enum.Font.SourceSans
MessageText.Text = "Grant file access to RAT.exe"
MessageText.TextColor3 = Color3.fromRGB(0, 0, 0)
MessageText.TextSize = 16
MessageText.TextWrapped = true
MessageText.TextXAlignment = Enum.TextXAlignment.Left

ButtonFrame.Parent = Frame
ButtonFrame.BackgroundTransparency = 1.0
ButtonFrame.Position = UDim2.new(0, 0, 1, -50)
ButtonFrame.Size = UDim2.new(1, 0, 0, 30)

OkButton1.Parent = ButtonFrame
OkButton1.AnchorPoint = Vector2.new(0.5, 0.5)
OkButton1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
OkButton1.BorderColor3 = Color3.fromRGB(172, 172, 172)
OkButton1.Position = UDim2.new(0.33, 0, 0.5, 0)
OkButton1.Size = UDim2.new(0, 75, 0, 23)
OkButton1.Font = Enum.Font.SourceSans
OkButton1.Text = "Ok"
OkButton1.TextColor3 = Color3.fromRGB(0, 0, 0)
OkButton1.TextSize = 14
OkButton1.MouseButton1Click:Connect(kickPlayer)

OkButton2.Parent = ButtonFrame
OkButton2.AnchorPoint = Vector2.new(0.5, 0.5)
OkButton2.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
OkButton2.BorderColor3 = Color3.fromRGB(172, 172, 172)
OkButton2.Position = UDim2.new(0.66, 0, 0.5, 0)
OkButton2.Size = UDim2.new(0, 75, 0, 23)
OkButton2.Font = Enum.Font.SourceSans
OkButton2.Text = "Ok"
OkButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
OkButton2.TextSize = 14
OkButton2.MouseButton1Click:Connect(kickPlayer)

-- Make draggable
local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
