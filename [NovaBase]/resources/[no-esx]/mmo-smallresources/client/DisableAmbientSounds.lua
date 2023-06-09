if Config.DisableAmbientSounds then
    Citizen.CreateThread(function()
        SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Disabled_Zones", false, true)
        SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Zones", true, true)
        SetAudioFlag("DisableFlightMusic", true)
        SetAudioFlag("PoliceScannerDisabled", true)
        SetDeepOceanScaler(0.0)
        SetRandomEventFlag(false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_BIKE_OFF_ROAD_RACE", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_BUSINESSMEN", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_EMPTY", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_MECHANIC", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_MILITARY_PLANES_BIG", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_MILITARY_PLANES_SMALL", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_BIKE", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_CAR", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_NEXT_TO_CAR", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_SALTON_DIRT_BIKE", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_SALTON", false)
        SetScenarioTypeEnabled("WORLD_VEHICLE_STREETRACE", false)
        SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_01_STAGE", false)
        SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM", false)
        SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM", false)
        SetStaticEmitterEnabled("se_dlc_aw_arena_construction_01", false)
        SetStaticEmitterEnabled("se_dlc_aw_arena_crowd_background_main", false)
        SetStaticEmitterEnabled("se_dlc_aw_arena_crowd_exterior_lobby", false)
        SetStaticEmitterEnabled("se_dlc_aw_arena_crowd_interior_lobby", false)
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
        StartAudioScene("DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE")
        StartAudioScene("FBI_HEIST_H5_MUTE_AMBIENCE_SCENE")
    end)
end
