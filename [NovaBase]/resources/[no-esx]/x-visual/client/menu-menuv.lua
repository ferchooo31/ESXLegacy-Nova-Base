if Config.Menu == "menuv" then
    if MenuV then
        Config.mainMenu = MenuV:CreateMenu("VISUAL", "Menu Principal", "centerright", 31, 255, 34, "size-150", "default", "menuv", "x-visual_main_menu", "default")
        Config.fpsMenu = MenuV:CreateMenu("VISUAL", "Boost de FPS", "centerright", 31, 255, 34, "size-150", "default", "menuv", "x-visual_fps_menu", "default")
        Config.visualMenu = MenuV:CreateMenu("VISUAL", "Visual Modifier Menu", "centerright", 31, 255, 34, "size-150", "default", "menuv", "x-visual_visual_menu", "default")
        Config.lightsMenu = MenuV:CreateMenu("VISUAL", "Vehicle Lights Menu", "centerright", 31, 255, 34, "size-150", "default", "menuv", "x-visual_light_menu", "default")
        Config.dayLightsMenu = MenuV:CreateMenu("VISUAL", "Vehicle Lights Menu (DÍA)", "centerright", 31, 255, 34, "size-150", "default", "menuv", "x-visual_day_light_menu", "default")
        Config.nightLightsMenu = MenuV:CreateMenu("VISUAL", "Vehicle Lights Menu (NOCHE)", "centerright", 31, 255, 34, "size-150", "default", "menuv", "x-visual_night_light_menu", "default")

        -- FPS Booster Menu
        Config.mainMenu:AddButton({ icon = "🆙", label = "Menu de FPS", value = Config.fpsMenu })
        local function setUpFpsBoosterButtons(menuToSet)
            for index = 1, #Config.fpsBoosterTypes do
                menuToSet:AddButton({ icon = Config.fpsBoosterTypes[index].icon or "❇", label = Config.fpsBoosterTypes[index].name, description = Config.fpsBoosterTypes[index].description, value = "", select = function()
                    BoostFPS(index)
                end })
            end
            menuToSet:AddButton({ icon = "🔁", label = "Reiniciar", value = "", select = function()
                BoostFPS()
            end })
        end
        do setUpFpsBoosterButtons(Config.fpsMenu) end

        -- Visual Modifier Menu
        Config.mainMenu:AddButton({ icon = "👓", label = "Modificador Visual (Menu)", value = Config.visualMenu })
        local function setUpVisualTimecycleMenuButtons(menuToSet)
            for index = 1, #Config.visualTimecycles do
                menuToSet:AddButton({ icon = Config.visualTimecycles[index].icon or "❇", label = Config.visualTimecycles[index].name, value = "", select = function()
                    ModifyVisuals(index)
                end })
            end
            menuToSet:AddButton({ icon = "🔁", label = "Reiniciar", value = "", select = function()
                ModifyVisuals()
            end })
        end
        do setUpVisualTimecycleMenuButtons(Config.visualMenu) end
        
        -- Vehicle Lights Menu
        Config.mainMenu:AddButton({ icon = "💡", label = "Luces de Vehículos", value = Config.lightsMenu })
        Config.lightsMenu:On("open", function(menu)
            menu:ClearItems()
            Config.multiplier = 1
            Config.lightsMenu:AddButton({ icon = "💡", label = "Luces del vehículo (DÍA)", value = Config.dayLightsMenu })
            Config.lightsMenu:AddButton({ icon = "💡", label = "Luces del vehículo (NOCHE)", value = Config.nightLightsMenu })
            Config.multiplierSlider = Config.lightsMenu:AddSlider({ icon = "Ⓜ", label = "Multiplicador", value = Config.multiplier, values = {
                { label = "1x", value = 1 },
                { label = "10x", value = 10 },
                { label = "100x", value = 100 },
                { label = "1000x", value = 1000 }
            }})
            Config.multiplierSlider:On("change", function(item, newValue, _) Config.multiplier = item.Values[newValue].Value end)
            Config.lightsMenu:AddButton({ icon = "💾", label = "Aplicar configuración guardada", value = "", select = function()
                ApplySavedLightConfigurations()
            end })
            Config.lightsMenu:AddButton({ icon = "💾", label = "Guardar Configuraciones", value = "", select = function()
                SaveLightConfigurations()
            end })
        end)
        local function setUpLightMenuButtons(menuToSet, timeToSet)
            for name, v in pairs(Config.vehicleLightsSetting) do
                for time, light in pairs(v) do
                    if time == timeToSet then
                        light.handler = menuToSet:AddRange({ icon = "💡", label = light.name, min = light.min, max = light.max / Config.multiplier, value = (light.modifiedValue or light.defaultValue) / Config.multiplier, saveOnUpdate = false })
                        light.handler:On("change", function(_, newValue, _)
                            light.modifiedValue = newValue * Config.multiplier
                            SetVisualSettingFloat(("car.%s.%s.emissive.on"):format(name, time), light.modifiedValue + 0.0)
                        end)
                    end
                end
            end
        end
        Config.dayLightsMenu:On("open", function(menu)
            menu:ClearItems()
            setUpLightMenuButtons(Config.dayLightsMenu, "day")
        end)
        Config.nightLightsMenu:On("open", function(menu)
            menu:ClearItems()
            setUpLightMenuButtons(Config.nightLightsMenu, "night")
        end)
    else
        error("Error: MenuV resource is not properly loaded inside x-visual!")
    end
end