# ricky

# INSTALLATION 

# *Into qb-management

Under Config.Bossmenus
```
['cigarjob'] = {
        vector3(-37.46, 3691.2, 37.47),
    },
 ```
 Under Config.BossMenuZones
 ```
 ['cigarjob'] = {
        { coords = vector3(-37.46, 3691.2, 37.47), length = 2.22, width = 1, heading = 135.0, minZ = 35.07, maxZ = 39.07 },
    },
```
    




*Into qb-core/shared/items.lua


```
["lowtobaccoleaf"] 		 	 	 	 = {["name"] = "lowtobaccoleaf",           			["label"] = "(A) Wet Tobacco Leaf",	 		["weight"] = 1500,		["type"] = "item", 		["image"] = "wetleaflow.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Tobacco Leaf that needs to be grinded for cigarettes!"},
	["midtobaccoleaf"] 		 	 	 	 = {["name"] = "midtobaccoleaf",           			["label"] = "(AA) Wet Tobacco Leaf",	 		["weight"] = 1500,		["type"] = "item", 		["image"] = "wethighmid.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Tobacco Leaf for Cigars."},
	["hightobaccoleaf"] 		 	 	 = {["name"] = "hightobaccoleaf",           		["label"] = "Premium Wet Tobacco Leaf",	 			["weight"] = 1500,		["type"] = "item", 		["image"] = "wethighleaf.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "SUPER RARE TOBACCO LEAF THAT IS USED FOR PREMIUM PRODUCT"},
	["shreddedtobacco"] 		 	 	 	 = {["name"] = "shreddedtobacco",           		["label"] = "Shredded Tobacco For Cigarettes",	 		["weight"] = 500,		["type"] = "item", 		["image"] = "shredded_tobacco.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Shredded tobacco to fill cigarettes."},
	["lowdrytobaccoleaf"] 		 	 	 	 = {["name"] = "lowdrytobaccoleaf",           		["label"] = "(A) Dry Tobacco Leaf",	 		["weight"] = 1500,		["type"] = "item", 		["image"] = "dryleaflow.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Dry Tobacco Leaf To Be Shredded"},
	["middrytobaccoleaf"] 		 	 	 	 = {["name"] = "middrytobaccoleaf",           		["label"] = "(AA) Dry Tobacco Leaf",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "drytobaccoleaf.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Dry Tobacco Leaf To Be Trimmed"},
	["highdrytobaccoleaf"] 		 	 	 	 = {["name"] = "highdrytobaccoleaf",           		["label"] = "Premium Dry Tobacco Leaf",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "dryleafhigh.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Dry Tobacco Leaf To Be Trimmed"},

	
["honeyflavorleaf"] 		 	 	 	 = {["name"] = "honeyflavorleaf",           		["label"] = "Honey Flavoured Tobacco Leaf",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "dryleafhigh.png", 			["unique"] = false, 	
["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Honey Flavoured Leaf"},
	["russiancreamleaf"] 		 	 	 	 = {["name"] = "russiancreamleaf",           		["label"] = "Russian Cream Flavoured Tobacco Leaf",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "dryleafhigh.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Russian Cream Flavoured Leaf"},
	["wildnmildleaf"] 		 	 	 	 = {["name"] = "wildnmildleaf",           		["label"] = "Wild'n Mild Flavoured Tobacco Leaf",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "dryleafhigh.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Wild'n Mild Flavoured Leaf"},

	
["honeyflavorwrap"] 		 	 	 	 = {["name"] = "honeyflavorwrap",           		["label"] = "Honey Flavoured Wrap",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "backwoodwrap.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Honey Flavoured Wrap Ready To Roll"},
	["russiancreamwrap"] 		 	 	 	 = {["name"] = "russiancreamwrap",           		["label"] = "Russian Cream Flavoured Wrap",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "backwoodwrap.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Russian Cream Flavoured Wrap Ready To Roll"},
	["wildnmildwrap"] 		 	 	 	 = {["name"] = "wildnmildwrap",           		["label"] = "Wild'n Mild Flavoured Wrap",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "backwoodwrap.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Wild'n Mild Flavoured Wrap Ready To Roll"},

["honeybackwood"] 		 	 	 	 = {["name"] = "honeybackwood",           		["label"] = "Honey Backwood",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "honeybackwood.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Honey Backwood"},
["russiancreambackwood"] 		 	 	 	 = {["name"] = "russiancreambackwood",           		["label"] = "Russian Cream Backwood",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "russiancreambackwood.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Russian Cream Backwood"},
["wildmildbackwood"] 		 	 	 	 = {["name"] = "wildmildbackwood",           		["label"] = "Wild'n Mild Backwood",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "wildmild.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Wild'n Mild Backwood"},

["honeyblunt"] 		 	 	 	 = {["name"] = "honeyblunt",           				["label"] = "Honey Blunt",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "honeyblunt.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Honey Backwood"},
["russiancreamblunt"] 		 	 	 	 = {["name"] = "russiancreamblunt",           		["label"] = "Russian Cream Backwood",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "russiancreamblunt.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Russian Cream Backwood"},
	["wildmildblunt"] 		 	 	 	 = {["name"] = "wildmildblunt",           		["label"] = "Wild'n Mild Backwood",	 		["weight"] = 2500,		["type"] = "item", 		["image"] = "wildmildblunt.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Wild'n Mild Backwood"},



['cigarette'] 						 = {['name'] = 'cigarette', 			  	  		['label'] = 'Cigarette', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'cigarette.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Cancer Stick'},
	['cigar'] 						 = {['name'] = 'cigar', 			  	  		['label'] = 'Cigar', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'cigar.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Relaxing Stick'},
	["trimmedtobaccoleaf"] 		 	 	 	 = {["name"] = "trimmedtobaccoleaf",           		["label"] = "Trimmed Tobacco Wrap",	 		["weight"] = 830,		["type"] = "item", 		["image"] = "trimmedtobacco.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["expire"] = 90,  ["description"] = "Trimmed Tobacco That Can Roll"},```
