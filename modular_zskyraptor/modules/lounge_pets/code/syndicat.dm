/mob/living/basic/pet/cat/syndicat
	name = "Syndi-Cat"
	desc = "KITTY!!!  Wait, is that a Syndicate modsuit-"
	icon = 'modular_zskyraptor/modules/lounge_pets/icons/syndicat.dmi'
	icon_state = "syndicat"
	icon_living = "syndicat"
	icon_dead = "syndicat_dead"
	health = 150
	maxHealth = 150
	butcher_results = list(
		/obj/effect/explosion //meat?  WRONG: bombs
	)
	response_harm_continuous = "stabs"
	response_harm_simple = "stab"
	ai_controller = null //syndicat is meant to be more ghostrole than anything else
	death_message = "yowls, collapsing as its lights flicker and fall dark!"
	death_sound = SFX_BODYFALL
	can_breed = FALSE
	can_interact_with_stove = TRUE
	/// it's got a special modsuit, space and atmos stop mattering & extreme temps are less scary
	minimum_survivable_temperature = 1
	maximum_survivable_temperature = 500
	unsuitable_atmos_damage = 0

// MODsuit comes with eeeeeeeeevil syndicate lifesupport tech
/mob/living/basic/pet/cat/syndicat/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/regenerator,\
		regeneration_delay = 1 SECONDS,\
		brute_per_second = 5,\
		outline_colour = COLOR_DARK_RED,\
	)
