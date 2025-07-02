/datum/preference/toggle/erp/belly_master
	savefile_key = "erp_enable_belly"

/datum/preference/toggle/erp/belly
	savefile_key = "erp_belly_base"
	//This is just a helper path to get common behaviour (hiding prefs)

/datum/preference/toggle/erp/belly/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/erp/belly_master)

/datum/preference/toggle/erp/belly/deserialize(input, datum/preferences/preferences)
	if(!preferences.read_preference(/datum/preference/toggle/erp/belly_master))
		return FALSE
	return ..()

/datum/preference/toggle/erp/belly/sound_groans
	savefile_key = "erp_belly_sound_groans"

/datum/preference/toggle/erp/belly/sound_gurgles
	savefile_key = "erp_belly_sound_gurgles"

/datum/preference/toggle/erp/belly/sound_move_creaks
	savefile_key = "erp_belly_sound_move_creaks"

/datum/preference/toggle/erp/belly/sound_move_sloshes
	savefile_key = "erp_belly_sound_move_sloshes"

/datum/preference/choiced/erp_vore_prey_pref
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_belly_vore_prey"

/datum/preference/choiced/erp_vore_prey_pref/init_possible_values()
	return list(
		"Never",
		"Query",
		"Always",
	)

/datum/preference/choiced/erp_vore_prey_pref/create_default_value()
	return "Never"

/datum/preference/choiced/erp_vore_prey_pref/deserialize(input, datum/preferences/preferences)
	if(!preferences.read_preference(/datum/preference/toggle/erp/belly_master))
		return create_default_value()
	return ..()

/datum/preference/choiced/erp_vore_prey_pref/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/erp/belly_master)

/datum/preference/choiced/erp_vore_prey_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE


//==BREAKER FOR QUIRK PREFERENCES==
/datum/quirk/item_quirk/stuffable
	name = "True Glutton"
	desc = "Voracious alt ft. BWELLY ITEM.  Alt-click it in-hand to change the color to match your sprite, then equip or use for nommage as the description says."
	icon = FA_ICON_DRUMSTICK_BITE
	value = 0
	mob_trait = TRAIT_VORACIOUS
	gain_text = span_notice("You feel like you could eat a horse!")
	lose_text = span_danger("Food suddenly feels a lot less appealing.")
	medical_record_text = "Patient's midriff and stomach are unusually stretchy."
	erp_quirk = TRUE

/datum/quirk/item_quirk/stuffable/add_unique(client/client_source)
	var/obj/item/clothing/sextoy/belly_function/the_bwelly = new /obj/item/clothing/sextoy/belly_function(get_turf(quirk_holder))

	//color
	var/the_color = client_source.prefs.read_preference(/datum/preference/color/erp_bellyquirk_color) //this makes the (potentially dangerous) assumption this is valid
	if(the_color == null)
		the_color = "#FFFFFF"
	the_bwelly.color = the_color
	the_bwelly.nommer.color = the_color

	//size modifier
	var/sizemod = client_source.prefs.read_preference(/datum/preference/numeric/erp_bellyquirk_sizemod)
	if(sizemod == null)
		sizemod = 1
	the_bwelly.sizemod = sizemod
	//size modifier - audio
	var/sizemod_audio = client_source.prefs.read_preference(/datum/preference/numeric/erp_bellyquirk_sizemod_audio)
	if(sizemod_audio == null)
		sizemod_audio = 1
	the_bwelly.sizemod_audio = sizemod_audio

	//base cosmetic size
	var/size_base = client_source.prefs.read_preference(/datum/preference/numeric/erp_bellyquirk_size_base)
	if(size_base == null)
		size_base = 0
	the_bwelly.base_size_cosmetic = size_base
	//endosoma size
	var/size_endo = client_source.prefs.read_preference(/datum/preference/numeric/erp_bellyquirk_size_endo)
	if(size_endo == null)
		size_endo = 0
	the_bwelly.base_size_endo = size_endo;
	//stuffed size
	var/size_stuffed = client_source.prefs.read_preference(/datum/preference/numeric/erp_bellyquirk_size_stuffed)
	if(size_stuffed == null)
		size_stuffed = 0
	the_bwelly.base_size_stuffed = size_stuffed

	//sound toggle: full groans
	var/allow_groans = client_source.prefs.read_preference(/datum/preference/toggle/erp_bellyquirk_groans)
	if(allow_groans == null)
		allow_groans = FALSE
	the_bwelly.allow_sound_groans = allow_groans
	//sound toggle: stuffed gurgles
	var/allow_gurgles = client_source.prefs.read_preference(/datum/preference/toggle/erp_bellyquirk_gurgles)
	if(allow_gurgles == null)
		allow_gurgles = FALSE
	the_bwelly.allow_sound_gurgles = allow_gurgles
	//sound toggle: full creaks when moving
	var/allow_move_creaks = client_source.prefs.read_preference(/datum/preference/toggle/erp_bellyquirk_move_creaks)
	if(allow_move_creaks == null)
		allow_move_creaks = FALSE
	the_bwelly.allow_sound_move_creaks = allow_move_creaks
	//sound toggle: stuffed sloshes when moving
	var/allow_move_sloshes = client_source.prefs.read_preference(/datum/preference/toggle/erp_bellyquirk_move_sloshes)
	if(allow_move_sloshes == null)
		allow_move_sloshes = FALSE
	the_bwelly.allow_sound_move_sloshes = allow_move_sloshes

	//pred prefs mode
	var/pred_prefs = client_source.prefs.read_preference(/datum/preference/choiced/erp_bellyquirk_pred_pref)
	if(pred_prefs == null)
		pred_prefs = "Query"
	the_bwelly.pred_mode = pred_prefs

	give_item_to_holder(the_bwelly, list(
		LOCATION_LPOCKET,
		LOCATION_RPOCKET,
		LOCATION_BACKPACK,
		LOCATION_HANDS,
	))



