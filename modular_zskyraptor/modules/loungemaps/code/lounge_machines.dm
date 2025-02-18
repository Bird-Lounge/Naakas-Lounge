/obj/item/storage/part_replacer/bluespace/tier4/bst/biodome_upgrader/PopulateContents()
	for(var/i in 1 to 50)
		new /obj/item/stock_parts/scanning_module/triphasic(src)
		new /obj/item/reagent_containers/cup/beaker/bluespace(src)
	for(var/i in 1 to 150)
		new /obj/item/stock_parts/capacitor/quadratic(src)
		new /obj/item/stock_parts/servo/femto(src)
		new /obj/item/stock_parts/micro_laser/quadultra(src)
		new /obj/item/stock_parts/matter_bin/bluespace(src)
		new /obj/item/stock_parts/power_store/cell/bluespace(src)

/obj/effect/landmark/start/lounge_upgrade_machine
	name = "lounge upgrade thing sorry SSticker"
	icon = 'modular_zskyraptor/modules/loungemaps/icons/areas.dmi'
	icon_state = "biohome breaker"
	var/obj/item/storage/part_replacer/bluespace/tier4/bst/biodome_upgrader/upgrade_gubbin

/obj/effect/landmark/start/lounge_upgrade_machine/Initialize(mapload)
	. = ..()
	upgrade_gubbin = new(src)

/obj/effect/landmark/start/lounge_upgrade_machine/after_round_start()
	for(var/obj/machinery/machine in SSmachines.get_all_machines())
		if(machine.z == z)
			machine.exchange_parts(null, upgrade_gubbin)
	. = ..()
