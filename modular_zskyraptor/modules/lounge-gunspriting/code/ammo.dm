// .22 Talon Light
// Small-caliber round analagous to .22 LR - cheap and

/obj/item/ammo_casing/c22talon
	name = ".22 TL lethal bullet casing"
	desc = "A brass-cased .22 Talon Light small caliber round with a lethal bullet."

	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/ammo.dmi'
	icon_state = "22talon"

	caliber = CALIBER_22TALON
	projectile_type = /obj/projectile/bullet/c22talon

/obj/projectile/bullet/c22talon
	name = ".22 TL bullet"
	damage = 15
	wound_bonus = 10
	exposed_wound_bonus = 20
	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/projectiles.dmi'
	icon_state = "22lethal"
	// 22 LR is infamous for bouncing around inside bodies and ripping internal organs apart.
	// Until such time as I can be bothered to write bespoke organ-damaging code this will do.

/obj/item/ammo_box/c22talon
	name = "ammo box (.22 TL lethal)"
	desc = "A box of .22 TL pistol rounds, holds 30 cartridges. The hazard-orange stripe indicates that it should hold lethal hollow-point rounds."

	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/ammo.dmi'
	icon_state = "22box"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	caliber = CALIBER_22TALON
	ammo_type = /obj/item/ammo_casing/c22talon
	max_ammo = 30

// .22 TL equivalent to a rubber bullet.
// Based on a questionably true story of redneck idiocy (opening presumable .22 Short cartridges and replacing their bullets with soap)
// Soap-splosion effect on wet targets based on those same idiots making a 12-gauge soapshot round that exploded an outhouse and, I quote, "made the world go pink"

/obj/item/ammo_casing/c22talon/soap
	name = ".22 TL soap bullet casing"
	desc = "A brass-cased .22 Talon Light small caliber round with a custom-shaped flathead soap bullet. Hurts like hell and can explode into suds, but not lethal."

	icon_state = "22talon_soap"

	projectile_type = /obj/projectile/bullet/c22talon/soap
	ammo_categories = AMMO_CLASS_NONE
	print_cost = 0
	harmful = FALSE

/obj/projectile/bullet/c22talon/soap
	name = ".22 TL soap bullet"
	icon_state = "22soap"
	damage = 2
	stamina = 25
	wound_bonus = 0
	exposed_wound_bonus = 5

	weak_against_armour = TRUE

	shrapnel_type = null
	sharpness = NONE
	embed_data = null
	// TODO: soap-splosion effect on impact with wet targets.
	// Think an ultra-low-power cleaning grenade.  Almost guaranteed to slip the victim and clean the scene.

/obj/projectile/bullet/c22talon/soap/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(ismob(target))
		var/mob/are_they_soggy = target
		var/datum/status_effect/fire_handler/wet_stacks/wetness = locate() in are_they_soggy.status_effects
		if(istype(wetness))
			target.visible_message(span_warning("The soap from [src] combines with water on [target] and bursts into soapy suds!"), span_warning("You're covered in soapy suds!"))
			var/datum/reagents/dispensed_reagent = new /datum/reagents(2 * wetness.stacks)
			dispensed_reagent.my_atom = target
			dispensed_reagent.add_reagent(/datum/reagent/space_cleaner, 2 * wetness.stacks)
			dispensed_reagent.create_foam(/datum/effect_system/fluid_spread/foam/short, 2 * wetness.stacks)

/obj/item/ammo_box/c22talon/soap
	name = "ammo box (.22 TL soap)"
	desc = "A box of .22 TL pistol rounds, holds 30 cartridges. The electric-green stripe indicates that it should hold less lethal soap rounds."

	icon_state = "22box_soap"

	ammo_type = /obj/item/ammo_casing/c22talon/soap


// .380 Talon Claw
// Small-caliber round analagous to .380 ACP - a solid all-rounder pistol ammo.  Hits harder than .35 Sol but less wound chance.

/obj/item/ammo_casing/c380talon
	name = ".380 TC lethal bullet casing"
	desc = "A brass-cased .380 Talon Claw small caliber round with a lethal hollow-point bullet."

	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/ammo.dmi'
	icon_state = "380talon"

	caliber = CALIBER_380TALON
	projectile_type = /obj/projectile/bullet/c22talon

/obj/projectile/bullet/c380talon
	name = ".380 TC bullet"
	damage = 25
	wound_bonus = 5
	exposed_wound_bonus = 5
	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/projectiles.dmi'
	icon_state = "380lethal"

