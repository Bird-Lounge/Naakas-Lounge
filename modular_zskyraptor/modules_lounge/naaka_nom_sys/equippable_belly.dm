/obj/item/clothing/sextoy/belly_function
	name = "bwelly"
	desc = "Gobble friends, stuff yourself, be big and round, get the devs cancelled on Twitter for the item supporting endosoma only. Equip with Ctrl-Shift-Click on your Nipples slot for display of stuffedness, or click a friend with this to nom them beforehand.  Drop on the floor, use in-hand, or unequip from the Interact menu to free a nommed friend."
	icon_state = "bwelly"
	base_icon_state = "belly"
	icon = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/items.dmi'
	worn_icon_state = "haha-no" //wish us luck
	worn_icon = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/bellies.dmi'
	var/icon/worn_icon_64x = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/bellies_64x.dmi'
	worn_icon_teshari = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/bellies_teshari.dmi'
	var/icon/worn_icon_teshari_64x = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/bellies_teshari_64x.dmi'
	w_class = WEIGHT_CLASS_TINY
	lewd_slot_flags = LEWD_SLOT_NIPPLES
	color = "#b1f91f"

	actions_types = list(
		/datum/action/item_action/belly_menu/access,
	)
	var/obj/item/belly_nom_helper/nommer = null

	var/list/mob/living/carbon/human/lastuser = null

	/// Tracks whoever got gobbled.
	/*var/mob/living/carbon/human/nommed
	var/nommed_size = 0
	var/mob/living/carbon/human/nommed_2
	var/nommed_size_2 = 0*/
	var/list/mob/living/carbon/human/nommeds = list()
	var/list/nommed_sizes = list()
	var/list/nommed_gasmixes = list()
	var/list/escape_helpers = list()
	var/total_endo_size = 0

	/// Base-size for calculating fullness/size with one occupant.
	var/endo_size = 1000
	/// Size modifier applied to ALL belly size providers.  Good for making a 3ft teshi round out faster than a 12ft oversized shork.
	var/sizemod = 1
	var/sizemod_audio = 1
	/// Baseline sizes that apply purely-cosmetic bellysize (e.g, preg/egg), a baseline endosoma size (causes creaks and such), and a baseline actively-gwurgly size for being stuffed without actually being stuffed.
	var/base_size_cosmetic = 0
	var/base_size_endo = 0
	var/base_size_stuffed = 0

	/// Sound cooldowns.
	var/full_cooldown = 6
	var/stuffLo_cooldown = 3
	var/stuffHi_cooldown = 9
	var/moveCreak_cooldown = 6
	var/moveSlosh_cooldown = 6

	var/total_fullness = 0
	var/stuffed_temp = 0

	/// Used to avoid spamming sprite icon state changes.
	var/last_size = 0
	var/current_size_unclamped = 0
	var/last_gasmix = ""
	var/mutable_appearance/overlay_south
	var/mutable_appearance/overlay_north
	var/mutable_appearance/overlay_hori

	/// Sound lists setup as local vars because we aren't spawning enough of these for memory to be a worry & this makes it easier to fix broken sound lists during gameplay
	// Used for full creaks and similar
	var/full_sounds = list("modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (36).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (47).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/Gurgle6.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/Gurgle8.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/Gurgle14.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (8).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (9).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (13).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (15).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (18).ogg")
	// Low-level stuffed digestion noises
	var/stuff_minor = list("modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (25).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (26).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (28).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (29).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (31).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (33).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (34).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (37).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (48).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle1.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle2.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle3.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle9.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle10.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle11.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle12.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle13.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle15.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle16.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/stomach-burble.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (3).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (11).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (17).ogg")
	// Noisier gurgles and churns for being very stuffed
	var/stuff_major = list("modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_10.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_12.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_17.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/Gurgle4.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/Gurgle5.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/Gurgle7.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_02.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_04.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_05.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/digest (46).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/growl1.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/growl2.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/stomach-clench.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/digest (5).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/digest (12).ogg")
	// Movement noise for a full but not sloshy tummy
	var/move_creaks = list("modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/digest (5).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/digest (12).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/digest (46).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/growl1.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/growl2.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Growls/stomach-clench.ogg")
	// Movement noise for an overfull, stuffed tummy
	var/slosh_sounds = list("modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/SloshMinor/digest (20)", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/SloshMinor/slurslosh", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/SloshMajor/blorbsquish", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/SloshMajor/walkslosh3", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/SloshMajor/walkslosh4", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/SloshMajor/walkslosh7")

	/// Live editable layers in case things go scrungy.
	var/hori_layer = UNIFORM_LAYER
	var/south_layer = UNIFORM_LAYER
	var/north_layer = BODY_BEHIND_LAYER

/obj/item/clothing/sextoy/belly_function/New(Target)
	. = ..()
	nommer = new /obj/item/belly_nom_helper(src)
	nommer.color = color

/obj/item/clothing/sextoy/belly_function/proc/on_step()
	SIGNAL_HANDLER
	if(total_fullness >= 0.3)
		moveCreak_cooldown = moveCreak_cooldown - (3 * total_fullness)
	if(stuffed_temp >= 0.3)
		moveSlosh_cooldown = moveSlosh_cooldown - (3 * (stuffed_temp + (total_fullness/10)))

/obj/item/clothing/sextoy/belly_function/examine(mob/user)
	. = ..()
	. += "Current size: [current_size_unclamped]"
	for(var/mob/living/carbon/human/nommed in nommeds)
		. += "Nommed: [nommed]"
	/*if(istype(nommed))
		. += "Current nommed guest: [nommed]"
	else
		. += "No nommed guest."*/

/obj/item/clothing/sextoy/belly_function/attack_self(mob/user)
	. = ..()
	//TODO: relase code
	if(length(nommeds) > 0)
		var/opt_list = list()

		for(var/mob/living/carbon/human/nommed in nommeds)
			opt_list["Release [nommed.name]"] = nommed

		var/release_target = tgui_input_list(user, "Release ", "Belly Control", opt_list)
		if(release_target)
			var/mob/living/carbon/human/nommed = opt_list[release_target]
			if(istype(nommed))
				src.free_target(nommed)

/obj/item/clothing/sextoy/belly_function/proc/free_target(mob/living/carbon/human/nommed)
	nommed.forceMove(drop_location())
	nommeds -= nommed
	nommed_sizes -= nommed
	nommed_gasmixes -= nommed
	escape_helpers[nommed].Remove(nommed)
	escape_helpers -= nommed
	recalculate_guest_sizes()

/obj/item/clothing/sextoy/belly_function/click_alt(mob/living/user)
	src.config_menu(user)

/obj/item/clothing/sextoy/belly_function/proc/config_menu(mob/living/user)
	var/opt_list = list("Change Color", "Set Size Modifier", "Set Baseline Cosmetic Size", "Set Baseline Endo Size", "Set Baseline Stuffed Size", "Set Eaten Guest Size")
	var/extra_size_list = list()

	for(var/mob/living/carbon/human/nommed in nommeds)
		extra_size_list["Set Size of [nommed.name]"] = nommed

	for(var/text in extra_size_list)
		opt_list += text

	var/adjustment_mode = tgui_input_list(user, "Select ", "Belly Control", opt_list)
	if(adjustment_mode)
		if(adjustment_mode == "Change Color")
			var/temp_col = input("Enter new color:", "Color", src.color) as color|null
			if(temp_col != null || QDELETED(user) || QDELETED(src))
				src.color = temp_col
			nommer.color = color
		else if(adjustment_mode == "Set Size Modifier")
			var/temp_size = tgui_input_number(user, "Set a size divider (0.0-100.0) - all size sources are divided by this.", "Sizemod")
			if(isnull(temp_size) || QDELETED(user) || QDELETED(src))
				return
			sizemod = temp_size
		else if(adjustment_mode == "Set Baseline Cosmetic Size")
			var/temp_size = tgui_input_number(user, "What purely cosmetic baseline belly size do you want?", "Base Size")
			if(isnull(temp_size) || QDELETED(user) || QDELETED(src))
				return
			base_size_cosmetic = temp_size
		else if(adjustment_mode == "Set Baseline Endo Size")
			var/temp_size = tgui_input_number(user, "What gently-noisy, cosmetic endosoma-induced belly size do you want?", "Base Endo Size")
			if(isnull(temp_size) || QDELETED(user) || QDELETED(src))
				return
			base_size_endo = temp_size
		else if(adjustment_mode == "Set Baseline Stuffed Size")
			var/temp_size = tgui_input_number(user, "What gurgly, cosmetic stuffing-induced belly size do you want?", "Base Stuffed Size")
			if(isnull(temp_size) || QDELETED(user) || QDELETED(src))
				return
			base_size_stuffed = temp_size
		else if(adjustment_mode == "Set Eaten Guest Size")
			var/temp_size = tgui_input_number(user, "What size do you want your eaten bellyguests to be?  (0.0-infinity, 1000 is typically same-sizeish)", "Endo Size")
			if(isnull(temp_size) || QDELETED(user) || QDELETED(src))
				return
			endo_size = temp_size
		else if(adjustment_mode in extra_size_list)
			var/temp_size = tgui_input_number(user, "What size do you want [extra_size_list[adjustment_mode].name] to be?  (0.0-infinity, 1000 is typically same-sizeish)", "Endo Size")
			if(isnull(temp_size) || QDELETED(user) || QDELETED(src))
				return
			nommed_sizes[extra_size_list[adjustment_mode]] = temp_size
			recalculate_guest_sizes()

/obj/item/clothing/sextoy/belly_function/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(!istype(user))
		return
	if(lastuser != user && overlay_south != null && lastuser != null)
		lastuser.cut_overlay(overlay_south)
		lastuser.cut_overlay(overlay_north)
		lastuser.cut_overlay(overlay_hori)
		UnregisterSignal(lastuser, COMSIG_GENERAL_STEP_ACTION)
	lastuser = user
	RegisterSignal(lastuser, COMSIG_GENERAL_STEP_ACTION, PROC_REF(on_step))
	START_PROCESSING(SSobj, src)

/obj/item/clothing/sextoy/belly_function/dropped(mob/user, slot)
	. = ..()
	if(overlay_south != null) //remove overlays if needed
		user.cut_overlay(overlay_south)
		user.cut_overlay(overlay_north)
		user.cut_overlay(overlay_hori)
	if(loc != user)
		/*if(istype(nommed))
			nommed.forceMove(drop_location())
			nommed = null*/
		STOP_PROCESSING(SSobj, src)
		lastuser = null

/obj/item/clothing/sextoy/belly_function/proc/refresh_overlays(mob/living/carbon/human/user, var/icon_state_wew, var/inbound_size)
	// cut out-of-date overlays
	if(overlay_south != null)
		user.cut_overlay(overlay_south)
		user.cut_overlay(overlay_north)
		user.cut_overlay(overlay_hori)

	// setup working variables
	var/oldstate = worn_icon_state
	var/iconfile = inbound_size > 10 ? worn_icon_64x : worn_icon
	if(user.dna.species.id == SPECIES_TESHARI)
		iconfile = inbound_size > 10 ? worn_icon_teshari_64x : worn_icon_teshari

	// generate the appearances
	worn_icon_state = "[icon_state_wew]_HORI"
	overlay_hori = src.build_worn_icon(default_layer = hori_layer, default_icon_file = iconfile, isinhands = FALSE, override_file = iconfile)
	worn_icon_state = "[icon_state_wew]_FRONT"
	overlay_south = src.build_worn_icon(default_layer = south_layer, default_icon_file = iconfile, isinhands = FALSE, override_file = iconfile)
	worn_icon_state = "[icon_state_wew]_BACK"
	overlay_north = src.build_worn_icon(default_layer = north_layer, default_icon_file = iconfile, isinhands = FALSE, override_file = iconfile)
	worn_icon_state = oldstate

	if(inbound_size > 10)
		overlay_hori.pixel_x -= 16
		overlay_hori.pixel_y -= 16
		overlay_south.pixel_x -= 16
		overlay_south.pixel_y -= 16
		overlay_north.pixel_x -= 16
		overlay_north.pixel_y -= 16

	if(user.dna.species.id == SPECIES_TESHARI)
		overlay_hori.pixel_y -= 3
		overlay_south.pixel_y -= 3
		overlay_north.pixel_y -= 3

	// add the overlays
	user.add_overlay(overlay_south)
	user.add_overlay(overlay_north)
	user.add_overlay(overlay_hori)

/obj/item/clothing/sextoy/belly_function/proc/recalculate_guest_sizes()
	total_endo_size = 0
	for(var/nommed_friendo in nommeds)
		total_endo_size += nommed_sizes[nommed_friendo]

/obj/item/clothing/sextoy/belly_function/process(seconds_per_tick)
	//to_chat(world, "screem - process is running")
	var/mob/living/carbon/human/user = loc
	if(!istype(user))
		user = lastuser
	if(!istype(user))
		return

	// TODO: calculate fullness on the fly
	// formula should be pow(pow(food_units, 1.5) / (4/3) / PI, 1/3)
	// endo size should PROLLY be changed to be in food_units rather than overall size to avoid complications

	//var/guest_temp = istype(nommed) ? (endo_size + base_size_endo) : base_size_endo

	var/guest_temp = base_size_endo + total_endo_size

	var/stuffed_temp_orig = (user.get_fullness() - (user.nutrition * 0.6) - 500) //nutrition 6500 == maximum fullness
	if(stuffed_temp_orig < 0)
		stuffed_temp_orig = 0
	stuffed_temp_orig += base_size_stuffed
	var/total_fullness_orig = guest_temp + stuffed_temp_orig //maximum creaks from overfilled belly
	var/total_size_orig = total_fullness_orig + base_size_cosmetic
	var/total_size = total_size_orig / 10 / sizemod
	total_fullness = total_fullness_orig / 10 / sizemod
	stuffed_temp = stuffed_temp_orig / 10 / sizemod

	total_size = (((total_size)**1.5) / (4/3) / PI)**(1/3)
	total_fullness = (((total_fullness)**1.5) / (4/3) / PI)**(1/3)
	stuffed_temp = (((stuffed_temp)**1.5) / (4/3) / PI)**(1/3)

	current_size_unclamped = total_size

	var/spr_size = FLOOR(total_size, 1)
	if(spr_size > 16)
		spr_size = 16
	if(spr_size < 0)
		spr_size = 0

	// clamps these to previous scales for noise, more or less
	total_fullness = (total_fullness/3) + (total_fullness_orig / 1000)
	stuffed_temp = (stuffed_temp/3) + (stuffed_temp_orig / 1000)

	//if(spr_size != last_size)
	last_size = spr_size
	update_icon_state()
	update_icon()
	refresh_overlays(user, "[base_icon_state]-[spr_size]", spr_size)

	if(total_fullness >= 0.2)
		full_cooldown = full_cooldown - (seconds_per_tick * total_fullness)
		if(full_cooldown < 0)
			full_cooldown = rand(6, 36)
			playsound_if_pref(user, pick(full_sounds), min(10 + round(total_fullness/40, 1), 30), TRUE, frequency=rand(40000, 50000))
	if(stuffed_temp >= 0.2)
		stuffLo_cooldown = stuffLo_cooldown - (seconds_per_tick * (stuffed_temp + (total_fullness/5)))
		if(stuffLo_cooldown < 0)
			stuffLo_cooldown = rand(3, 6)
			playsound_if_pref(user, pick(stuff_minor), min(12 + round(total_fullness/40, 1), 30), TRUE, frequency=rand(40000, 50000))
	if(stuffed_temp >= 0.4)
		stuffHi_cooldown = stuffHi_cooldown - (seconds_per_tick * (stuffed_temp + (total_fullness/10)))
		if(stuffHi_cooldown < 0)
			stuffHi_cooldown = rand(9, 60)
			playsound_if_pref(user, pick(stuff_major), min(20 + round(total_fullness/32, 1), 50), TRUE, frequency=rand(40000, 50000))
	if(moveCreak_cooldown < 0)
		moveCreak_cooldown = rand(3, 6)
		playsound_if_pref(user, pick(move_creaks), min(10 + round(total_fullness/40, 1), 30), TRUE, frequency=rand(40000, 50000))
	if(moveSlosh_cooldown < 0)
		moveSlosh_cooldown = rand(9, 30)
		playsound_if_pref(user, pick(slosh_sounds), min(20 + round(total_fullness/32, 1), 50), TRUE, frequency=rand(40000, 50000))

/obj/item/clothing/sextoy/belly_function/attack(mob/living/carbon/human/target, mob/living/carbon/human/user)
	. = ..()
	if(!ishuman(target) || (target.stat == DEAD) || !ishuman(user) || user == target) //sanity check
		return

	target.visible_message("[user] gulps down [target]!")
	//nommed = target
	nommeds += target
	nommed_sizes[target] = endo_size

	//user.visible_message("Debugging: [user] nomming [target] with [src].")

	var/obj/item/organ/lungs/hopefully_lungs = target.organs_slot["lungs"]
	if(hopefully_lungs)
		//user.visible_message("Debugging: [target]'s lungs were found; they are [hopefully_lungs]")
		last_gasmix = ""
		for(var/something_in_list in hopefully_lungs.breathe_always)
			var/datum/gas/a_gas = new something_in_list()
			if(istype(a_gas))
				//user.visible_message("Debugging: [target]'s lungs have the following breath gas [a_gas]")
				last_gasmix = "[last_gasmix][a_gas.id]=100;"
			else
				//user.visible_message("Debugging: [target]'s lungs breath list was malformed, got [something_in_list] when querying for gas datums")
		last_gasmix = "[last_gasmix]TEMP=293.15"
	else
		last_gasmix = "o2=5;n2=10;TEMP=293.15"

	nommed_gasmixes[target] = last_gasmix

	SEND_SIGNAL(user, COMSIG_MACHINERY_SET_OCCUPANT, target)
	target.forceMove(src)
	escape_helpers[target] = new /datum/action/item_action/belly_menu/escape(src)
	escape_helpers[target].Grant(target)
	recalculate_guest_sizes()

/obj/item/clothing/sextoy/belly_function/handle_internal_lifeform(mob/lifeform_inside_me, breath_request)
	if(lifeform_inside_me in nommed_gasmixes)
		//to_chat(world, "Debugging: [lifeform_inside_me] is inside [src]")
		if(breath_request <= 0)
			//to_chat(world, "Debugging: [lifeform_inside_me] didn't request breath")
			return null
		//to_chat(world, "Debugging: breath was requested, parsing gas string [last_gasmix]")
		var/datum/gas_mixture/mm_life = SSair.parse_gas_string(nommed_gasmixes[lifeform_inside_me])
		//to_chat(world, "Debugging: generated [mm_life] from gasmix string")
		var/breath_percentage = breath_request / mm_life.volume
		//to_chat(world, "Debugging: breath percentage will be [breath_percentage]")
		var/removed = mm_life.remove(mm_life.total_moles() * breath_percentage)
		//to_chat(world, "Debugging: removed [removed] from breathmix")
		return removed
	else
		return ..()
