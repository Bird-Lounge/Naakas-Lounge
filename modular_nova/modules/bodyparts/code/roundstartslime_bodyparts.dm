// Roundstartslimes!

#define SLIME_LIMB_BLOOD_LOSS 60

/obj/item/bodypart/head/jelly
	can_dismember = TRUE //Their organs are in their chest now, all slime subspecies, so they can safely be decapitated.

/obj/item/bodypart/head/jelly/slime/roundstart
	is_dimorphic = TRUE
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/chest/jelly/slime/roundstart
	is_dimorphic = TRUE
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/arm/left/jelly/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/arm/right/jelly/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/left/jelly/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/right/jelly/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/head/slime /// NAAKAS-LOUNGE EDIT BEGIN
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	is_dimorphic = TRUE
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage
	head_flags = HEAD_EYECOLOR | HEAD_EYESPRITES | HEAD_HAIR | HEAD_FACIAL_HAIR

/obj/item/bodypart/chest/slime
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	is_dimorphic = TRUE
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage
	wing_types = list(/obj/item/organ/external/wings/functional/slime)

/obj/item/bodypart/chest/slime/get_butt_sprite()
	return BUTT_SPRITE_SLIME

/obj/item/bodypart/arm/left/slime
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/arm/right/slime
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/leg/left/slime
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/leg/right/slime
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

///SLIME
/obj/item/bodypart/head/slime
	limb_id = SPECIES_SLIMEPERSON
	is_dimorphic = FALSE

/obj/item/bodypart/chest/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/left/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/right/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/left/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/right/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/head/slime/roundstart
	is_dimorphic = TRUE
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/chest/slime/roundstart
	is_dimorphic = TRUE
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/arm/left/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/arm/right/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/left/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/right/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED) /// NAAKAS-LOUNGE ADDITION END

/obj/item/bodypart/head/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= SLIME_LIMB_BLOOD_LOSS
	. = ..()
	qdel(src)
	return .

/obj/item/bodypart/arm/left/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= SLIME_LIMB_BLOOD_LOSS
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

/obj/item/bodypart/arm/right/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= SLIME_LIMB_BLOOD_LOSS
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

/obj/item/bodypart/leg/left/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= SLIME_LIMB_BLOOD_LOSS
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

/obj/item/bodypart/leg/right/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= SLIME_LIMB_BLOOD_LOSS
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

#undef SLIME_LIMB_BLOOD_LOSS
