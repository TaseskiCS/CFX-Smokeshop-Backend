local QBCore = exports['qb-core']:GetCoreObject()

--CIGARATTE ###########################################################################################################################################################################################################################


CreateThread(function()
    Wait(5)

    local zone = BoxZone:Create(vector3(-90.8, 3692.83, 36.99), 10, 10, {
        name="test4cigarfield",
        heading=295,
        debugPoly=true,
        minZ=36.19,
        maxZ=40.19
      })

    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            QBCore.Functions.Notify('Cigarette Picking Field', 'primary', 7500)
        end
    end)
end)


RegisterNetEvent('tc-cigarjob-pickCigaratte', function()
    local src = source
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            TaskStartScenarioInPlace(ped, 'world_human_gardener_plant', 0, false)                                                                                 
            QBCore.Functions.Progressbar('pick_cigaretteleaf', 'Picking Cigarette Leaf', 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() 

                local rareChance = math.random(1,10) --10% chance

                if rareChance == 1 then
                    TriggerServerEvent("QBCore:Server:AddItem", "hightobaccoleaf", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hightobaccoleaf"], "add")
                    QBCore.Functions.Notify('Found Very Rare Type Of Tobacco Leaf, Find A Manager And Give It To Them!', 'success', 7500)
                else
                    TriggerServerEvent("QBCore:Server:AddItem", "lowtobaccoleaf", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lowtobaccoleaf"], "add")
                end

                ClearPedTasks(ped)
            end, function() 
                ClearPedTasks(ped)
            end)
        else
            QBCore.Functions.Notify('You are missing something', 'error', 7500)
        end
    end, Config.RequiredPickingItems)
end)


RegisterNetEvent('tc-cigarjob-dryleaf', function()
    TriggerServerEvent('tc-cigarjob-sv-dryleaf')
end)

RegisterNetEvent('tc-cigarjob-pickupDriedLeaf', function()
    TriggerServerEvent('tc-cigarjob-sv-pickupDriedLeaf')
end)

RegisterCommand('removeit', function()
    TriggerEvent('tc-cigarjob-driedleaf')
end)

RegisterNetEvent('tc-cigarjob-dryleafComplete', function()
    exports["qb-target"]:AddBoxZone("dryleafcomplete", vector3(-21.82, 3708.33, 38.58), 3, 3, {
        name ="dryleafcomplete",
        heading = 0,
        debugPoly=true,
        minZ=35.38,
        maxZ=39.38,
        }, {
            options = {
                {
                    event = "tc-cigarjob-pickupDriedLeaf",
                    icon = "fas fa-circle",
                    label = "Pick Up Dry Leaf",
                    job = 'cigarjob'
                },
             },
            distance = 3.1
        })
end)

RegisterNetEvent('tc-cigarjob-grindleaf', function()
    TriggerServerEvent('tc-cigarjob-sv-grindleaf')
end)

RegisterNetEvent('tc-cigarjob-rollCigarette', function()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar('roll_cigarette', 'Rolling Cigarette', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'anim@gangops@facility@servers@',
                anim = 'hotwire',
                flags = 16,
            }, {}, {}, function() 
                TriggerServerEvent('tc-cigarjob-sv-rollCigarette')
                ClearPedTasks(ped)
            end, function() 
                ClearPedTasks(ped)
            end)
        else
            QBCore.Functions.Notify('Cant Roll Need Both Rolling Paper and Shredded Tobacco', 'error', 7500)
        end
    end, Config.RequiredCigaretteRollingItems)

end)

RegisterNetEvent('tc-cigarjob-grindedleaf', function()
    TriggerServerEvent('tc-cigarjob-sv-grindedLeaf')   
end)


