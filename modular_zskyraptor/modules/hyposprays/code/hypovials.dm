/obj/item/reagent_containers/cup/vial
	icon = 'modular_zskyraptor/modules/hyposprays/icons/vials.dmi'
	fill_icon = 'modular_zskyraptor/modules/hyposprays/icons/hypospray_fillings.dmi'

/// Bespoke lounge critters' requests
// Hakitchaya
/obj/item/reagent_containers/cup/vial/large/meth
	name = "Meth"
	icon_state = "hypoviallarge"
	list_reagents = list(/datum/reagent/drug/methamphetamine = 40, /datum/reagent/medicine/mannitol = 60)

// Luna/Eclipse
/obj/item/reagent_containers/cup/vial/large/snatchpatch
	name = "Super Snatch Patch"
	icon_state = "hypoviallarge"
	greyscale_colors = "#3366AA"
	list_reagents = list(/datum/reagent/toxin/fakebeer = 100)

/obj/item/reagent_containers/cup/vial/large/sleepytime
	name = "Nap Time"
	icon_state = "hypoviallarge"
	greyscale_colors = "#333333"
	list_reagents = list(/datum/reagent/inverse/healing/tirimol = 100)

// Hugs-the-Moths
/obj/item/reagent_containers/cup/vial/large/nanite_slurry
	name = "Nanite Slurry (Brute/Burn)"
	icon_state = "hypoviallarge-crit"
	list_reagents = list(/datum/reagent/medicine/nanite_slurry = 100)

/obj/item/reagent_containers/cup/vial/large/liquid_solder
	name = "Liquid Solder (Brain)"
	icon_state = "hypoviallarge-buff"
	list_reagents = list(/datum/reagent/medicine/liquid_solder = 100)

/obj/item/reagent_containers/cup/vial/large/system_cleaner
	name = "System Cleaner (Toxin)"
	icon_state = "hypoviallarge-tox"
	list_reagents = list(/datum/reagent/medicine/system_cleaner = 100)

// The Herbalist
/obj/item/reagent_containers/cup/vial/large/caramel
	name = "Caramel"
	icon_state = "hypoviallarge-buff"
	list_reagents = list(/datum/reagent/consumable/caramel = 100)



/// GAGS happy funtime zone
/datum/greyscale_config/hypovial
	name = "Hypovial"
	icon_file = 'modular_zskyraptor/modules/hyposprays/icons/vials.dmi'
	json_config = 'modular_zskyraptor/modules/hyposprays/greyscale/hypovial.json'
