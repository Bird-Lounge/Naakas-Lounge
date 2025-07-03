/// TEMPORARILY: the implementation of single-action revolvers lives here
/obj/item/ammo_box/magazine/internal/cylinder/sa/give_round(obj/item/ammo_casing/R, replace_spent = 0)
	//functions identically, but limits it to only reloading chamber 1
	if(!R || !(caliber ? (caliber == R.caliber) : (ammo_type == R.type)))
		return FALSE

	for(var/i in 1 to 1)
		var/obj/item/ammo_casing/bullet = stored_ammo[i]
		if(bullet && (!istype(bullet) || bullet.loaded_projectile))
			continue
		// empty or spent
		stored_ammo[i] = R
		R.forceMove(src)

		if(bullet)
			bullet.forceMove(drop_location())
		return TRUE
	return FALSE

/obj/item/gun/ballistic/revolver_sa
	name = "\improper single-action .357 revolver"
	desc = "A single-action revolver. Uses .357 ammo."
	icon_state = "revolver"
	base_icon_state = "revolver"
	var/icon_state_open = "revolver"
	var/icon_state_cocked = "revolver"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/sa
	fire_sound = 'sound/items/weapons/gun/revolver/shot_alt.ogg'
	load_sound = 'sound/items/weapons/gun/revolver/load_bullet.ogg'
	eject_sound = 'sound/items/weapons/gun/revolver/empty.ogg'
	fire_sound_volume = 90
	dry_fire_sound = 'sound/items/weapons/gun/revolver/dry_fire.ogg'
	rack_sound = 'sound/items/weapons/gun/pistol/rack_small.ogg'
	lock_back_sound = 'sound/items/weapons/gun/pistol/lock_small.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE

	var/hammer = FALSE
	var/open = FALSE

/obj/item/gun/ballistic/revolver_sa/can_shoot()
	return ..() && (hammer == TRUE)

/obj/item/gun/ballistic/revolver_sa/attack_self(mob/living/user)
	//We utterly override baseline racking functionality here.
	if(hammer == TRUE)
		hammer = FALSE
		open = FALSE
		balloon_alert_to_viewers("decocked!")
		playsound(src, dry_fire_sound, dry_fire_sound_volume / 3, TRUE)
		update_hammer_icons()
		return
	else if(open == TRUE)
		hammer = TRUE
		open = FALSE
		index_cylinder(user)
		balloon_alert_to_viewers("cocked!")
		playsound(src, rack_sound, rack_sound_volume, rack_sound_vary)
		update_hammer_icons()
		return
	else
		hammer = FALSE
		open = TRUE
		balloon_alert_to_viewers("half-cocked, loading door open!")
		playsound(src, lock_back_sound, lock_back_sound_volume, lock_back_sound_vary)
		update_hammer_icons()
		return

/obj/item/gun/ballistic/revolver_sa/chamber_round(replace_new_round)
	if(!magazine) //if it mag was qdel'd somehow.
		CRASH("single-action revolver tried to chamber a round without a magazine!")
	if(chambered)
		UnregisterSignal(chambered, COMSIG_MOVABLE_MOVED)
	chambered = magazine.stored_ammo[1]
	if(ispath(chambered))
		chambered = new chambered(src)
		magazine.stored_ammo[1] = chambered
	if(chambered)
		RegisterSignal(chambered, COMSIG_MOVABLE_MOVED, PROC_REF(clear_chambered))

/obj/item/gun/ballistic/revolver_sa/load_gun(obj/item/ammo, mob/living/user)
	if(open)
		. = ..()
	else
		return FALSE

/obj/item/gun/ballistic/revolver_sa/proc/index_cylinder(mob/user)
	var/obj/item/ammo_box/magazine/internal/cylinder/C = magazine
	. = istype(C)
	if(.)
		C.rotate()
		chamber_round()
		return TRUE
	else
		return FALSE

/obj/item/gun/ballistic/revolver_sa/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	. = ..()
	hammer = FALSE
	open = FALSE
	update_hammer_icons()

/obj/item/gun/ballistic/revolver_sa/shoot_with_empty_chamber(mob/living/user as mob|obj)
	//Dry firing makes a nasty click.  Don't do this, it's bad for your firing pin.
	//If the hammer's not down, though...
	if(hammer == TRUE)
		hammer = FALSE
		open = FALSE
		update_hammer_icons()
		..()
	else
		balloon_alert_to_viewers("*faint click*")
		playsound(src, dry_fire_sound, dry_fire_sound_volume / 3, TRUE)