--CIGAR ###########################################################################################################################################################################################################################
RegisterNetEvent('tc-cigarjob-pickCigar', function()
    local src = source
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('tc-cigarjob-sv-cigarGrade', function(grade1)
        if grade1 then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
                if hasItem then                    
                    TaskStartScenarioInPlace(ped, 'world_human_gardener_plant', 0, false)                                                             
                    QBCore.Functions.Progressbar('pick_cigarleaf', 'Picking Cigar Leaf', 15000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() 
                        print('picked cigar')
        
                        local chance = math.random(1,4) --25% chance
        
                        if chance == 1 then
                            TriggerServerEvent("QBCore:Server:AddItem", "hightobaccoleaf", 1)
                            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hightobaccoleaf"], "add")
                            QBCore.Functions.Notify('Found Very Rare Type Of Tobacco Leaf, Find A Manager And Give It To Them!', 'success', 15000)
                        else
                            TriggerServerEvent("QBCore:Server:AddItem", "midtobaccoleaf", 1)
                            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["midtobaccoleaf"], "add")
                        end


                        
                        ClearPedTasks(ped)
                    end, function() 
                        ClearPedTasks(ped)
                    end)
                else
                    QBCore.Functions.Notify('You are missing something', 'error', 7500)
                end
            end, Config.RequiredPickingItems)
        else
            QBCore.Functions.Notify('Not Supposed To Pick Cigar Leaves', 'error', 7500)
        end
    end)
end)


RegisterNetEvent('tc-cigarjob-dryCigar', function(amountLeaf)
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('tc-cigarjob-sv-cigarGrade', function(grade1)
        if grade1 then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
                if hasItem then
                    TaskStartScenarioInPlace(ped, 'world_human_gardener_leaf_blower', 0, false)
                    QBCore.Functions.Progressbar('dry_cigar', 'Drying Tobacco Leaf', math.random(3000,5000), false, true, { -- Name | Label | Time | useWhileDead | canCancel
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        TriggerServerEvent('tc-cigarjob-sv-driedCigar')
                        ClearPedTasks(ped)
                        QBCore.Functions.Notify('Trim The Tobacco Leaf To A Good Size To Roll', 'success', 7500)
                    end, function()
                        ClearPedTasks(ped)
                    end)
                else
                    QBCore.Functions.Notify('Need A Tobacco Leaf To Dry A Tobacoo Leaf Duhhh', 'error', 7500)
                end
            end, 'midtobaccoleaf')
        else
            QBCore.Functions.Notify('Uneligible to dry', 'error', 7500)
        end
    end)
end)


RegisterNetEvent('tc-cigarjob-trimGrabba', function()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('tc-cigarjob-sv-cigarGrade', function(grade1)
        if grade1 then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
                if hasItem then
                    QBCore.Functions.Progressbar('trimming_grabba', 'Trimming Tobacco Leaf', 2000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = 'melee@knife@streamed_core',
                        anim = 'knife_long_range_0',
                        flags = 16,
                    }, {}, {}, function() 
                        TriggerServerEvent('tc-cigarjob-sv-trimGrabba')
                        ClearPedTasks(ped)
                    end, function() 
                        ClearPedTasks(ped)
                    end)
                else
                    QBCore.Functions.Notify('Missing Items, Need: Sharp Object, Dry Leaf', 'error', 7500)
                end
            end, Config.RequiredTrimmingItems)
        else
            QBCore.Functions.Notify('Uneligible To Trim', 'error', 7500)
        end
    end)
end)

RegisterNetEvent('tc-cigarjob-rollCigar', function()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('tc-cigarjob-sv-cigarGrade', function(grade1)
        if grade1 then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
                if hasItem then
                    QBCore.Functions.Progressbar('roll_cigar', 'Rolling Cigar', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = 'creatures@rottweiler@tricks@',
                        anim = 'petting_franklin',
                        flags = 16,
                    }, {}, {}, function() 
                        TriggerServerEvent('tc-cigarjob-sv-rollCigar')
                        ClearPedTasks(ped)
                    end, function() -- Play When Cancel
                        ClearPedTasks(ped)
                    end)
                    
                else
                    QBCore.Functions.Notify("Can't Roll Need Both Trimmed and Shredded Tobacco", 'error', 7500)
                end
            end, Config.RequiredCigarRollingItems)
        else
            QBCore.Functions.Notify('Uneligible To Roll', 'error', 7500)
        end
    end)

end)


--PREMIUM CIGAR ###########################################################################################################################################################################################################################

