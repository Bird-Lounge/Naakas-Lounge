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

/obj/item/ammo_box/c22talon/soap
	name = "ammo box (.22 TL soap)"
	desc = "A box of .22 TL pistol rounds, holds 30 cartridges. The electric-green stripe indicates that it should hold less lethal soap rounds."

	icon_state = "22box_soap"

	ammo_type = /obj/item/ammo_casing/c585trappiste/incapacitator


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

/obj/item/ammo_box/c380talon/soap
	name = "ammo box (.380 TC soap)"
	desc = "A box of .380 TC pistol rounds, holds 24 cartridges. The electric-green stripe indicates that it should hold less lethal soap rounds."

	icon_state = "380box_soap"

	ammo_type = /obj/item/ammo_casing/c585trappiste/incapacitator
