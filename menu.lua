local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "SPAWKA.lua",-- .. Fluent.Version
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
	Spawka = Window:AddTab({ Title = "Spawka Script", Icon = "ghost" }),
	Visual = Window:AddTab({ Title = "Visual", Icon = "camera"}),
	Other = Window:AddTab({ Title = "Other", Icon = "file-json-2" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "hello, have a good game with spawka.lua \nпривет удачной игры с spawka.lua",
        SubContent = "spawka.lua by pon", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })




	--OTHER




    Tabs.Other:AddParagraph({
        Title = "Evade",
        Content = "scripts for the game evade"
    })
	Tabs.Other:AddButton({
		Title = "dot.hub",
		Description = "a pretty good and free script for evade \nдовольно хороший и бесплатный скрипт для evade",
		Callback = function ()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/evade.lua"))()
		end
	})
	Tabs.Other:AddButton({
		Title = "zReal King",
		Description = "a strong script, but a key is required! \nнадежный скрипт, но требуется ключ!",
		Callback = function ()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua'))()
		end
	})
	Tabs.Other:AddButton({
		Title = "CanHub",
		Description = "free script no key \nбесплатный скрипт без ключа",
		Callback = function ()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/stuffman0001/CanHub/main/Code"))()
		end
	})




    --SPAWKA




    Tabs.Spawka:AddButton({
		Title = "TP Back",
		Description = "put a period and after clicking go back (bypasses some anti-cheats) \nпоставьте точку и после нажатия вернитесь назад (обходит некоторые античиты)",
		Callback = function ()
			Window:Dialog({
				Title = "info",
				Content = "saving a position: f / teleportation to a position: r \nсохранение позиции: f / телепортация на позицию: r",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function ()
							for i = 1, 1000000000000000000 do
								print("hi")
								local UserInputService = game:GetService("UserInputService")
								local player = game.Players.LocalPlayer
								local character = player.Character or player.CharacterAdded:Wait()
								local rootPart = character:WaitForChild("HumanoidRootPart")
								local savedCFrame = nil
                                
                                -- Функция для сохранения текущего CFrame игрока
								local function SaveCFrame()
								savedCFrame = rootPart.CFrame
								end
								
								-- Функция для восстановления CFrame игрока
								local function RestoreCFrame()
								    if savedCFrame then
										        rootPart.CFrame = savedCFrame
									end
								end

                                -- Привязываем сохранение к кнопке клавиатуры
								UserInputService.InputBegan:Connect(function(input)
								    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.F then
										        SaveCFrame()
								    end
								end)

                                -- Привязываем восстановление к другой кнопке клавиатуры
								UserInputService.InputBegan:Connect(function(input)
								    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.R then
										        RestoreCFrame()
									end
								end)
								wait(5)
							end
						end
					},
					{
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled script")
                        end
                    }
				}
			})
		end
	})
	Tabs.Spawka:AddButton({
		Title = "round time",
		--Description = "",
		Callback = function ()
		    Fluent:Notify({
				Title = "Notification",
				Content = game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD").Center.Vote.Info.Read.Timer.Text,
				Duration = 10 -- Set to nil to make the notification not disappear
		    })
		end
	})
    Tabs.Spawka:AddButton({
    Title = "tp to the generator",
    Description = "",
	Callback = function()
        local Generator = workspace.Game.Map.Parts.Objectives.Generator  -- Получаем ссылку на объект Generator
        local player = game.Players.LocalPlayer  -- Получаем ссылку на игрока, который использует код
        
        if Generator then
            -- Получаем позицию Generator
            local generatorPosition = Generator.Position

            -- Создаем новый CFrame для телепортации игрока к Generator
            local teleportCFrame = CFrame.new(generatorPosition + Vector3.new(0, 5, 0)) -- Пример: поднимаем игрока на 5 единиц вверх

            -- Телепортируем игрока к объекту Generator
            player.Character:SetPrimaryPartCFrame(teleportCFrame)
        else
            Fluent:Notify({
                Title = "Notification",
                Content = "Generator not found \nГенератор не найден",
                Duration = 10 -- Set to nil to make the notification not disappear
            })
            print("Generator не найден")
        end
    end
    })
	Tabs.Spawka:AddButton({
    Title = "tp to the switch",
    Description = "",
    Callback = function()
        local Switch = workspace.Game.Map.Parts.Objectives.Switch  -- Получаем ссылку на объект Switch
        local player = game.Players.LocalPlayer  -- Получаем ссылку на игрока, который использует код
        
        if Switch then
            -- Получаем позицию Switch
            local switchPosition = Switch.Position

            -- Создаем новый CFrame для телепортации игрока к Switch
            local teleportCFrame = CFrame.new(switchPosition + Vector3.new(0, 5, 0)) -- Пример: поднимаем игрока на 5 единиц вверх

            -- Телепортируем игрока к объекту Switch
            player.Character:SetPrimaryPartCFrame(teleportCFrame)
        else
            Fluent:Notify({
                Title = "Notification",
                Content = "Switch not found \nПереключатель не найден",
                Duration = 10 -- Set to nil to make the notification not disappear
            })
            print("Switch не найден")
        end
    end
	})