RegisterNetEvent('tc-cigarjob-dryPremium', function()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('tc-cigarjob-sv-cigarGrade', function(grade3)
        if grade3 then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
                if hasItem then
                    TaskStartScenarioInPlace(ped, 'world_human_gardener_leaf_blower', 0, false)
                    QBCore.Functions.Progressbar('dry_prem', 'Drying Premium Leaf', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() 
                        TriggerServerEvent('tc-cigarjob-sv-dryPremium')
                        ClearPedTasks(ped)
                    end, function() 
                        ClearPedTasks(ped)
                    end)
                else
                    QBCore.Functions.Notify('Need Leaf To Dry', 'error', 7500)
                end
            end, 'hightobaccoleaf')
        end
    end)

end)


RegisterNetEvent('tc-cigarjob-trimPremium', function()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('tc-cigarjob-sv-cigarGrade', function(grade3)
        if grade3 then
            local time = math.random(7,10)
            local circles = math.random(2,4)
            local success = exports['qb-lock']:StartLockPickCircle(circles, time, success)
            if success then
                QBCore.Functions.Progressbar('trim_leaf', 'Preparing To Trim Leaf', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                    animDict = 'anim@gangops@facility@servers@',
                    anim = 'hotwire',
                    flags = 16,
                }, {}, {}, function() 
                    TriggerServerEvent('tc-cigarjob-sv-trimPremium')
                    ClearPedTasks(ped)
                end, function() 
                    ClearPedTasks(ped)
                end)
            end
        end
    end)
end)


RegisterNetEvent('tc-cigarjob-packPremium', function()
    local ped = PlayerPedId()

    QBCore.Functions.TriggerCallback('tc-cigarjob-sv-cigarGrade', function(grade3)
        if grade3 then
            QBCore.Functions.Progressbar('pack_prem', 'Preparing Backwoods Package', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'anim@gangops@facility@servers@',
                anim = 'hotwire',
                flags = 16,
            }, {}, {}, function() 
                TriggerServerEvent('tc-cigarjob-sv-packPremium')
                ClearPedTasks(ped)
            end, function() 
                ClearPedTasks(ped)
            end)   
        end
    end)
end)


    
    
 




RegisterNetEvent('tc-cigarshop-cigaratteOptions', function()
    local cigaretteOptions = {
        {
            header = '💦🍂 Dry Leaf 🍂💦',
            params = {
                event = 'tc-cigarjob-dryleaf'
            }
        },
        {
            header = '💨🍂 Pickup Dried Leaf 🍂💨',
            params = {
                event = 'tc-cigarjob-pickupDriedLeaf'
            }
        },
        {
            header = '❌ Close',

        }
    }
    exports['qb-menu']:openMenu(cigaretteOptions)
end)

RegisterNetEvent('tc-cigarshop-cigarOptions', function()
    local cigarOptions = {
        {
            header = '💦🍂 Dry Leaf 🍂💦',
            params = {
                event = 'tc-cigarjob-dryCigar'
            }
        },
        {
            header = '✂️🍂 Trim Leaf 🍂✂️',
            params = {
                event = 'tc-cigarjob-trimGrabba'
            }
        },
        {
            header = '❌ Close',

        }
    }
    exports['qb-menu']:openMenu(cigarOptions)
end)


-- RegisterNetEvent('tc-cigarshop-premOptions', function()
--     local premOptions = {
--         {
--             header = '💦🍂 Dry Leaf 🍂💦',
--             params = {
--                 event = 'tc-cigarjob-dryCigar'
--             }
--         },
--         {
--             header = '✂️🍂 Trim Leaf 🍂✂️',
--             params = {
--                 event = 'tc-cigarjob-trimGrabba'
--             }
--         },
--         {
--             header = '❌ Close',

--         }
--     }
--     exports['qb-menu']:openMenu(premOptions)
-- end)

