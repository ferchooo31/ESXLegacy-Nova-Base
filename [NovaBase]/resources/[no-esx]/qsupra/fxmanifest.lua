fx_version "bodacious"
games { "gta5" }

files {
    "vehicles.meta",
    "carvariations.meta",
    "handling.meta"
}
 
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
 
client_script 'vehicle_names.lua'