local QBCore = exports['qb-core']:GetCoreObject()

-- Tezgahlar için qb-target oluşturma
Citizen.CreateThread(function()
    for _, table in pairs(Config.TechnicalTables) do
        exports['qb-target']:AddBoxZone(table.name, table.location, 1.0, 1.0, {
            name = table.name,
            heading = 0,
            debugPoly = false,
            minZ = table.location.z - 1.0,
            maxZ = table.location.z + 1.0
        }, {
            options = {
                {
                    type = "client",
                    event = "tezgah:openMenu",  -- Tezgah menüsünü açar
                    icon = "fas fa-utensils",
                    label = "Tezgahı Kullan",
                    canInteract = function()
                        local playerJob = QBCore.Functions.GetPlayerData().job.name
                        if table.allowedJob and table.allowedJob ~= playerJob then
                            return false -- Job uygun değilse açılmasın
                        end
                        return true
                    end
                }
            },
            distance = 2.0
        })
    end
end)

-- Tezgah menüsünü açma (Hem OX Hem QB Uyumluluk)
RegisterNetEvent('tezgah:openMenu', function()
    if Config.InventoryType == "ox" then
        TriggerEvent('ox_inventory:openInventory') -- Ox Inventory aç
    elseif Config.InventoryType == "qb" then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "tezgah_stash") -- QB Inventory aç
        TriggerEvent("inventory:client:SetCurrentStash", "tezgah_stash")
    else
        TriggerEvent('QBCore:Notify', 'Geçersiz envanter sistemi ayarlandı!', 'error')
    end
end)
