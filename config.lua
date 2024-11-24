lib.locale()

Config = {}

Config.Debug = false

Config.ClothingScript = 'illenium-appearance' -- 'illenium-appearance', 'fivem-appearance' ,'core' or false -- to disable
Config.PrisonSystem = 'pickle_prisons'        -- 'pickle_prisons', 'esx-qalle-jail'
Config.ItemCuffs = "handcuffs"                -- name of the item cuffs
Config.CanBreakCuffs = true                   -- to use this function follow the installation
Config.UseInternalDuty = true
Config.AccessToMenu = { "police" }
Config.OpenMenuKey = "F6"
Config.MettingMenuGrade = 3

Config.Interactions = {
	enable = true,

	handcuffs = true,
	search = true,
	escort = true,
	put_out_vehicle = true,
	fines = true,
	prison = true,
	jobs = { "police", "mechanic" },
}

Config.PoliceVehicles = { -- vehicles that have access to the props (cones and ecc..)
	'police',
	'police2',
	'police3',
	'policeb',
}

Config.PoliceStations = {
    ["station_1"] = {
        jobs = { "police", "mechanic" },
        bossmenu = {
            pos = vector3(447.08, -974.44, 30.68),
            min_grade = 4,
        },
        duty = vector3(440.92, -980.76, 30.72),
        zone = {
            pos = vec3(448.0, -997.0, 44.0),
            size = vec3(96.0, 79.0, 65.0),
        },
        blip = {
            enable = true,
            name = "Los Santos Police Department",
            type = 60,
            scale = 0.8,
            color = 38,
            pos = vector3(440.8360, -982.6481, 30.6896),
        },
        armory = {
            pedPos = vector4(454.1804, -980.1198, 29.6896, 90.0000),
            playerPos = vector4(452.3223, -980.0303, 29.7002, 270.0000),
            model = "s_m_y_cop_01",
            require_storage = true,
            storage = {
                stashId = "podsalice_armory_storage",
                stashLabel = "LSPD Armory Storage",
                minGradeAccess = 2,
            },
            equipment = {
                [0] = { -- Grade 0 (Recruit by default)
                    name = "Food & Drinks",
                    icon = "fas fa-utensils",
                    {
                        item = "tosti",
                        label = "Tosti",
                        quantity = 10,
                        prop = {
                            model = "prop_cs_burger_01",
                            placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
                        },
                    },
                    {
                        item = "water",
                        label = "Water",
                        quantity = 10,
                        prop = {
                            model = "ba_prop_club_water_bottle",
                            placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
                        },
                    },
                },
                [1] = { -- Grade 1 (Officer by default)
                    name = "Pistols",
                    icon = "fas fa-gun",
                    {
                        item = "weapon_combatpistol",
                        label = "Pistol",
                        quantity = 1,
                        prop = {
                            model = "w_pi_pistol",
                            placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
                        },
                    },
                    {
                        item = "ammo-9",
                        label = "9mm ammo",
                        quantity = 100,
                        prop = {
                            model = "h4_prop_h4_box_ammo_01a",
                            placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
                        },
                    },
                },
                [2] = {
                    name = "Assault",
                    icon = "fas fa-gun",
                    {
                        item = "weapon_carbinerifle",
                        label = "Carbine Rifle",
                        quantity = 1,
                        prop = {
                            model = "w_ar_carbinerifle",
                            placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
                        },
                    },
                    {
                        item = "ammo-rifle",
                        label = "Rifle ammo",
                        quantity = 300,
                        prop = {
                            model = "h4_prop_h4_box_ammo_01a",
                            placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
                        },
                    },
                },
                [3] = {
                    name = "Shotgun",
                    icon = "fas fa-gun",
                    {
                        item = "weapon_pumpshotgun",
                        label = "Pump Shotgun",
                        quantity = 1,
                        prop = {
                            model = "w_sg_pumpshotgun",
                            placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
                        },
                    },
                    {
                        item = "ammo-shotgun",
                        label = "Shotgun ammo",
                        quantity = 50,
                        prop = {
                            model = "h4_prop_h4_box_ammo_01a",
                            placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
                        },
                    },
                },
            },
        },
        garage = {
            ["police_garage_1"] = {
                pedPos = vector3(446.5634, -1023.0416, 27.5633),
                model = "mp_m_weapexp_01",
                spawn = vector4(450.4673, -1019.8383, 28.4502, 90.0492),
                deposit = vector3(450.4673, -1019.8383, 28.4502),
                driverSpawnCoords = vector3(452.0132, -1025.2670, 27.5377),

                vehicles = {
                    {
                        label = "Police",
                        spawn_code = "police",
                        min_grade = 0,
                        modifications = {}, -- es. {color1 = {255, 12, 25}}
                    },
                    {
                        label = "Police 2",
                        spawn_code = "police2",
                        min_grade = 2,
                        modifications = {},
                    },
                },
            },
        },
        stash = {
            ["police_stash_1"] = {
                slots = 50,
                weight = 50, -- kg
                min_grade = 0,
                label = "Lspd stash",
                shared = true, -- false if you want to make everyone has a personal stash
                pos = vector3(451.70455932617, -974.02062988281, 30.689004898071),
            },
        },
        cameras = {
            pos = vector3(441.64836425781, -979.58472167969, 30.75832862854),
            views = {
                {
                    pos = vector3(433.63613891602, -978.21331787109, 33.510547637939),
                    rot = vector3(-2.2620145045948e-07, 1.3051226233074e-06, 125.97998046875),
                },
                {
                    pos = vector3(424.19268798828, -996.83068847656, 34.037242889404),
                    rot = vector3(9.8608965345193e-05, 2.7001857233699e-05, 124.36595153809),
                },
                {
                    pos = vector3(438.27066040039, -999.63421630859, 32.715244293213),
                    rot = vector3(0.0, -0.0, -154.93447875977),
                },
                {
                    pos = vector3(489.390625, -1004.2265014648, 30.153388977051),
                    rot = vector3(0.0, 0.0, -56.987983703613),
                },
                {
                    pos = vector3(482.24676513672, -978.32403564453, 30.483800888062),
                    rot = vector3(0.0, 0.0, 25.241655349731),
                },
                {
                    pos = vector3(455.39239501953, -971.02227783203, 33.162532806396),
                    rot = vector3(1.9254218841525e-07, -1.1291083268361e-07, 22.17286491394),
                },
            },
        },
        clothes = {
            enable = false,
            pos = vector4(452.6250, -991.7988, 29.6896, 357.0948),
            model = "a_f_m_bevhills_01",
            male = {
                [1] = {
                    ["mask_1"] = 0,
                    ["mask_2"] = 0,
                    ["arms"] = 0,
                    ["tshirt_1"] = 15,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 86,
                    ["torso_2"] = 0,
                    ["bproof_1"] = 0,
                    ["bproof_2"] = 0,
                    ["decals_1"] = 0,
                    ["decals_2"] = 0,
                    ["chain_1"] = 0,
                    ["chain_2"] = 0,
                    ["pants_1"] = 10,
                    ["pants_2"] = 2,
                    ["shoes_1"] = 56,
                    ["shoes_2"] = 0,
                    ["helmet_1"] = 34,
                    ["helmet_2"] = 0,
                    ["glasses_1"] = 34,
                    ["glasses_2"] = 1,
                },
                [2] = {
                    ["mask_1"] = 0,
                    ["mask_2"] = 0,
                    ["arms"] = 0,
                    ["tshirt_1"] = 15,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 86,
                    ["torso_2"] = 0,
                    ["bproof_1"] = 0,
                    ["bproof_2"] = 0,
                    ["decals_1"] = 0,
                    ["decals_2"] = 0,
                    ["chain_1"] = 0,
                    ["chain_2"] = 0,
                    ["pants_1"] = 10,
                    ["pants_2"] = 2,
                    ["shoes_1"] = 56,
                    ["shoes_2"] = 0,
                    ["helmet_1"] = 34,
                    ["helmet_2"] = 0,
                    ["glasses_1"] = 34,
                    ["glasses_2"] = 1,
                },
            },
            female = {
                [1] = {
                    ["mask_1"] = 0,
                    ["mask_2"] = 0,
                    ["arms"] = 0,
                    ["tshirt_1"] = 15,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 86,
                    ["torso_2"] = 0,
                    ["bproof_1"] = 0,
                    ["bproof_2"] = 0,
                    ["decals_1"] = 0,
                    ["decals_2"] = 0,
                    ["chain_1"] = 0,
                    ["chain_2"] = 0,
                    ["pants_1"] = 10,
                    ["pants_2"] = 2,
                    ["shoes_1"] = 56,
                    ["shoes_2"] = 0,
                    ["helmet_1"] = 34,
                    ["helmet_2"] = 0,
                    ["glasses_1"] = 34,
                    ["glasses_2"] = 1,
                },
            },
        },
    },
    -- ["station_2"] = {
    -- 	jobs = { "police", "mechanic" },
    -- 	zone = {
    -- 		pos = vec3(448.0, -997.0, 44.0),
    -- 		size = vec3(96.0, 79.0, 65.0),
    -- 	},
    -- 	blip = {
    -- 		enable = true,
    -- 		name = 'Los Santos Police Department',
    -- 		type = 60,
    -- 		scale = 0.8,
    -- 		color = 38,
    -- 		pos = vector3(440.8360, -982.6481, 30.6896),
    -- 	},
    -- 	armory = {
    -- 		pedPos = vector4(454.1804, -980.1198, 29.6896, 90.0000),
    -- 		playerPos = vector4(452.3223, -980.0303, 29.7002, 270.0000),
    -- 		model = 's_m_y_cop_01',
    -- 		require_storage = true,
    -- 		storage = {
    -- 			stashId = 'podsalice_armory_storage',
    -- 			stashLabel = 'LSPD Armory Storage',
    -- 			minGradeAccess = 2,
    -- 		},
    -- 		equipment = {
    -- 			[1] = {
    -- 				{
    -- 					item = 'weapon_pistol',
    -- 					label = 'Pistol',
    -- 					quantity = 1,
    -- 					prop = {
    -- 						model = 'w_pi_pistol',
    -- 						placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
    -- 					},
    -- 				},
    -- 				{
    -- 					item = 'weapon_assaultrifle',
    -- 					label = 'Rifle',
    -- 					quantity = 1,
    -- 					prop = {
    -- 						model = 'w_ar_carbinerifle',
    -- 						placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
    -- 					},
    -- 				},
    -- 				{
    -- 					item = 'water',
    -- 					label = 'Water',
    -- 					quantity = 5,
    -- 					prop = {
    -- 						model = 'prop_ld_flow_bottle',
    -- 						placePos = vector3(453.24318450195, -979.99542724609 - 0.1, 30.615884399414),
    -- 					},
    -- 				},
    -- 			},
    -- 		},
    -- 	},
    -- 	garage = {
    -- 		['police_garage_1'] = {
    -- 			pedPos = vector3(446.5634, -1023.0416, 27.5633),
    -- 			model = 'mp_m_weapexp_01',
    -- 			spawn = vector4(450.4673, -1019.8383, 28.4502, 90.0492),
    -- 			deposit = vector3(450.4673, -1019.8383, 28.4502),
    -- 			driverSpawnCoords = vector3(452.0132, -1025.2670, 27.5377),

    -- 			vehicles = {
    -- 				{
    -- 					label = 'Police',
    -- 					spawn_code = 'police',
    -- 					min_grade = 0,
    -- 					modifications = {} -- es. {color1 = {255, 12, 25}}
    -- 				},
    -- 				{
    -- 					label = 'Police 2',
    -- 					spawn_code = 'police2',
    -- 					min_grade = 2,
    -- 					modifications = {}
    -- 				},
    -- 			}
    -- 		}
    -- 	},
    -- 	stash = {
    -- 		['police_stash_1'] = {
    -- 			slots = 50,
    -- 			weight = 50, -- kg
    -- 			min_grade = 0,
    -- 			label = 'Lspd stash',
    -- 			shared = true, -- false if you want to make everyone has a personal stash
    -- 			pos = vector3(451.70455932617, -974.02062988281, 30.689004898071)
    -- 		}
    -- 	},
    -- 	cameras = {
    -- 		pos = vector3(441.64836425781, -979.58472167969, 30.75832862854),
    -- 		views = {
    -- 			{
    -- 				pos = vector3(433.63613891602, -978.21331787109, 33.510547637939),
    -- 				rot = vector3(-2.2620145045948e-07, 1.3051226233074e-06, 125.97998046875)
    -- 			},
    -- 			{
    -- 				pos = vector3(424.19268798828, -996.83068847656, 34.037242889404),
    -- 				rot = vector3(9.8608965345193e-05, 2.7001857233699e-05, 124.36595153809)
    -- 			},
    -- 			{
    -- 				pos = vector3(438.27066040039, -999.63421630859, 32.715244293213),
    -- 				rot = vector3(0.0, -0.0, -154.93447875977)
    -- 			},
    -- 			{
    -- 				pos = vector3(489.390625, -1004.2265014648, 30.153388977051),
    -- 				rot = vector3(0.0, 0.0, -56.987983703613)
    -- 			},
    -- 			{
    -- 				pos = vector3(482.24676513672, -978.32403564453, 30.483800888062),
    -- 				rot = vector3(0.0, 0.0, 25.241655349731)
    -- 			},
    -- 			{
    -- 				pos = vector3(455.39239501953, -971.02227783203, 33.162532806396),
    -- 				rot = vector3(1.9254218841525e-07, -1.1291083268361e-07, 22.17286491394)
    -- 			},
    -- 		}
    -- 	},
    -- 	clothes = {
    -- 		enable = true,
    -- 		pos = vector4(452.6250, -991.7988, 29.6896, 357.0948),
    -- 		model = 'a_f_m_bevhills_01',
    -- 		male = {
    -- 			[1] = {
    -- 				['mask_1']    = 0,
    -- 				['mask_2']    = 0,
    -- 				['arms']      = 0,
    -- 				['tshirt_1']  = 15,
    -- 				['tshirt_2']  = 0,
    -- 				['torso_1']   = 86,
    -- 				['torso_2']   = 0,
    -- 				['bproof_1']  = 0,
    -- 				['bproof_2']  = 0,
    -- 				['decals_1']  = 0,
    -- 				['decals_2']  = 0,
    -- 				['chain_1']   = 0,
    -- 				['chain_2']   = 0,
    -- 				['pants_1']   = 10,
    -- 				['pants_2']   = 2,
    -- 				['shoes_1']   = 56,
    -- 				['shoes_2']   = 0,
    -- 				['helmet_1']  = 34,
    -- 				['helmet_2']  = 0,
    -- 				['glasses_1'] = 34,
    -- 				['glasses_2'] = 1,
    -- 			},
    -- 			[2] = {
    -- 				['mask_1']    = 0,
    -- 				['mask_2']    = 0,
    -- 				['arms']      = 0,
    -- 				['tshirt_1']  = 15,
    -- 				['tshirt_2']  = 0,
    -- 				['torso_1']   = 86,
    -- 				['torso_2']   = 0,
    -- 				['bproof_1']  = 0,
    -- 				['bproof_2']  = 0,
    -- 				['decals_1']  = 0,
    -- 				['decals_2']  = 0,
    -- 				['chain_1']   = 0,
    -- 				['chain_2']   = 0,
    -- 				['pants_1']   = 10,
    -- 				['pants_2']   = 2,
    -- 				['shoes_1']   = 56,
    -- 				['shoes_2']   = 0,
    -- 				['helmet_1']  = 34,
    -- 				['helmet_2']  = 0,
    -- 				['glasses_1'] = 34,
    -- 				['glasses_2'] = 1,
    -- 			},
    -- 		},
    -- 		female = {
    -- 			[1] = {
    -- 				['mask_1']    = 0,
    -- 				['mask_2']    = 0,
    -- 				['arms']      = 0,
    -- 				['tshirt_1']  = 15,
    -- 				['tshirt_2']  = 0,
    -- 				['torso_1']   = 86,
    -- 				['torso_2']   = 0,
    -- 				['bproof_1']  = 0,
    -- 				['bproof_2']  = 0,
    -- 				['decals_1']  = 0,
    -- 				['decals_2']  = 0,
    -- 				['chain_1']   = 0,
    -- 				['chain_2']   = 0,
    -- 				['pants_1']   = 10,
    -- 				['pants_2']   = 2,
    -- 				['shoes_1']   = 56,
    -- 				['shoes_2']   = 0,
    -- 				['helmet_1']  = 34,
    -- 				['helmet_2']  = 0,
    -- 				['glasses_1'] = 34,
    -- 				['glasses_2'] = 1,
    -- 			},
    -- 		},
    -- 	},
    -- },
}
