/// This is some extremely scrimbly code.  First-off, item quirk.

/datum/quirk/item_quirk/stuffable
	name = "True Glutton"
	desc = "Voracious alt ft. BWELLY ITEM.  Alt-click it in-hand to change the color to match your sprite, then equip or use for nommage as the description says."
	icon = FA_ICON_DRUMSTICK_BITE
	value = 0
	mob_trait = TRAIT_VORACIOUS
	gain_text = span_notice("You feel like you could eat a horse!")
	lose_text = span_danger("Food suddenly feels a lot less appealing.")
	medical_record_text = "Patient's midriff and stomach are unusually stretchy."

/datum/quirk/item_quirk/stuffable/add_unique(client/client_source)
	give_item_to_holder(/obj/item/clothing/sextoy/belly_function, list(LOCATION_BACKPACK = ITEM_SLOT_BACKPACK, LOCATION_HANDS = ITEM_SLOT_HANDS))



/// Next-off, the actual item, setup as a nipple-slot sextoy for Skyrat code.  I'm so sorry.

/obj/item/clothing/sextoy/belly_function
	name = "bwelly"
	desc = "Gobble friends, stuff yourself, be big and round, get cancelled on Twitter for endosoma only.  Equip with Ctrl-Shift-Click on your Nipples slot for display of stuffedness, or click a friend with this to nom them beforehand.  Drop on the floor or unequip from the Interact menu to free a nommed friend."
	icon_state = "bwelly"
	icon = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/items.dmi'
	worn_icon_state = "Belly0"
	worn_icon = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/bellies.dmi'
	worn_icon_teshari = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/bellies_teshari.dmi'
	w_class = WEIGHT_CLASS_TINY
	lewd_slot_flags = LEWD_SLOT_NIPPLES
	color = "#b1f91f"
	
	/// Tracks whoever got gobbled.
	var/mob/living/carbon/human/nommed
	
	/// Base-size for calculating fullness/size with one occupant.
	var/endo_size = 1.0
	
	/// Sound cooldowns.
	var/full_cooldown = 6
	var/stuffLo_cooldown = 3
	var/stuffHi_cooldown = 9
	
	/// Used to avoid spamming sprite icon state changes.
	var/last_size = 0
	var/last_gasmix = ""
	
	/// Sound lists setup as local vars because we aren't spawning enough of these for memory to be a worry & this makes it easier to fix broken sound lists during gameplay
	var/full_sounds = list("modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (36).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (47).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/Gurgle6.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/Gurgle8.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/Gurgle14.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (8).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (9).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (13).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (15).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/Fullness/digest (18).ogg")
	var/stuff_minor = list("modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (25).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (26).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (28).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (29).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (31).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (33).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (34).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (37).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (48).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle1.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle2.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle3.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle9.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle10.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle11.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle12.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle13.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle15.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/Gurgle16.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/stomach-burble.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (3).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (11).ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMinor/digest (17).ogg")
	var/stuff_major = list("modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_10.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_12.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_17.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/Gurgle4.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/Gurgle5.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/Gurgle7.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_02.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_04.ogg", "modular_zskyraptor/modules_lounge/naaka_nom_sys/sounds/StuffMajor/digest_05.ogg")

/obj/item/clothing/sextoy/belly_function/AltClick(mob/living/user)
	/// Alt-click to set color.
	var/temp_col = input("Enter new color:", "Color", src.color) as color|null
	if(temp_col != null)
		src.color = temp_col

/obj/item/clothing/sextoy/belly_function/CtrlClick(mob/living/user)
	var/temp_size = tgui_input_number(user, "What size do you want bellyguests to be?  (0.0-1.0)", "Endo SIze", max_value = 1.0)
	if(isnull(temp_size) || QDELETED(user) || QDELETED(src))
		return
	endo_size = temp_size

/obj/item/clothing/sextoy/belly_function/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(!istype(user))
		return
	START_PROCESSING(SSobj, src)

