local SetEntityCoords = SetEntityCoords
local SetEntityHeading = SetEntityHeading
local SetCurrentPedWeapon = SetCurrentPedWeapon
local CreateObject = CreateObject
local AttachEntityToEntity = AttachEntityToEntity
local GetPedBoneIndex = GetPedBoneIndex
local Wait = Wait
local TaskPlayAnim = TaskPlayAnim
local DeleteEntity = DeleteEntity
local SetEntityRotation = SetEntityRotation
local ClearPedTasks = ClearPedTasks
local IsEntityPlayingAnim = IsEntityPlayingAnim
local TriggerServerEvent = TriggerServerEvent

local function giveEquipment(equipmentBundle, data)
    local playerPed = cache.ped
    local policePed = data.entity
    local animDict = lib.requestAnimDict("mp_cop_armoury")

    SetEntityCoords(playerPed, data.playerPos.x, data.playerPos.y, data.playerPos.z)
    SetEntityHeading(playerPed, data.playerPos.w)
    SetCurrentPedWeapon(playerPed, joaat("weapon_unarmed"), true)

    for _, equipmentItem in ipairs(equipmentBundle) do
        local playerItem = exports.ox_inventory:Search("count", equipmentItem.item) or 0

        if type(playerItem) == "table" then
            playerItem = playerItem[string.upper(equipmentItem.item)]
        end

        if data.require_storage then
            local storageItem = lib.callback.await("ars_policejob:getItemCount", false, data.storage.stashId, equipmentItem.item)
            if type(storageItem) == "table" then
                storageItem = storageItem[string.upper(equipmentItem.item)]
            end

            if storageItem and storageItem >= 1 then
                if playerItem < equipmentItem.quantity then
                    local itemToGive = storageItem > equipmentItem.quantity and equipmentItem.quantity or storageItem
                    utils.debug("Getting item" .. equipmentItem.item .. " quantity: " .. itemToGive - playerItem)

                    TaskPlayAnim(policePed, animDict, "pistol_on_counter_cop", 1.0, -1, 1.0, 0, 0, 0, 0, 0)
                    Wait(1100)

                    local itemModel = lib.requestModel(equipmentItem.prop.model)
                    local playerCoords = cache.coords
                    local object = CreateObject(itemModel, playerCoords.x, playerCoords.y, playerCoords.z + 1, true, true, true)

                    AttachEntityToEntity(object, policePed, GetPedBoneIndex(policePed, 57005), 0, 0, -0, 0, 0, 0, true, true, false, true, 1, true)
                    TaskPlayAnim(playerPed, animDict, "pistol_on_counter", 1.0, -1, 1.0, 0, 0, 0, 0, 0)

                    Wait(2000)

                    DeleteEntity(object)
                    local placedObject = CreateObject(itemModel, equipmentItem.prop.placePos, true, true, true)

                    SetEntityRotation(placedObject, 90.0, 0.0, -90.0, 2, true)
                    Wait(2000)
                    AttachEntityToEntity(placedObject, playerPed, GetPedBoneIndex(playerPed, 57005), 0, 0, -0, -0, 0, -0, true, true, false, true, 1, true)

                    while IsEntityPlayingAnim(playerPed, animDict, "pistol_on_counter", 3) do
                        Wait(0)
                    end

                    ClearPedTasks(policePed)
                    TriggerServerEvent("ars_policejob:giveItemToPlayer", data.storage.stashId, equipmentItem.item, equipmentItem.quantity - playerItem, true, data.jobs)
                    DeleteEntity(placedObject)
                else
                    utils.showNotification(locale("already_have_item", equipmentItem.label))
                end
            else
                utils.showNotification(equipmentItem.label .. " " .. locale("no_item_in_storage"))
            end
        else
            if playerItem < equipmentItem.quantity then
                utils.debug("Getting item" .. equipmentItem.item .. " quantity: " .. equipmentItem.quantity - playerItem)

                TaskPlayAnim(policePed, animDict, "pistol_on_counter_cop", 1.0, -1, 1.0, 0, 0, 0, 0, 0)
                Wait(1100)

                local itemModel = lib.requestModel(equipmentItem.prop.model)
                local playerCoords = cache.coords
                local object = CreateObject(itemModel, playerCoords.x, playerCoords.y, playerCoords.z + 1, true, true, true)

                AttachEntityToEntity(object, policePed, GetPedBoneIndex(policePed, 57005), 0, 0, -0, 0, 0, 0, true, true, false, true, 1, true)
                TaskPlayAnim(playerPed, animDict, "pistol_on_counter", 1.0, -1, 1.0, 0, 0, 0, 0, 0)

                Wait(2000)

                DeleteEntity(object)
                local placedObject = CreateObject(itemModel, equipmentItem.prop.placePos, true, true, true)

                SetEntityRotation(placedObject, 90.0, 0.0, -90.0, 2, true)
                Wait(2000)
                AttachEntityToEntity(placedObject, playerPed, GetPedBoneIndex(playerPed, 57005), 0, 0, -0, -0, 0, -0, true, true, false, true, 1, true)

                while IsEntityPlayingAnim(playerPed, animDict, "pistol_on_counter", 3) do
                    Wait(0)
                end

                ClearPedTasks(policePed)
                TriggerServerEvent("ars_policejob:giveItemToPlayer", nil, equipmentItem.item, equipmentItem.quantity - playerItem, true, data.jobs)
                DeleteEntity(placedObject)
            else
                utils.showNotification(equipmentItem.label .. " " .. locale("already_have_item"))
            end
        end
    end
