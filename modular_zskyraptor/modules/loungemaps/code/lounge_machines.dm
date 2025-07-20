/obj/item/storage/part_replacer/bluespace/tier4/bst/biodome_upgrader
	storage_type = /datum/storage/rped/bluespace/silly/sillier

/obj/item/storage/part_replacer/bluespace/tier4/bst/biodome_upgrader/PopulateContents()
	for(var/i in 1 to 100)
		new /obj/item/stock_parts/scanning_module/triphasic(src)
		new /obj/item/reagent_containers/cup/beaker/bluespace(src)
	for(var/i in 1 to 400)
		new /obj/item/stock_parts/capacitor/quadratic(src)
		new /obj/item/stock_parts/servo/femto(src)
		new /obj/item/stock_parts/micro_laser/quadultra(src)
		new /obj/item/stock_parts/matter_bin/bluespace(src)
		new /obj/item/stock_parts/power_store/cell/bluespace(src)

/datum/storage/rped/bluespace/silly/sillier
	max_slots = 5000
	max_total_storage = 30000

/obj/effect/landmark/start/lounge_upgrade_machine
	name = "lounge upgrade thing sorry SSticker"
	icon = 'modular_zskyraptor/modules/loungemaps/icons/areas.dmi'
	icon_state = "biohome breaker"
	var/obj/item/storage/part_replacer/bluespace/tier4/bst/biodome_upgrader/upgrade_gubbin
	var/obj/item/multitool/grab_that_silo
	var/mob/temp_mob

/obj/effect/landmark/start/lounge_upgrade_machine/Initialize(mapload)
	. = ..()
	upgrade_gubbin = new(src)
	grab_that_silo = new(src)
	temp_mob = new(src)

/obj/effect/landmark/start/lounge_upgrade_machine/after_round_start()
	for(var/obj/something in loc.contents)
		var/obj/machinery/ore_silo/a_silo = something
		if(istype(a_silo))
			grab_that_silo.set_buffer(a_silo)
	for(var/obj/machinery/machine in SSmachines.get_all_machines())
		if(machine.z == z)
			machine.exchange_parts(null, upgrade_gubbin)
			var/datum/component/remote_materials/mats = machine.GetComponent(/datum/component/remote_materials)
			if(istype(mats))
				mats.OnMultitool(null, temp_mob, grab_that_silo)
	. = ..()