/obj/item/clothing/sextoy/belly_function/dropped(mob/user, slot)
	. = ..()
	if(loc != user)
		if(istype(nommed))
			nommed.forceMove(drop_location())
			nommed = null
		STOP_PROCESSING(SSobj, src)

/obj/item/clothing/sextoy/belly_function/process(seconds_per_tick)
	//to_chat(world, "screem - process is running")
	var/mob/living/carbon/human/user = loc
	if(!istype(user))
		return
	
	var/guest_temp = istype(nommed) ? endo_size : 0
	var/stuffed_temp = (user.get_fullness() - (user.nutrition * 0.9)) / 800 //800u == more or less @ same-size endo
	if(stuffed_temp < 0)
		stuffed_temp = 0
	var/total_fullness = guest_temp + stuffed_temp //maximum creaks from overfilled belly
	var/spr_size = 0
	if(total_fullness >= 1)
		spr_size = 3
	else if(total_fullness >= 0.66)
		spr_size = 2
	else if(total_fullness >= 0.33)
		spr_size = 1
	else
		spr_size = 0
	if(spr_size != last_size)
		last_size = spr_size
		worn_icon_state = "Belly[spr_size]"
		update_icon_state()
		update_icon()
		user.update_inv_nipples()
	
	if(total_fullness >= 0.3)
		full_cooldown = full_cooldown - (seconds_per_tick * total_fullness)
		if(full_cooldown < 0)
			full_cooldown = rand(6, 36)
			play_lewd_sound(user, pick(full_sounds), 10 + round(total_fullness/80, 1), TRUE)
	if(stuffed_temp >= 0.2)
		stuffLo_cooldown = stuffLo_cooldown - (seconds_per_tick * (stuffed_temp + (total_fullness/5)))
		if(stuffLo_cooldown < 0)
			stuffLo_cooldown = rand(3, 6)
			play_lewd_sound(user, pick(stuff_minor), 10 + round(total_fullness/80, 1), TRUE)
	if(stuffed_temp >= 0.5)
		stuffHi_cooldown = stuffHi_cooldown - (seconds_per_tick * (stuffed_temp + (total_fullness/10)))
		if(stuffHi_cooldown < 0)
			stuffHi_cooldown = rand(9, 60)
			play_lewd_sound(user, pick(stuff_major), 20 + round(total_fullness/50, 1), TRUE)
	
/obj/item/clothing/sextoy/belly_function/attack(mob/living/carbon/human/target, mob/living/carbon/human/user)
	. = ..()
	if(!ishuman(target) || (target.stat == DEAD) || !ishuman(user) || ishuman(nommed) || user == target) //sanity check
		return
	
	target.visible_message("[user] gulps down [target]!")
	nommed = target
	
	user.visible_message("Debugging: [user] nomming [target] with [src].")
	
	var/obj/item/organ/internal/lungs/hopefully_lungs = target.organs_slot["lungs"]
	if(hopefully_lungs)
		user.visible_message("Debugging: [target]'s lungs were found; they are [hopefully_lungs]")
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
	
	SEND_SIGNAL(user, COMSIG_MACHINERY_SET_OCCUPANT, target)
	target.forceMove(src)

/obj/item/clothing/sextoy/belly_function/handle_internal_lifeform(mob/lifeform_inside_me, breath_request)
	//to_chat(world, "Debugging: [lifeform_inside_me] is inside [src]")
	if(breath_request <= 0)
		//to_chat(world, "Debugging: [lifeform_inside_me] didn't request breath")
		return null
	//to_chat(world, "Debugging: breath was requested, parsing gas string [last_gasmix]")
	var/datum/gas_mixture/mm_life = SSair.parse_gas_string(last_gasmix)
	//to_chat(world, "Debugging: generated [mm_life] from gasmix string")
	var/breath_percentage = breath_request / mm_life.volume
	//to_chat(world, "Debugging: breath percentage will be [breath_percentage]")
	var/removed = mm_life.remove(mm_life.total_moles() * breath_percentage)
	//to_chat(world, "Debugging: removed [removed] from breathmix")
	return removed