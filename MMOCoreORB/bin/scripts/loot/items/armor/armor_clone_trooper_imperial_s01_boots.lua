armor_clone_trooper_imperial_s01_boots = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Katarn Armor Boots",
	directObjectTemplate = "object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_boots.iff",
	craftingValues = {
		{"armor_rating",1,1,0},
    {"armor_effectiveness",70,70,70},
    {"armor_integrity",30000, 55000,0},
    {"armor_health_encumbrance",0,0,0},
    {"armor_action_encumbrance",0,0,0},
    {"armor_mind_encumbrance",0,0,0},
	},
	skillMods = {

	},
	

	junkDealerTypeNeeded = JUNKARMOUR,
	junkMinValue = 55,
	junkMaxValue = 110
}

addLootItemTemplate("armor_clone_trooper_imperial_s01_boots", armor_clone_trooper_imperial_s01_boots)
