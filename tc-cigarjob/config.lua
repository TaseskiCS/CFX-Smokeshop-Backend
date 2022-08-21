Config = {}

----------------NOTES FROM RICKY-----------------------------


--cigarette pick time 15 secs
--cigar pick time 20 secs



Config.RequiredPickingItems = {
    'trimming_scissors',
}

Config.RequiredCigaretteRollingItems = {
    'rolling_paper',
    'shreddedtobacco'
}

Config.RequiredCigarRollingItems = {
    'shreddedtobacco',
    'trimmedtobaccoleaf',
}

-- Config.RequiredCigarRollingItems = {
--     [1] = {
--         name = 'shreddedtobacco',
--     },
--     [2] = {
--         name = 'trimmedtobaccoleaf',
--     }
-- }

Config.RequiredGrindItems = {
    [1] = {
        name = 'lowdrytobaccoleaf',
    },
    [2] = {
        name = 'trimmedtobaccoleaf',
    }
}

Config.RequiredTrimmingItems = {
    'weapon_knife',
    'middrytobaccoleaf'
}


Config.ShreddedTobaccoBagsPerLeaf = math.random(3,5)  --between 3 and 5 bags are made for every leaf

Config.AmountTrimmedTobacco = math.random(2,4)

Config.RandomBackWoods = {

    ['name'] = 'honeyflavorleaf',
                'russiancreamleaf',
                'wildnmildleaf',
   

}

Config.RandomBackwoodTypes = {
    [1] = {
        leaf =  'honeyflavorleaf',
        wrap = 'honeyflavorwrap',                       --if any new items are added you must go to the 'tc-cigarjob-sv-trimPremium' event and/or 'tc-cigarjob-sv-packPremium' and/or 'tc-cigarjob-rollBlunt' event and change accordingly
    },                                                                                          --otherwise just text me ill do it -tony
    [2] = {
        leaf =  'russiancreamleaf',
        wrap = 'russiancreamwrap',
    },
    [3] = {
        leaf =  'wildnmildleaf',
        wrap = 'wildnmildwrap',
    },
}

Config.AmountOfWrapsPerBackwoodLeaf = math.random(2,4)

Config.AmountOfWrapsToMakeBackwood = 2

Config.ItemsToRollBlunt = {
    [1] = 'weed_skunk',

    [2] = 'weed_ak47',

    [3] = 'weed_og-kush',

    [4] = 'weed_purple-haze',

    [5] = 'weed_amnesia',

    [6] = 'weed_white-widow',
    
}



Config.PlantZones = {
    ['cig1'] = {
        
        location = vector3(33.72, 2917.45, 56.3),
        x = 2,
        y = 2,
        heading = 0,
        minZ=53.1,
        maxZ=57.1

    },
    ['cig2'] = {
        
        location = vector3(35.65, 2920.85, 56.47),
        x = 2,
        y = 2,
        heading = 0,
        minZ=53.07,
        maxZ=57.07

    },
    ['cig3'] = {
        
        location = vector3(33.48, 2923.76, 56.5),
        x = 2,
        y = 2,
        heading = 0,
        minZ=53.1,
        maxZ=57.1
    },
    ['cig4'] = {
        
        location = vector3(26.09, 2928.49, 56.42),
        x = 2,
        y = 2,
        heading = 0,
        minZ=53.02,
        maxZ=57.02

    },
    ['cig5'] = {
        
        location = vector3(23.74, 2935.35, 56.52),
        x = 2,
        y = 2,
        heading = 0,
        minZ=53.12,
        maxZ=57.12

    },
    ['cig6'] = {
        
        location = vector3(24.64, 2938.05, 56.67),
        x = 2,
        y = 2,
        heading = 0,
        minZ=53.27,
        maxZ=57.27

    },
    -- ['cig7'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig8'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig9'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig10'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig11'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig12'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig13'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig14'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig15'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig16'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig17'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig18'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig19'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig20'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig21'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig22'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    -- ['cig23'] = {
        
    --     location = ,
    --     x = 2,
    --     y = 2,
    --     heading = 0,
    --     minZ = ,
    --     maxZ = ,

    -- },
    
}