/datum/action/item_action/belly_menu
	name = "Belly Action Core"
	desc = "You shouldn't see this!  Yell at CliffracerX!"
	button_icon = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/items.dmi'
	button_icon_state = "bwelly"
	var/obj/item/clothing/sextoy/belly_function/my_belly

/datum/action/item_action/belly_menu/New(Target)
	. = ..()
	if(!istype(Target, /obj/item/clothing/sextoy/belly_function))
		qdel(src)
		return
	else
		my_belly = Target



/datum/action/item_action/belly_menu/access
	name = "Belly Access Helper"
	desc = "LMB: Activate the belly-config menu without needing to alt-click.  RMB: Access the manual nomming item."

/datum/action/item_action/belly_menu/access/Trigger(trigger_flags)
	if(trigger_flags & TRIGGER_SECONDARY_ACTION)
		var/mob/living/carbon/host = usr
		if(my_belly.nommer.loc == my_belly)
			//setup item with nodrop, etc
			my_belly.nommer.resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
			ADD_TRAIT(my_belly.nommer, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)
			my_belly.nommer.slot_flags = null
			my_belly.nommer.set_custom_materials(null)
			//push into free hand
			if(host.get_active_held_item() == null)
				host.put_in_hand(my_belly.nommer, host.active_hand_index)
			//setup signal
			RegisterSignal(usr, COMSIG_KB_MOB_DROPITEM_DOWN, PROC_REF(dropkey)) //We're nodrop, but we'll watch for the drop hotkey anyway and then stow if possible.
		else
			//setup item
			host.transferItemToLoc(my_belly.nommer, my_belly, TRUE)
			//setup signal
			UnregisterSignal(usr, COMSIG_KB_MOB_DROPITEM_DOWN)
	else
		my_belly.config_menu(usr)
	return TRUE

/datum/action/item_action/belly_menu/access/proc/dropkey(mob/living/carbon/host)
	SIGNAL_HANDLER
	if(!host)
		return //How did we even get here
	if(host.held_items[host.active_hand_index] != my_belly.nommer)
		return
	host.transferItemToLoc(my_belly.nommer, my_belly, TRUE)
	return COMSIG_KB_ACTIVATED



/datum/action/item_action/belly_menu/escape
	name = "Belly Escape Helper"
	desc = "LMB: Squirm around and make your host's belly noisy.  RMB: Escape immediately."
	button_icon_state = "escape_icon"

/datum/action/item_action/belly_menu/escape/Trigger(trigger_flags)
	if(trigger_flags & TRIGGER_SECONDARY_ACTION)
		if(usr in my_belly.nommeds)
			my_belly.free_target(usr)
		else
			to_chat(usr, span_danger("You're not supposed to be able to use this action!"))
			src.Remove(usr)
	//else
		//TODO: slosh and creak
		/*playsound_if_pref(usr, pick(my_belly.move_creaks), min(20 + round(my_belly.total_fullness/32, 1), 50), TRUE, frequency=rand(40000, 50000))
		if(prob(my_belly.))*/
	return TRUE



/// Special item
/obj/item/belly_nom_helper
	name = "bwelly nom helper"
	desc = "Functions as an extension of your belly. Functions exactly like the core item."
	icon = 'modular_zskyraptor/modules_lounge/naaka_nom_sys/items.dmi'
	icon_state = "nom_helper"
	w_class = WEIGHT_CLASS_TINY
	color = "#b1f91f"

	var/obj/item/clothing/sextoy/belly_function/my_belly

/obj/item/belly_nom_helper/New(Target)
	. = ..()
	my_belly = Target

/obj/item/belly_nom_helper/attack_self(mob/user)
	return my_belly.attack_self(user)

/obj/item/belly_nom_helper/click_alt(mob/living/user)
	return my_belly.click_alt(user)

/obj/item/belly_nom_helper/attack(mob/living/carbon/human/target, mob/living/carbon/human/user)
	return my_belly.attack(target, user)