/datum/preference/color/erp_bellyquirk_color
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_color"

/datum/preference/color/erp_bellyquirk_color/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/erp_bellyquirk_sizemod
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_sizemod"
	step = 0.01
	minimum = 0
	maximum = 10

/datum/preference/numeric/erp_bellyquirk_sizemod/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/erp_bellyquirk_sizemod/create_default_value()
	return 1

/datum/preference/numeric/erp_bellyquirk_sizemod_audio
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_sizemod_audio"
	step = 0.01
	minimum = 0
	maximum = 10

/datum/preference/numeric/erp_bellyquirk_sizemod_audio/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/erp_bellyquirk_sizemod_audio/create_default_value()
	return 1

/datum/preference/numeric/erp_bellyquirk_size_base
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_size_base"
	step = 1
	minimum = 0
	maximum = 10000

/datum/preference/numeric/erp_bellyquirk_size_base/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/erp_bellyquirk_size_base/create_default_value()
	return 0

/datum/preference/numeric/erp_bellyquirk_size_endo
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_size_endo"
	step = 1
	minimum = 0
	maximum = 10000

/datum/preference/numeric/erp_bellyquirk_size_endo/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/erp_bellyquirk_size_endo/create_default_value()
	return 0

/datum/preference/numeric/erp_bellyquirk_size_stuffed
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_size_stuffed"
	step = 1
	minimum = 0
	maximum = 10000

/datum/preference/numeric/erp_bellyquirk_size_stuffed/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/erp_bellyquirk_size_stuffed/create_default_value()
	return 0

/datum/preference/toggle/erp_bellyquirk_groans
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_sound_groans"

/datum/preference/toggle/erp_bellyquirk_groans/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/toggle/erp_bellyquirk_gurgles
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_sound_gurgles"

/datum/preference/toggle/erp_bellyquirk_gurgles/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/toggle/erp_bellyquirk_move_creaks
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_sound_move_creaks"

/datum/preference/toggle/erp_bellyquirk_move_creaks/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/toggle/erp_bellyquirk_move_sloshes
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_sound_move_sloshes"

/datum/preference/toggle/erp_bellyquirk_move_sloshes/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/erp_bellyquirk_pred_pref
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_bellyquirk_pred"

/datum/preference/choiced/erp_bellyquirk_pred_pref/init_possible_values()
	return list(
		"Never",
		"Query",
		"Always",
	)

/datum/preference/choiced/erp_bellyquirk_pred_pref/create_default_value()
	return "Never"

/datum/preference/choiced/erp_bellyquirk_pred_pref/deserialize(input, datum/preferences/preferences)
	if(!preferences.read_preference(/datum/preference/toggle/erp/belly_master))
		return create_default_value()
	return ..()

/datum/preference/choiced/erp_bellyquirk_pred_pref/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/erp/belly_master)

/datum/preference/choiced/erp_bellyquirk_pred_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE



/datum/quirk_constant_data/stuffable
	associated_typepath = /datum/quirk/item_quirk/stuffable

/datum/quirk_constant_data/stuffable/New()
	customization_options = list(/datum/preference/color/erp_bellyquirk_color,
	/datum/preference/numeric/erp_bellyquirk_sizemod, /datum/preference/numeric/erp_bellyquirk_sizemod_audio,
	/datum/preference/numeric/erp_bellyquirk_size_base, /datum/preference/numeric/erp_bellyquirk_size_endo, /datum/preference/numeric/erp_bellyquirk_size_stuffed,
	/datum/preference/toggle/erp_bellyquirk_groans, /datum/preference/toggle/erp_bellyquirk_gurgles, /datum/preference/toggle/erp_bellyquirk_move_creaks, /datum/preference/toggle/erp_bellyquirk_move_sloshes,
	/datum/preference/choiced/erp_bellyquirk_pred_pref)

	return ..()



// shunting this in here to avoid merge conflicts
/obj/item/organ/tongue/teshari/Initialize(mapload)
	. = ..()
	disliked_foodtypes = disliked_foodtypes & (!GRAIN)
