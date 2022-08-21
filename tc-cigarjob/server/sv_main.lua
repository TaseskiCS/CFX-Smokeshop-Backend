local QBCore = exports['qb-core']:GetCoreObject()
local dryleaf = {}
local leafdoneDrying = nil

RegisterNetEvent('tc-cigarjob-sv-dryleaf', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.Functions.GetItemByName('lowtobaccoleaf') ~= nil then
        local amt = Player.Functions.GetItemByName('lowtobaccoleaf').amount
        local basetime = math.random(8,10) --time to dry per leaf
        local timer = basetime * amt
        
    
        Player.Functions.RemoveItem('lowtobaccoleaf', amt)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lowtobacooleaf'], "remove") 
        table.insert(dryleaf, amt)
        TriggerClientEvent('QBCore:Notify', src, 'Leaf Will Take About '.. timer.. ' seconds to dry', 'success')
        leafdoneDrying = false
        Wait(timer * 1000)
        print('leaf done drying')
        TriggerClientEvent('QBCore:Notify', src, 'Your Leaf Should Be Dry By Now', 'success')
        leafdoneDrying = true
    else
        TriggerClientEvent('QBCore:Notify', src, 'No leaf to dry', 'error')
    end
end)



RegisterNetEvent('tc-cigarjob-sv-pickupDriedLeaf', function(time)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if leafdoneDrying then
        for i = 1, #dryleaf do
            Player.Functions.AddItem('lowdrytobaccoleaf', dryleaf[i])
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lowdrytobacooleaf'], "add")
            Wait(100)
            table.remove(dryleaf, amt)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Leaf is not done drying', 'error')
    end
end)

-- local dryingRack = {}
-- local grindedLeaf = nil
-- RegisterNetEvent('tc-cigarjob-sv-grindleaf', function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local hasItems = nil
--     -- local placedleafs = Player.Functions.GetItemByName('lowdrytobaccoleaf').amount
--     for k, v in pairs(Config.RequiredGrindItems) do
--         if Player.Functions.GetItemByName(v.name) ~= nil then
--             local placedleafs = Player.Functions.GetItemByName(v.name).amount

--             local timeToDry = 5
--             local eachleafInPockets = placedleafs * timeToDry

--             -- Player.Functions.RemoveItem('lowdrytobaccoleaf', placedleafs)
--             Player.Functions.RemoveItem(v.name, placedleafs)
--             table.insert(dryingRack, placedleafs)


--             Wait(eachleafInPockets * 1000)

--             TriggerClientEvent('QBCore:Notify', src, 'Done Grinding', 'success')
--             grindedLeaf = true
--         end
--     end
-- end)

local dryingRack = {}
local grindedLeaf = nil
local grindedTrim = nil
local trimLeaf = {}
RegisterNetEvent('tc-cigarjob-sv-grindleaf', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasItems = nil
    -- local placedleafs = Player.Functions.GetItemByName('lowdrytobaccoleaf').amount
    -- for k, v in pairs(Config.RequiredGrindItems) do
        if Player.Functions.GetItemByName('lowdrytobaccoleaf') ~= nil then
            local placedleafs = Player.Functions.GetItemByName('lowdrytobaccoleaf').amount

            local timeToDry = 5
            local eachleafInPockets = placedleafs * timeToDry

            -- Player.Functions.RemoveItem('lowdrytobaccoleaf', placedleafs)
                Player.Functions.RemoveItem('lowdrytobaccoleaf', placedleafs)
                table.insert(dryingRack, placedleafs)
            

            Wait(eachleafInPockets * 1000)

            TriggerClientEvent('QBCore:Notify', src, 'Tobacco Leaf Done Grinding', 'success')
            grindedLeaf = true
        elseif Player.Functions.GetItemByName('trimmedtobaccoleaf') ~= nil then
            local trimAmt = 1 
            Player.Functions.RemoveItem('trimmedtobaccoleaf', trimAmt)
            table.insert(trimLeaf, trimAmt)
            Wait(5000)
            TriggerClientEvent('QBCore:Notify', src, 'Trimmed Tobacco Finished Grinding', 'success')
            grindedTrim = true

            
        end

    -- end
end)