CreateThread(function()
    exports["qb-target"]:AddBoxZone("test4cigar", vector3(-25.71, 3704.81, 38.36), 3.0, 1, {
        name ="test4cigar",
        heading = 308,
        debugPoly=true,
        minZ = 34.96,
        maxZ = 38.96,
        }, {
            options = {
                {
                    event = "tc-cigarjob-pickCigaratte",
                    icon = "fas fa-circle",
                    label = "Pick Leaf",
                    job = 'cigarjob'
                },
             },
            distance = 3.1
        })

        exports["qb-target"]:AddBoxZone("dryleaf", vector3(-21.82, 3708.33, 38.58), 3, 3, {
            name ="dryleaf",
            heading = 0,
            debugPoly=true,
            minZ=35.38,
            maxZ=39.38,
            }, {
                options = {
                    {
                        event = "tc-cigarshop-cigaratteOptions",
                        icon = "fas fa-leaf",
                        label = "Dry Leaf Rack",
                        job = 'cigarjob'
                    },
                    -- {
                    --     event = "tc-cigarjob-pickupDriedLeaf",
                    --     icon = "fas fa-circle",
                    --     label = "Pick Up Dry Leaf",
                    --     job = 'cigarjob'
                    -- },
                 },
                distance = 3.1
            })

            exports["qb-target"]:AddBoxZone("grindcig", vector3(-14.99, 3705.97, 38.99), 1, 1, {
                name ="grindcig",
                heading = 0,
                debugPoly=true,
                minZ=35.79,
                maxZ=39.79
                }, {
                    options = {
                        {
                            event = "tc-cigarjob-grindleaf",
                            icon = "fas fa-circle",
                            label = "Place Leaf On The Shredder",
                            job = 'cigarjob'
                        },
                     },
                    distance = 3.1
                })

                exports["qb-target"]:AddBoxZone("grindedcig", vector3(-14.53, 3701.45, 38.8), 1, 1, {
                    name ="grindedcig",
                    heading = 0,
                    debugPoly=true,
                    minZ=35.6,
                    maxZ=39.6
                    }, {
                        options = {
                            {
                                event = "tc-cigarjob-grindedleaf",
                                icon = "fas fa-circle",
                                label = "Pick Up Shredded Tobacco",
                                job = 'cigarjob'
                            },
                         },
                        distance = 3.1
                    })

                    exports["qb-target"]:AddBoxZone("rollcigarette", vector3(-14.99, 3696.76, 38.5), 1, 1, {
                        name ="rollcigarette",
                        heading = 0,
                        debugPoly=true,
                        minZ=35.6,
                        maxZ=39.6
                        }, {
                            options = {
                                {
                                    event = "tc-cigarjob-rollCigarette",
                                    icon = "fas fa-circle",
                                    label = "Roll Cigarette",
                                    job = 'cigarjob'
                                },
                             },
                            distance = 3.1
                        })

                        exports["qb-target"]:AddBoxZone("cigarleafpick", vector3(-48.92, 3661.3, 39.97), 1, 2, {
                            name ="cigarleafpick",
                            heading = 145,
                            debugPoly=true,
                            minZ=39.57,
                            maxZ=43.57
                            }, {
                                options = {
                                    {
                                        -- type = "server",
                                        -- event = "tc-cigarjob-sv-dryCigar",
                                        event = 'tc-cigarjob-pickCigar',
                                        icon = "fas fa-circle",
                                        label = "Pick Leaf",
                                        job = 'cigarjob'
                                    },
                                 },
                                distance = 3.1
                            })

                            exports["qb-target"]:AddBoxZone("cigardry", vector3(-53.48, 3661.95, 42.87), 1, 1, {
                                name ="cigardry",
                                heading = 0,
                                debugPoly=true,
                                minZ=40.87,
                                maxZ=44.87
                                }, {
                                    options = {
                                        {
                                            event = 'tc-cigarshop-cigarOptions',
                                            icon = "fas fa-circle",
                                            label = "Set Leaf Down",
                                            job = 'cigarjob'
                                        },
                                        -- {
                                        --     event = 'tc-cigarjob-trimGrabba',
                                        --     icon = "fas fa-circle",
                                        --     label = "Trim Leaf Down",
                                        --     job = 'cigarjob'
                                        -- },
                                     },
                                    distance = 3.1
                                })

                                exports["qb-target"]:AddBoxZone("cigarroll", vector3(-58.59, 3663.83, 43.12), 1, 1, {
                                    name ="cigarroll",
                                    heading = 0,
                                    debugPoly=true,
                                    minZ=41.12,
                                    maxZ=45.12
                                    }, {
                                        options = {
                                            {
                                                event = 'tc-cigarjob-rollCigar',
                                                icon = "fas fa-circle",
                                                label = "Roll Cigar",
                                                job = 'cigarjob'
                                            },
                                         },
                                        distance = 3.1
                                    })

                                    exports["qb-target"]:AddBoxZone("premDry", vector3(-71.01, 3660.63, 49.29), 1, 1, {
                                        name ="premDry",
                                        heading = 335,
                                        debugPoly=true,
                                        minZ=41.09,
                                        maxZ=45.09
                                        }, {
                                            options = {
                                                {
                                                    event = 'tc-cigarjob-dryPremium',
                                                    icon = "fas fa-wind",
                                                    label = "Dry Leaf",
                                                    job = 'cigarjob'
                                                },
                                             },
                                            distance = 3.1
                                        })

                                        exports["qb-target"]:AddBoxZone("premTrim", vector3(-73.9, 3658.36, 43.94), 1, 1, {
                                            name ="premTrim",
                                            heading = 0,
                                            debugPoly=true,
                                            minZ=41.14,
                                            maxZ=45.14
                                            }, {
                                                options = {
                                                    {
                                                        event = 'tc-cigarjob-trimPremium',
                                                        icon = "fas fa-scissors",
                                                        label = "Cut Leaf",
                                                        job = 'cigarjob'
                                                    },
                                                 },
                                                distance = 3.1
                                            })

                                            exports["qb-target"]:AddBoxZone("premPack", vector3(-77.78, 3655.24, 44.34), 1, 1, {
                                                name ="premPack",
                                                heading = 0,
                                                debugPoly=true,
                                                minZ=41.34,
                                                maxZ=45.34
                                                }, {
                                                    options = {
                                                        {
                                                            event = 'tc-cigarjob-packPremium',
                                                            icon = "fas fa-gift",
                                                            label = "Package Backwoods",
                                                            job = 'cigarjob'
                                                        },
                                                     },
                                                    distance = 3.1
                                                })


            for k, v in pairs(Config.PlantZones) do
                exports["qb-target"]:AddBoxZone(k, v.location, v.x, v.y, {
                    name =k,
                    heading = v.heading,
                    debugPoly=true,
                    minZ=v.minZ,
                    maxZ=v.maxZ,
                    }, {
                        options = {
                            {
                                event = "tc-cigarjob-pickCigaratte",
                                icon = "fas fa-circle",
                                label = "Pick Leaf",
                                job = 'cigarjob'
                            },
                         },
                        distance = 2.1
                    })
            end




end)