/obj/item/gun/ballistic/revolver_sa/click_alt(mob/user)
	//While at half-cock, you can index the cylinder.
	if(open)
		if(!index_cylinder(user))
			balloon_alert_to_viewers("cylinder stuck or broken!")
			playsound(src, dry_fire_sound, dry_fire_sound_volume, TRUE)
		else
			balloon_alert_to_viewers("cylinder indexed")
			playsound(src, dry_fire_sound, dry_fire_sound_volume / 3, TRUE)
		return CLICK_ACTION_SUCCESS
	else
		return CLICK_ACTION_BLOCKING

/obj/item/gun/ballistic/revolver_sa/click_alt_secondary(mob/user)
	if(open)
		handle_chamber(empty_chamber = TRUE, from_firing = FALSE, chamber_next_round = TRUE)
		if(magazine.stored_ammo[1])
			balloon_alert_to_viewers("round ejected!")
		magazine.stored_ammo[1] = null
		return CLICK_ACTION_SUCCESS
	else
		return CLICK_ACTION_BLOCKING

/obj/item/gun/ballistic/revolver_sa/proc/update_hammer_icons()
	if(hammer == TRUE)
		icon_state = icon_state_cocked
	else if(open == TRUE)
		icon_state = icon_state_open
	else
		icon_state = base_icon_state

/obj/item/gun/ballistic/revolver_sa/examine(mob/user)
	. = ..()
	if(hammer == TRUE)
		. += span_danger("The hammer is fully cocked & ready to fire!")
		. += span_notice("Decock by [EXAMINE_HINT("using in-hand")].")
	else if(open == TRUE)
		. += span_danger("The hammer is at half-cock and the loading door is open!")
		. += span_notice("Index the cylinder with [EXAMINE_HINT("alt-click")].")
		. += span_notice("Eject the current round with [EXAMINE_HINT("alt-right-click")], or load a new one.")
		. += span_notice("Fully cock by [EXAMINE_HINT("using in-hand")].")
	else
		. += span_danger("The hammer is fully decocked!")
		. += span_notice("Bring to half-cock for loading by [EXAMINE_HINT("using in-hand")].")


/// ===================================================================
/// BEGINNING OF Talon Arms 'Dewclaw' - 6x.22 TL single-action revolver
/// ===================================================================
/obj/item/ammo_box/magazine/internal/cylinder/sa/c22_sixshooter
	name = ".22 TL 6-round cylinder"
	ammo_type = /obj/item/ammo_casing/c22talon
	caliber = CALIBER_22TALON
	max_ammo = 6

/obj/item/gun/ballistic/revolver_sa/dewclaw
	name = "\improper Dewclaw Revolver"
	desc = "A compact single-action revolver with a snubby barrel, ergonomic birdshead grip, and cylinder space for six .22 Talon Light rounds."

	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/pistols.dmi'
	icon_state = "dewclaw"
	base_icon_state = "dewclaw"
	icon_state_open = "dewclaw-open"
	icon_state_cocked = "dewclaw-primed"

	fire_sound = 'modular_zskyraptor/modules/lounge-gunspriting/sounds/dewclaw_fire.ogg'
	dry_fire_sound = 'modular_zskyraptor/modules/lounge-gunspriting/sounds/dewclaw_dryfire.ogg'
	rack_sound = 'modular_zskyraptor/modules/lounge-gunspriting/sounds/dewclaw_rack.ogg'
	lock_back_sound = 'modular_zskyraptor/modules/lounge-gunspriting/sounds/dewclaw_rack2.ogg'

	//TODO: optional GAGS support in addition to bespoke ones for the Lounge heads of staff.

	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/sa/c22_sixshooter

	w_class = WEIGHT_CLASS_SMALL

	can_suppress = FALSE

	lore_blurb = "The Dewclaw is about as simple as it gets, a modern implementation of Sol's classic wild-west single-action revolver design.<br><br>\
		Single-action revolvers were among the first firearms that could be fired multiple times without reloading, \
		and though double-action revolvers largely supplanted them for their improved semi-auto fire, \
		single-action revolvers have still stood the test of time in the hands of enthusiasts.<br>\
		The Dewclaw is Talon Armaments' entry in the long and storied line of modern replicas, \
		faithful to the mechanisms and stylings of original designs despite modern materials & manufacturing, \
		chambered in .22 Talon Light and shrunk down to be pocketable- \
		or comfortable in the hands (or claws) of smaller users.<br><br>\
		Its light caliber reduces its effectiveness on armored targets, \
		but the gentle recoil makes it accessible even to small users or scared first-timers, \
		making it a growingly popular entry-level weapon for folks on the galactic frontier."

/obj/item/gun/ballistic/revolver_sa/dewclaw/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_TALONARMS)
