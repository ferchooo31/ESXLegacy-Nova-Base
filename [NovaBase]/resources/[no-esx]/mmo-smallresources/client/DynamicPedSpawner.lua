function spawnPeds()
    local hour = GetClockHours()
    local weather = GetPrevWeatherTypeHashName()

    local timeModifier = 1.0
    if hour >= 20 or hour < 6 then -- night time
        timeModifier = 0.5
    end

    local weatherModifier = 1.0
    if weather == "RAIN" or weather == "THUNDER" then
        weatherModifier = 0.75
    end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)

    local peds = {}
    for i, location in ipairs(Config.dspawnLocations) do
        local distance = #(vector3(location.x, location.y, location.z) - playerPos)
        if distance < Config.dspawnRadius then
            local numPeds = math.floor(
                (math.random() * Config.GeneratorsDensity.peds * timeModifier * weatherModifier) + 1)
            for j = 1, numPeds do
                local pedType = GetRandomPed()
                local ped = CreatePed(pedType, location.x, location.y, location.z, 0.0, true, false)
                SetPedMaxHealth(ped, 200)
                SetPedCanRagdollFromPlayerImpact(ped, false)
                SetPedDiesWhenInjured(ped, false)
                SetEntityAsMissionEntity(ped, true, true)
                SetPedRelationshipGroupHash(ped, GetHashKey("CIVMALE"))
                table.insert(peds, ped)
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if Config.DynamicPedSpawner then
            spawnPeds()
        end
    end
end)