RegisterNetEvent('tc-cigarjob-sv-grindedLeaf', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local randBags = Config.ShreddedTobaccoBagsPerLeaf --amount of bags per leaf
    if Player.Functions.GetItemByName('empty_weed_bag') ~= nil then
        local bagAmount = Player.Functions.GetItemByName('empty_weed_bag').amount
        -- local bagAmount = Player.Functions.GetItemByName(Config.RequiredGrindItems).amount
        if grindedLeaf then
            for i = 1, #dryingRack do
                local amountProduct = dryingRack[i] * randBags
                if bagAmount >= amountProduct then
                    Player.Functions.AddItem('shreddedtobacco', amountProduct)
                    Player.Functions.RemoveItem('empty_weed_bag', amountProduct)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['shreddedtobacco'], "add")
                    Wait(100)
                    grindedLeaf = false
                    table.remove(dryingRack, placedleafs)
                else
                    TriggerClientEvent('QBCore:Notify', src, 'Need More Bags', 'error')
                end
            end
        elseif grindedTrim then
            for i = 1, #trimLeaf do
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['shreddedtobacco'], "add")
                Player.Functions.AddItem('shreddedtobacco', trimLeaf[i])
                Wait(100)
                table.remove(trimLeaf, trimAmt)
                grindedTrim = false
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Not Grinded Yet', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Need Something To Bag The Shredded Tobacco', 'error')
    end
end)

RegisterNetEvent('tc-cigarjob-sv-rollCigarette', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('cigarette', 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cigarette"], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['shreddedtobacco'], "remove")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rolling_paper'], "remove")
    Player.Functions.RemoveItem('shreddedtobacco', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
end)

QBCore.Functions.CreateUseableItem("cigarette", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('tc-cigarjob-UseCigarette', src, item.name)
end)

--cbs
QBCore.Functions.CreateCallback('tc-cigarjob-sv-cigarGrade', function(source, cb)
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "cigarjob" and Player.PlayerData.job.grade.level >= 1 ) then
                cb(true)
            else
                cb(false)
            end
        end
    end
    cb(grade1)
end)


QBCore.Functions.CreateCallback('tc-cigarjob-sv-premiumGrade', function(source, cb)
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "cigarjob" and Player.PlayerData.job.grade.level >= 3 ) then
                cb(true)
            else
                cb(false)
            end
        end
    end
    cb(grade1)
end)


-- local dryingCigarLeafs = {}
-- RegisterNetEvent('tc-cigarjob-sv-dryCigar', function()
--     print('tooooooooooooooooo')
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local amountLeaf = Player.Functions.GetItemByName('midtobaccoleaf').amount
--     TriggerClientEvent('tc-cigarjob-dryCigar', amountLeaf, src)
--     table.insert(dryingCigarLeafs, amountLeaf)
-- end)

-- RegisterNetEvent('tc-cigarjob-sv-driedCigar', function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     for i = 1, #dryingCigarLeafs do
--         Player.Functions.AddItem('sandwich', dryingCigarLeafs[i])
--         Player.Functions.RemoveItem('midtobaccoleaf', dryingCigarLeafs[i])
--         Wait(100)
--         -- table.remove(dryingCigarLeafs, amountLeaf)
--     end
-- end)

RegisterNetEvent('tc-cigarjob-sv-driedCigar', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['middrytobaccoleaf'], "add")
    -- TriggerClientEvent('QBCore:Notify', src, 'Dried The Tobacco Leaf', 'error')
    Player.Functions.AddItem('middrytobaccoleaf', 1)
    Player.Functions.RemoveItem('midtobaccoleaf', 1)
end)


RegisterNetEvent('tc-cigarjob-sv-trimGrabba', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local randAmt = Config.AmountTrimmedTobacco
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['trimmedtobaccoleaf'], "add")
    Player.Functions.AddItem('trimmedtobaccoleaf', randAmt)
    Player.Functions.RemoveItem('middrytobaccoleaf', 1)
end)


RegisterNetEvent('tc-cigarjob-sv-rollCigar', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cigar'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['shreddedtobacco'], "remove")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['trimmedtobaccoleaf'], "remove")
    Player.Functions.AddItem('cigar', 1)
    Player.Functions.RemoveItem('shreddedtobacco', 1)
    Player.Functions.RemoveItem('trimmedtobaccoleaf', 1)
end)
-- local takenleaf = nil