RegisterNetEvent('tc-cigarjob-UseCigarette', function()
    QBCore.Functions.Progressbar("smoke_cigarette", "Lighting cigarette...", 500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cigarette"], "remove")
    TriggerServerEvent("QBCore:Server:RemoveItem", "cigarette", 1) -- update cig count
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"smoke"})
    end
        Wait(8000)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
    end)
end)

RegisterNetEvent('tc-cigarjob-rollBlunt', function(itemName)
    local ped = PlayerPedId()
            QBCore.Functions.Progressbar('roll_blunt', 'Rolling Blunt', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'anim@gangops@facility@servers@',
                anim = 'hotwire',
                flags = 16,
            }, {}, {}, function() -- Play When Done
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
                TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)

                if itemName == 'honeyflavorwrap' then
                    print('fag')
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['honeyblunt'], "add")
                    TriggerServerEvent("QBCore:Server:AddItem", 'honeyblunt', 1)
                elseif itemName == 'russiancreamwrap' then
                    print('ass')
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['russiancreamblunt'], "add")
                    TriggerServerEvent("QBCore:Server:AddItem", 'russiancreamblunt', 1)
                elseif itemName == 'wildnmildwrap' then
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['wildmildblunt'], "add")
                    TriggerServerEvent("QBCore:Server:AddItem", 'wildmildblunt', 1)
                end
                ClearPedTasks(ped)
            end, function() -- Play When Cancel
                ClearPedTasks(ped)
            end)
    
end)