/obj/item/ammo_box/c380talon
	name = "ammo box (.380 TC lethal)"
	desc = "A box of .380 TC pistol rounds, holds 24 cartridges. The hazard-orange stripe indicates that it should hold lethal hollow-point rounds."

	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/ammo.dmi'
	icon_state = "380box"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	caliber = CALIBER_380TALON
	ammo_type = /obj/item/ammo_casing/c380talon
	max_ammo = 24

// .22 TL equivalent to a rubber bullet.
// Based on a questionably true story of redneck idiocy (opening presumable .22 Short cartridges and replacing their bullets with soap)
// Soap-splosion effect on wet targets based on those same idiots making a 12-gauge soapshot round that exploded an outhouse and, I quote, "made the world go pink"

/obj/item/ammo_casing/c380talon/soap
	name = ".380 TC soap bullet casing"
	desc = "A brass-cased .380 Talon Claw small caliber round with a custom-shaped flathead soap bullet. Hurts like hell and can explode into suds, but not lethal."

	icon_state = "380talon_soap"

	projectile_type = /obj/projectile/bullet/c380talon/soap
	ammo_categories = AMMO_CLASS_NONE
	print_cost = 0
	harmful = FALSE

/obj/projectile/bullet/c380talon/soap
	name = ".380 TC soap bullet"
	icon_state = "380soap"
	damage = 3
	stamina = 30
	wound_bonus = 0
	exposed_wound_bonus = 5

	weak_against_armour = TRUE

	shrapnel_type = null
	sharpness = NONE
	embed_data = null
	// TODO: soap-splosion effect on impact with wet targets.
	// Think an ultra-low-power cleaning grenade.  Almost guaranteed to slip the victim and clean the scene.

/obj/projectile/bullet/c380talon/soap/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(ismob(target))
		var/mob/are_they_soggy = target
		var/datum/status_effect/fire_handler/wet_stacks/wetness = locate() in are_they_soggy.status_effects
		if(istype(wetness))
			target.visible_message(span_warning("The soap from [src] combines with water on [target] and bursts into soapy suds!"), span_warning("You're covered in soapy suds!"))
			var/datum/reagents/dispensed_reagent = new /datum/reagents(3 * wetness.stacks)
			dispensed_reagent.my_atom = target
			dispensed_reagent.add_reagent(/datum/reagent/space_cleaner, 3 * wetness.stacks)
			dispensed_reagent.create_foam(/datum/effect_system/fluid_spread/foam/short, 3 * wetness.stacks)

/obj/item/ammo_box/c380talon/soap
	name = "ammo box (.380 TC soap)"
	desc = "A box of .380 TC pistol rounds, holds 24 cartridges. The electric-green stripe indicates that it should hold less lethal soap rounds."

	icon_state = "380box_soap"

	ammo_type = /obj/item/ammo_casing/c380talon/soap

// 12-gauge soap slug.  For when you need to turn the world pink.
// Based on a questionably true story of redneck idiocy (opening presumable .22 Short cartridges and replacing their bullets with soap)
// Soap-splosion effect on wet targets based on those same idiots making a 12-gauge soapshot round that exploded an outhouse and, I quote, "made the world go pink"
/obj/item/ammo_casing/shotgun/soapslug
	name = "soap slug"
	desc = "Non-lethal 12-gauge shell with a custom-shaped soap slug. Non-lethal, hurts like hell, probably in violation of the Space Geneva Conventions for the chance of absolute soap explosions."
	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/ammo.dmi'
	icon_state = "soapshell"
	projectile_type = /obj/projectile/bullet/shotgun_soapslug

/obj/projectile/bullet/shotgun_soapslug
	name = "soap slug"
	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/projectiles.dmi'
	icon_state = "pelletsoap"
	damage = 5
	stamina = 60
	wound_bonus = 20
	sharpness = NONE
	embed_type = null

/obj/projectile/bullet/shotgun_soapslug/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(ismob(target))
		var/mob/are_they_soggy = target
		var/datum/status_effect/fire_handler/wet_stacks/wetness = locate() in are_they_soggy.status_effects
		if(istype(wetness))
			target.visible_message(span_danger("The soap from [src] combines with water on [target] and explodes into soapy suds!"), span_bolddanger("OH GODS- NOT THE SOAP!!"))
			var/datum/reagents/dispensed_reagent = new /datum/reagents(8 * wetness.stacks)
			dispensed_reagent.my_atom = target
			dispensed_reagent.add_reagent(/datum/reagent/space_cleaner, 8 * wetness.stacks)
			dispensed_reagent.create_foam(/datum/effect_system/fluid_spread/foam/short, 8 * wetness.stacks)