local speed = 0
local isTapping = false

local function TapInDirection(player)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then
            -- Если объект "Humanoid" отсутствует, попробуйте создать его заново
            humanoid = Instance.new("Humanoid")
            humanoid.Parent = character
        end
        
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then
            -- Если объект "HumanoidRootPart" отсутствует, попробуйте создать его заново
            rootPart = Instance.new("Part")
            rootPart.Name = "HumanoidRootPart"
            rootPart.Anchored = true
            rootPart.Size = Vector3.new(2, 2, 2) -- Размер можно настроить под вашу игру
            rootPart.Parent = character
        end

        local moveDirection = humanoid.MoveDirection
        if moveDirection.Magnitude > 0 then
            local newPosition = rootPart.Position + moveDirection * speed
            rootPart.CFrame = CFrame.new(newPosition)
        end
    end
end

local Toggle = Tabs.Spawka:AddToggle("MyToggle", {Title = "Speed", Default = false })

Toggle:OnChanged(function()
    isTapping = Toggle.Value
    if not isTapping then
        speed = 0
    end
end)

local Slider = Tabs.Spawka:AddSlider("Slider", {
    Title = "speed setting",
    --Description = "This is a slider",
    Default = 2,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        speed = Value
    end
})

Slider:OnChanged(function(Value)
    speed = Value
end)

game:GetService("RunService").Stepped:Connect(function(_, deltaTime)
    if isTapping then
        TapInDirection(game.Players.LocalPlayer)
    end
end)




-- VISUAL




-- chams
local originalColor = Color3.new(1, 1, 1) -- Значение цвета по умолчанию (белый)
local originalTransparency = 0 -- Значение прозрачности по умолчанию (0)
local originalMaterial = Enum.Material.SmoothPlastic -- Значение материала по умолчанию

local function ChangePlayerAppearance(player, color, transparency, material)
    local character = player.Character or player.CharacterAdded:Wait()

    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.BrickColor = BrickColor.new(color)
            part.Transparency = transparency
            part.Material = material
        end
    end
end

local TColorpicker = Tabs.Visual:AddColorpicker("TransparencyColorpicker", {
    Title = "Color of champs",
    --Description = "but you can change the transparency.",
    Transparency = 0,
    Default = Color3.fromRGB(96, 205, 255)
})

local Toggle = Tabs.Visual:AddToggle("MyToggle", {Title = "chams", Default = false})

Toggle:OnChanged(function(newValue)
    if not newValue then
        ChangePlayerAppearance(game.Players.LocalPlayer, originalColor, originalTransparency, originalMaterial) -- Восстанавливаем оригинальный вид при выключении Toggle
    else
        if originalColor == nil then
            originalColor = TColorpicker.Value
            originalTransparency = TColorpicker.Transparency
            originalMaterial = Enum.Material.ForceField -- Устанавливаем материал "ForceField" при включении Toggle
        end
        local selectedColor = TColorpicker.Value
        local transparency = TColorpicker.Transparency
        local material = Enum.Material.ForceField
        ChangePlayerAppearance(game.Players.LocalPlayer, selectedColor, transparency, material)
    end
end)

TColorpicker:OnChanged(function()
    if Toggle.Value then
        local selectedColor = TColorpicker.Value
        local transparency = TColorpicker.Transparency
        if originalColor == nil then
            originalColor = selectedColor
            originalTransparency = transparency
            originalMaterial = Enum.Material.ForceField
        end
        local material = Enum.Material.ForceField
        ChangePlayerAppearance(game.Players.LocalPlayer, selectedColor, transparency, material)
    end
end)

TColorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

--esp
local c = workspace.CurrentCamera
local ps = game:GetService("Players")
local lp = ps.LocalPlayer
local rs = game:GetService("RunService")

local Toggle = Tabs.Visual:AddToggle("ShowPlayerBoxes", { Title = "Show Player Boxes", Default = false }) -- Добавляем Toggle

local playerBoxes = {} -- Создаем таблицу для хранения объектов боксов