end

local function getEquipment(data)
    utils.debug("Getting equipment")
    local jobGrade = getPlayerJobGrade()
    local equipmentOptions = {}

    for grade = 0, #data.equipment do
        if grade <= jobGrade then
            local equipmentBundle = data.equipment[grade]
            local equipmentName = equipmentBundle.name
            local equipmentIcon = equipmentBundle.icon
            local equipmentItems = {}
            for _, item in ipairs(equipmentBundle) do
                table.insert(equipmentItems, item.label .. " (" .. tostring(item.quantity) .. "x)")
            end
            table.insert(equipmentOptions, {
                title = equipmentName,
                description = table.concat(equipmentItems, ", "),
                icon = equipmentIcon,
                onSelect = function()
                    giveEquipment(equipmentBundle, data)
                end,
            })
        end
    end

    if #equipmentOptions > 0 then
        lib.registerContext({
            id = "select_equipment_bundle",
            title = locale("armory_interact_label"),
            options = equipmentOptions,
        })
        lib.showContext("select_equipment_bundle")
    else
        utils.showNotification(locale("no_equipment"))
    end
end

function initArmory(data)
    local ped = utils.createPed(data.model, data.pedPos)
    local options = {
        {
            name = "armory" .. ped,
            label = locale("armory_interact_label"),
            icon = "fa-solid fa-boxes-stacked",
            groups = data.jobs,
            canInteract = function(entity, distance, coords, name, bone)
                if IsEntityPlayingAnim(entity, "mp_cop_armoury", "pistol_on_counter_cop", 3) or IsEntityPlayingAnim(entity, "mp_cop_armoury", "rifle_on_counter_cop", 3) then
                    return false
                end

                return player.inDuty()
            end,
            onSelect = function(entity)
                data.entity = entity.entity
                getEquipment(data)
            end,
        },
        {
            name = "armory_storage" .. ped,
            label = locale("armory_interact_storage_label"),
            icon = "fa-solid fa-boxes-stacked",
            canInteract = function(entity, distance, coords, name, bone)
                return data.require_storage and hasJob(data.jobs) and getPlayerJobGrade() >= data.storage.minGradeAccess and player.inDuty()
            end,
            onSelect = function(entity)
                exports.ox_inventory:openInventory("stash", data.storage.stashId)
            end,
        },
    }
    exports.ox_target:addLocalEntity(ped, options)
end
