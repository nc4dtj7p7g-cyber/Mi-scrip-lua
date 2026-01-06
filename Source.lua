-- LocalScript - Colócalo en StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuVelocidadGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 260, 0, 300)
mainFrame.Position = UDim2.new(0.5, -130, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 35, 60)  -- Azul oscuro elegante
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false  -- Empieza cerrado
mainFrame.Parent = screenGui

-- Esquinas redondeadas
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Título del menú
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.Text = "⚡ VELOCIDAD"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Etiqueta que muestra la velocidad actual
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 40)
speedLabel.Position = UDim2.new(0, 0, 0, 70)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Velocidad actual: 16"
speedLabel.TextColor3 = Color3.fromRGB(200, 255, 255)
speedLabel.TextScaled = true
speedLabel.Font = Enum.Font.Gotham
speedLabel.Parent = mainFrame

-- Velocidad actual (valor por defecto de Roblox)
local currentSpeed = 16

-- Función para cambiar la velocidad
local function setSpeed(newSpeed)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = newSpeed
        currentSpeed = newSpeed
        speedLabel.Text = "Velocidad actual: " .. currentSpeed
    end
end

-- Botón SUBIR VELOCIDAD
local upButton = Instance.new("TextButton")
upButton.Size = UDim2.new(0.8, 0, 0, 50)
upButton.Position = UDim2.new(0.1, 0, 0, 130)
upButton.BackgroundColor3 = Color3.fromRGB(40, 170, 255)
upButton.Text = "+ Subir (+10)"
upButton.TextColor3 = Color3.fromRGB(255, 255, 255)
upButton.TextScaled = true
upButton.Font = Enum.Font.GothamBold
upButton.Parent = mainFrame

local upCorner = Instance.new("UICorner")
upCorner.CornerRadius = UDim.new(0, 8)
upCorner.Parent = upButton

upButton.MouseButton1Click:Connect(function()
    setSpeed(currentSpeed + 10)
end)

-- Botón BAJAR VELOCIDAD
local downButton = Instance.new("TextButton")
downButton.Size = UDim2.new(0.8, 0, 0, 50)
downButton.Position = UDim2.new(0.1, 0, 0, 190)
downButton.BackgroundColor3 = Color3.fromRGB(30, 120, 200)
downButton.Text = "- Bajar (-10)"
downButton.TextColor3 = Color3.fromRGB(255, 255, 255)
downButton.TextScaled = true
downButton.Font = Enum.Font.GothamBold
downButton.Parent = mainFrame

local downCorner = Instance.new("UICorner")
downCorner.CornerRadius = UDim.new(0, 8)
downCorner.Parent = downButton

downButton.MouseButton1Click:Connect(function()
    setSpeed(math.max(currentSpeed - 10, 1))  -- Mínimo 1 para no quedarse quieto
end)

-- Botón RESET
local resetButton = Instance.new("TextButton")
resetButton.Size = UDim2.new(0.8, 0, 0, 40)
resetButton.Position = UDim2.new(0.1, 0, 0, 250)
resetButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
resetButton.Text = "Reset a 16"
resetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
resetButton.TextScaled = true
resetButton.Font = Enum.Font.Gotham
resetButton.Parent = mainFrame

local resetCorner = Instance.new("UICorner")
resetCorner.CornerRadius = UDim.new(0, 8)
resetCorner.Parent = resetButton

resetButton.MouseButton1Click:Connect(function()
    setSpeed(16)
end)

-- Función para abrir/cerrar el menú
local function toggleMenu()
    mainFrame.Visible = not mainFrame.Visible
    if mainFrame.Visible then
        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, -130, 0.5, -150)}):Play()
    end
end

-- Abrir/cerrar con la tecla Insert
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        toggleMenu()
    end
end)

print("¡Menú de Velocidad listo! Presiona INSERT para abrirlo.")