local function createBox(player)
    local cr = player.Character

    if cr and not playerBoxes[player] then
        local box = {}
        box.lines = {}

        for i = 1, 4 do
            local line = Drawing.new("Line")
            line.Visible = false
            line.Color = Color3.new(1, 1, 1)
            line.Thickness = 2
            line.Transparency = 1
            line.ZIndex = 1
            box.lines[i] = line
        end

        local function updateBox()
            local h = cr:WaitForChild("Humanoid")
            local hrp = cr:WaitForChild("HumanoidRootPart")

            local hrpPos, hrpOnScreen = c:WorldToViewportPoint(hrp.Position)

            if hrpOnScreen and Toggle.Value then
                for i = 1, 4 do
                    box.lines[i].Visible = true
                end

                local headPos, _ = c:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2, 0))
                local feetPos, _ = c:WorldToViewportPoint(hrp.Position - Vector3.new(0, 2, 0))
                local leftPos, _ = c:WorldToViewportPoint(hrp.Position - Vector3.new(2, 2, 0))
                local rightPos, _ = c:WorldToViewportPoint(hrp.Position + Vector3.new(2, 2, 0))

                box.lines[1].From = Vector2.new(leftPos.X, headPos.Y)
                box.lines[1].To = Vector2.new(leftPos.X, feetPos.Y)

                box.lines[2].From = Vector2.new(leftPos.X, feetPos.Y)
                box.lines[2].To = Vector2.new(rightPos.X, feetPos.Y)

                box.lines[3].From = Vector2.new(rightPos.X, feetPos.Y)
                box.lines[3].To = Vector2.new(rightPos.X, headPos.Y)

                box.lines[4].From = Vector2.new(rightPos.X, headPos.Y)
                box.lines[4].To = Vector2.new(leftPos.X, headPos.Y)
            else
                for i = 1, 4 do
                    box.lines[i].Visible = false
                end
            end
        end

        box.character = cr

        box.ancestryChangedConn = cr.AncestryChanged:Connect(function(_, parent)
            if not parent then
                for i = 1, 4 do
                    box.lines[i].Visible = false
                    box.lines[i]:Remove()
                end
                playerBoxes[player] = nil
            end
        end)

        box.healthChangedConn = cr:WaitForChild("Humanoid").HealthChanged:Connect(function(_, value)
            if value <= 0 or cr:WaitForChild("Humanoid").Health <= 0 then
                for i = 1, 4 do
                    box.lines[i].Visible = false
                    box.lines[i]:Remove()
                end
                playerBoxes[player] = nil
            end
        end)

        playerBoxes[player] = box
        rs.RenderStepped:Connect(function()
            updateBox() -- Обновляем позицию бокса на каждом кадре
        end)
    end
end

local function onPlayerAdded(player)
    if player ~= lp then
        createBox(player)
    end

    player.CharacterAdded:Connect(function(character)
        createBox(player)
    end)
end

local function onPlayerRemoved(player)
    if playerBoxes[player] then
        for i = 1, 4 do
            playerBoxes[player].lines[i].Visible = false
            playerBoxes[player].lines[i]:Remove()
        end
        playerBoxes[player] = nil
    end
end

for _, player in ipairs(ps:GetPlayers()) do
    onPlayerAdded(player)
end

ps.PlayerAdded:Connect(onPlayerAdded)
ps.PlayerRemoving:Connect(onPlayerRemoved)

Toggle:OnChanged(function(newValue)
    for player, box in pairs(playerBoxes) do
        if box then
            for i = 1, 4 do
                box.lines[i].Visible = newValue
            end
        end
    end
end)
--esp name
local ToggleNames = Tabs.Visual:AddToggle("ShowPlayerNames", { Title = "Show Player Names", Default = false }) -- Создаем Toggle для имен игроков

local function esp(p, cr)
    local h = cr:WaitForChild("Humanoid")
    local hrp = cr:WaitForChild("HumanoidRootPart")

    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Font = 2
    text.Color = Color3.fromRGB(255, 255, 255)
    text.Size = 13

    local c1
    local c2
    local c3

    local function dc()
        text.Visible = false
        text:Remove()
        if c1 then
            c1:Disconnect()
            c1 = nil
        end
        if c2 then
            c2:Disconnect()
            c2 = nil
        end
        if c3 then
            c3:Disconnect()
            c3 = nil
        end
    end

    c2 = cr.AncestryChanged:Connect(function(_, parent)
        if not parent then
            dc()
        end
    end)

    c3 = h.HealthChanged:Connect(function(v)
        if (v <= 0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
            dc()
        end
    end)

    c1 = rs.RenderStepped:Connect(function()
        local hrp_pos, hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
        if hrp_onscreen and ToggleNames.Value then
            local headPos, _ = c:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2, 0))
            text.Position = Vector2.new(hrp_pos.X, headPos.Y - 11)
            text.Text = p.Name
            text.Visible = true
        else
            text.Visible = false
        end
    end)
end

local function p_added(p)
    if p.Character then
        esp(p, p.Character)
    end
    p.CharacterAdded:Connect(function(cr)
        esp(p, cr)
    end)
end

for _, p in ipairs(ps:GetPlayers()) do
    if p ~= lp then
        p_added(p)
    end
end

ps.PlayerAdded:Connect(p_added)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("SPAWKA")
SaveManager:SetFolder("SPAWKA/game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)
-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()