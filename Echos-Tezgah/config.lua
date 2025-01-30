Config = {}

-- Kullanılacak envanter sistemini seç: "ox" veya "qb"
Config.InventoryType = "ox" -- Eğer QB-Inventory kullanmak istiyorsan "qb" olarak değiştir

-- Tezgah Konumları, İsimleri ve İzinli Job'lar (Eğer herkes kullanabilsin istiyorsan allowedJob = nil bırak)
Config.TechnicalTables = {
    {name = "Tezgah 1", location = vector3(184.62, -295.64, 45.42), allowedJob = nil}, 
}
