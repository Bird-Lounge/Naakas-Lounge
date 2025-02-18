#define SPECIES_MOTH_NAAKAS "moth_naakas"

/obj/item/bodypart/head/moth/naakas
	icon = null
	icon_static = null
	icon_greyscale = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/bodyparts.dmi'
	should_draw_greyscale = TRUE
	head_flags = HEAD_ALL_FEATURES

	eyes_icon = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'

/obj/item/bodypart/chest/moth/naakas
	icon = null
	icon_static = null
	icon_greyscale = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/bodyparts.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/left/moth/naakas
	icon = null
	icon_static = null
	icon_greyscale = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/bodyparts.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/right/moth/naakas
	icon = null
	icon_static = null
	icon_greyscale = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/bodyparts.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/left/moth/naakas
	icon = null
	icon_static = null
	icon_greyscale = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/bodyparts.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/moth/naakas
	icon = null
	icon_static = null
	icon_greyscale = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/bodyparts.dmi'
	should_draw_greyscale = TRUE

// alternative moffs
/datum/species/moth/naakas
	name = "\improper NL-Mothman"
	plural_form = "NL-Mothmen"
	id = SPECIES_MOTH_NAAKAS
	inherent_traits = list(
		TRAIT_MUTANT_COLORS, /// NAAKAS-LOUNGE EDIT: we're forcing this to the top of the stack to try and avoid fuckery...
		TRAIT_TACKLING_WINGED_ATTACKER,
		TRAIT_ANTENNAE,
	)

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/moth/naakas,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/moth/naakas,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/moth/naakas,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/moth/naakas,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/moth/naakas,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/moth/naakas,
	)

// gonna migrate to using naakas-moth as a separate species
/*/obj/item/organ/internal/eyes/moth/naakas
	eye_icon_file = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'

/obj/item/organ/internal/eyes/moth/naakas
	eye_icon_file = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'

/obj/item/organ/internal/eyes/robotic/moth/naakas
	eye_icon_file = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'

/obj/item/organ/internal/eyes/robotic/basic/moth/naakas
	eye_icon_file = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'

/obj/item/organ/internal/eyes/robotic/xray/moth/naakas
	eye_icon_file = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'

/obj/item/organ/internal/eyes/robotic/shield/moth/naakas
	eye_icon_file = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'

/obj/item/organ/internal/eyes/robotic/glow/moth/naakas
	eye_icon_file = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'

/obj/item/organ/internal/eyes/robotic/thermals/moth/naakas
	eye_icon_file = 'modular_zskyraptor/modules/aesthetics/daedmoth/icons/eyes.dmi'*/
