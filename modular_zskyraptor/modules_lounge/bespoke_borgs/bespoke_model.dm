/obj/item/borg/upgrade/transform/nova_firstresponder
	name = "borg model picker (First Responder)"
	desc = "For when you need balance out the window and want a borgo to kick all of the ass.  Emag them for security gear."
	icon_state = "cyborg_upgrade3"
	new_model = /obj/item/robot_model/nova_firstresponder

// an admittedly-unbalanced robot model that gives you more or less everything, at the cost of being unable to accept upgrades.
/obj/item/robot_model/nova_firstresponder
	name = "First Responder"
	basic_modules = list(
		//core stuff - flash for defense, mesons for seeing, harmalarm to alert crew, synth for fun, and a lollipop dispenser to pwn newbs with
		/obj/item/assembly/flash/cyborg,
		/obj/item/borg/sight/meson,
		/obj/item/harmalarm,
		/obj/item/instrument/piano_synth,
		/obj/item/borg/lollipop,
		//medical supplies
		/obj/item/healthanalyzer/advanced,
		/obj/item/reagent_containers/borghypo/medical,
		/obj/item/shockpaddles/cyborg,
		/obj/item/surgical_drapes,
		/obj/item/borg/apparatus/organ_storage,
		/obj/item/scalpel/advanced,
		/obj/item/retractor/advanced,
		/obj/item/cautery/advanced,
		/obj/item/bonesetter,
		/obj/item/blood_filter,
		/obj/item/emergency_bed/silicon,
		/obj/item/stack/medical/gauze,
		/obj/item/stack/medical/bone_gel,
		/obj/item/borg/apparatus/beaker,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/syringe,
		// engineering supplies
		/obj/item/holosign_creator/atmos,
		/obj/item/multitool/cyborg,
		/obj/item/screwdriver/cyborg/power,
		/obj/item/crowbar/cyborg/power,
		/obj/item/weldingtool/largetank/cyborg,
		/obj/item/stack/cable_coil,
		/obj/item/stack/tile/iron/base/cyborg,
		/obj/item/stack/sheet/iron,
		/obj/item/stack/rods/cyborg,
		/obj/item/stack/sheet/glass,
		/obj/item/storage/part_replacer/bluespace,
		/obj/item/borg/apparatus/sheet_manipulator,
		/obj/item/borg/apparatus/circuit/,
		/obj/item/electroadaptive_pseudocircuit,
		/obj/item/lightreplacer/cyborg,
		/obj/item/construction/rcd/borg,
		/obj/item/pipe_dispenser,
		// rag, mop and bucket for cleaning a dirty station
		/obj/item/rag,
		/obj/item/mop/cyborg,
		/obj/item/reagent_containers/cup/bucket,
		// orebag and kinetic accelerator, so you can clear a path
		/obj/item/storage/bag/ore/cyborg,
		/obj/item/gun/energy/recharge/kinetic_accelerator/cyborg,
		/obj/item/gps/cyborg,
		/obj/item/stack/marker_beacon,
		// cooking tools for when there's NO FUCKING CREW TO COOK FOR YOU
		/obj/item/rsf,
		/obj/item/cooking/cyborg/power,
		/obj/item/reagent_containers/borghypo/borgshaker,
		/obj/item/reagent_containers/borghypo/borgshaker/specific/juice,
		/obj/item/reagent_containers/borghypo/borgshaker/specific/soda,
		/obj/item/reagent_containers/borghypo/borgshaker/specific/alcohol,
		/obj/item/reagent_containers/borghypo/borgshaker/specific/misc,
	)
	emag_modules = list(
		/obj/item/reagent_containers/borghypo/medical/hacked,
		/obj/item/reagent_containers/borghypo/borgshaker/hacked,
		/obj/item/melee/baton/security/loaded,
		/obj/item/gun/energy/laser/cyborg,
	)
	cyborg_base_icon = "medical"
	model_select_icon = "medical"
	model_traits = list(TRAIT_PUSHIMMUNE)
	hat_offset = 3
	radio_channels = list(RADIO_CHANNEL_COMMON, RADIO_CHANNEL_MEDICAL, RADIO_CHANNEL_ENGINEERING, RADIO_CHANNEL_COMMAND, RADIO_CHANNEL_CENTCOM)
	borg_skins = list(
		// raptor borgs
		"Mescalero" = list(SKIN_ICON_STATE = "raptor_asko", SKIN_ICON = CYBORG_ICON_RAPTOR, SKIN_FEATURES = list(TRAIT_R_WIDE, TRAIT_R_TALL), SKIN_HAT_OFFSET = 22),
		"AlaRaptor" = list(SKIN_ICON_STATE = "raptor_alara", SKIN_ICON = CYBORG_ICON_RAPTOR, SKIN_FEATURES = list(TRAIT_R_WIDE, TRAIT_R_TALL), SKIN_HAT_OFFSET = 22),
		"KO-6" = list(SKIN_ICON_STATE = "raptor_naaka", SKIN_ICON = CYBORG_ICON_RAPTOR, SKIN_FEATURES = list(TRAIT_R_WIDE, TRAIT_R_TALL), SKIN_HAT_OFFSET = 22),
	)

/obj/item/robot_model/nova_firstresponder/be_transformed_to(obj/item/robot_model/old_model, forced = FALSE)
	. = ..()
	// we're good to run transformation effects
	var/mob/living/silicon/robot/R = loc
	if(istype(R))
		// upgrade the hypo by default
		for(var/obj/item/reagent_containers/borghypo/medical/H in R.model.modules)
			H.upgrade_hypo()
		// add a surgical processor
		var/obj/item/surgical_processor/SP = new(R.model)
		R.model.basic_modules += SP
		R.model.add_module(SP, FALSE, TRUE)
		// add a crew monitor and pinpointer
		var/obj/item/pinpointer/crew/PP = locate() in R.model
		PP = new(R.model)
		R.model.basic_modules += PP
		R.model.add_module(PP, FALSE, TRUE)
		var/datum/action/item_action/crew_monitor/crew_monitor = new /datum/action/item_action/crew_monitor(src)
		crew_monitor.Grant(R)

/obj/item/robot_model/nova_firstresponder/respawn_consumable(mob/living/silicon/robot/cyborg, coeff = 1)
	..()
	var/obj/item/gun/energy/e_gun/advtaser/cyborg/taser = locate(/obj/item/gun/energy/e_gun/advtaser/cyborg) in basic_modules
	if(taser)
		if(taser.cell.charge < taser.cell.maxcharge)
			var/obj/item/ammo_casing/energy/shot = taser.ammo_type[taser.select]
			taser.cell.give(shot.e_cost * coeff)
			taser.update_appearance()
		else
			taser.charge_timer = 0