-- RegisterNetEvent('tc-cigarjob-sv-pickupDriedLeaf', function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

--     if leafdoneDrying then
--         if not takenleaf then
--             for i = 1, #dryleaf do
--                 Player.Functions.AddItem('lowtobaccoleaf', dryleaf[i])
--                 takenleaf = true
--             end
--         end
--         takenleaf = false
--     else
--         TriggerClientEvent('QBCore:Notify', src, 'Leaf is not done drying', 'error')
--     end

--     if takenleaf then
--         TriggerClientEvent('QBCore:Notify', src, 'No more leafs to grab', 'error')
--     end
--     -- Player.Functions.AddItem('lowtobaccoleaf', 1)
-- end)



--PREMIUM

-- RegisterNetEvent('tc-cigarjob-sv-dryPremium', function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
    

--     local randomItem = Config.RandomBackWoods[math.random(1, #Config.RandomBackWoods)]

--     TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[randomItem], "add")

  
--     TriggerClientEvent('QBCore:Notify', src, "Wow It looks Like It's " ..randomItem, 'success')
    
    
--     Player.Functions.AddItem(randomItem, 1)
--     Player.Functions.RemoveItem('hightobaccoleaf', 1)
-- end)


RegisterNetEvent('tc-cigarjob-sv-dryPremium', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        local randomItem = Config.RandomBackwoodTypes[math.random(1, #Config.RandomBackwoodTypes)].leaf

        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[randomItem], "add")
        TriggerClientEvent('QBCore:Notify', src, "Wow It looks Like It's " ..randomItem, 'success')
        Player.Functions.AddItem(randomItem, 1)
        Player.Functions.RemoveItem('hightobaccoleaf', 1)
end)


RegisterNetEvent('tc-cigarjob-sv-trimPremium', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasLeafs = nil

    for k,v in pairs(Config.RandomBackwoodTypes) do
        local leaf = v.leaf
        if Player.Functions.GetItemByName(leaf) ~= nil then
            hasLeafs = true

            if leaf == 'honeyflavorleaf' then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['honeyflavorwrap'], "add")
                Player.Functions.AddItem('honeyflavorwrap', Config.AmountOfWrapsPerBackwoodLeaf)
                Player.Functions.RemoveItem('honeyflavorleaf', 1)
            elseif leaf == 'russiancreamleaf' then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['russiancreamwrap'], "add")
                Player.Functions.AddItem('russiancreamwrap', Config.AmountOfWrapsPerBackwoodLeaf)
                Player.Functions.RemoveItem('russiancreamleaf', 1)
            elseif leaf == 'wildnmildleaf' then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wildnmildwrap'], "add")
                Player.Functions.AddItem('wildnmildwrap', Config.AmountOfWrapsPerBackwoodLeaf)
                Player.Functions.RemoveItem('wildnmildleaf', 1)
            end
        end
    end

    if hasLeafs then
        TriggerClientEvent('QBCore:Notify', src, "Trimmed Leaf", 'success')
    end

    if not hasLeafs then
        TriggerClientEvent('QBCore:Notify', src, "No Leafs To Trim", 'error')
    end

end)



RegisterNetEvent('tc-cigarjob-sv-packPremium', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasWraps = nil

    for k, v in pairs(Config.RandomBackwoodTypes) do
        local wrap = v.wrap

        if Player.Functions.GetItemByName(wrap) ~= nil then

            hasWraps = true
            
            if wrap == 'honeyflavorwrap' then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['honeybackwood'], "add")
                Player.Functions.AddItem('honeybackwood', 1)
                Player.Functions.RemoveItem('honeyflavorwrap', Config.AmountOfWrapsToMakeBackwood)
            elseif wrap == 'russiancreamwrap' then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['russiancreambackwood'], "add")
                Player.Functions.AddItem('russiancreambackwood', 1)
                Player.Functions.RemoveItem('russiancreamwrap', Config.AmountOfWrapsToMakeBackwood)
            elseif wrap == 'wildnmildwrap' then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wildmildbackwood'], "add")
                Player.Functions.AddItem('wildmildbackwood', 1)
                Player.Functions.RemoveItem('wildnmildwrap', Config.AmountOfWrapsToMakeBackwood)
            end
        
        end
    end

    if hasWraps then
        TriggerClientEvent('QBCore:Notify', src, "Packed Backwoods", 'success')
    end

    if not hasWraps then
        TriggerClientEvent('QBCore:Notify', src, "No Wraps To Package", 'error')
    end



end)


QBCore.Functions.CreateUseableItem('honeybackwood' , function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('honeyflavorwrap', Config.AmountOfWrapsToMakeBackwood)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['honeyflavorwrap'], "add")
    Player.Functions.RemoveItem('honeybackwood', 1)
end)

QBCore.Functions.CreateUseableItem('wildmildbackwood' , function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('wildnmildwrap', Config.AmountOfWrapsToMakeBackwood)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wildnmildwrap'], "add")
    Player.Functions.RemoveItem('wildmildbackwood', 1)
end)

QBCore.Functions.CreateUseableItem('russiancreambackwood' , function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('russiancreamwrap', Config.AmountOfWrapsToMakeBackwood)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['russiancreamwrap'], "add")
    Player.Functions.RemoveItem('russiancreambackwood', 1)
end)


QBCore.Functions.CreateUseableItem('honeyflavorwrap' , function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    for k, v in pairs(Config.ItemsToRollBlunt) do

        if Player.Functions.GetItemByName(v) ~= nil then
            -- Player.Functions.RemoveItem(item.name, 1, item.slot) 
            Player.Functions.RemoveItem(v, 1)
            TriggerClientEvent('tc-cigarjob-rollBlunt', src, item.name)
        end
    end

end)

QBCore.Functions.CreateUseableItem('russiancreamwrap' , function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    for k, v in pairs(Config.ItemsToRollBlunt) do

        if Player.Functions.GetItemByName(v) ~= nil then
            -- Player.Functions.RemoveItem(item.name, 1, item.slot) 
            Player.Functions.RemoveItem(v, 1)
            TriggerClientEvent('tc-cigarjob-rollBlunt', src, item.name)
        end
    end

end)

QBCore.Functions.CreateUseableItem('wildnmildwrap' , function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    for k, v in pairs(Config.ItemsToRollBlunt) do

        if Player.Functions.GetItemByName(v) ~= nil then
            -- Player.Functions.RemoveItem(item.name, 1, item.slot) 
            Player.Functions.RemoveItem(v, 1)
            TriggerClientEvent('tc-cigarjob-rollBlunt', src, item.name)
        end
    end

end)




--["lowtobaccoleaf"] 		 	 	 	 = {["name"] = "lowtobaccoleaf",           			["label"] = "Harvested Tobacco Leaf (Low)",	 		["weight"] = 1500,		["type"] = "item", 		["image"] = "coca_leaf.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Tobacco Leaf that needs to be grinded for cigarettes!"},
--["midtobaccoleaf"] 		 	 	 	 = {["name"] = "midtobaccoleaf",           			["label"] = "Harvested Tobacco Leaf (Mid)",	 		["weight"] = 1500,		["type"] = "item", 		["image"] = "coca_leaf.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Tobacco Leaf for Cigars."},
--["shreddedtobacco"] 		 	 	 	 = {["name"] = "shreddedtobacco",           		["label"] = "Shredded Tobacco For Cigarettes",	 		["weight"] = 500,		["type"] = "item", 		["image"] = "shredded_tobacco.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Shredded tobacco to fill cigarettes."},
--["hightobaccoleaf"] 		 	 	 = {["name"] = "hightobaccoleaf",           		["label"] = "Premium Tobacco Leaf",	 			["weight"] = 1500,		["type"] = "item", 		["image"] = "coca_leaf.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "SUPER RARE TOBACCO LEAF THAT IS USED FOR PREMIUM PRODUCT"},
--["lowdrytobaccoleaf"] 		 	 	 	 = {["name"] = "lowdrytobaccoleaf",           		["label"] = "Dry Tobacco Leaf (Low)",	 		["weight"] = 1500,		["type"] = "item", 		["image"] = "coca_leaf.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Dry Tobacco Leaf To Be Shredded"},
--["middrytobaccoleaf"] 		 	 	 	 = {["name"] = "middrytobaccoleaf",           		["label"] = "Dry Tobacco Leaf (Mid)",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "drytobaccoleaf.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Dry Tobacco Leaf To Be Trimmed"},
--["trimmedtobaccoleaf"] 		 	 	 	 = {["name"] = "trimmedtobaccoleaf",           		["label"] = "Trimmed Tobacco Leaf",	 		["weight"] = 830,		["type"] = "item", 		["image"] = "trimmedtobacco.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Trimmed Tobacco That Can Roll"},
