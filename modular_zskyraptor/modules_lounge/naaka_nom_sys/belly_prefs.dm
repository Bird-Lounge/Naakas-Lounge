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
	var/the_color = client_source.prefs.read_preference(/datum/preference/color/lounge_bellyitem_color) //this makes the (potentially dangerous) assumption this is valid
	if(the_color == null)
		the_color = "#FFFFFF"
	the_bwelly.color = the_color
	the_bwelly.nommer.color = the_color

	//size modifier
	var/sizemod = client_source.prefs.read_preference(/datum/preference/numeric/lounge_bellyitem_sizemod)
	if(sizemod == null)
		sizemod = 1
	the_bwelly.sizemod = sizemod
	//size modifier - audio
	var/sizemod_audio = client_source.prefs.read_preference(/datum/preference/numeric/lounge_bellyitem_sizemod_audio)
	if(sizemod_audio == null)
		sizemod_audio = 1
	the_bwelly.sizemod_audio = sizemod_audio

	//base cosmetic size
	var/size_base = client_source.prefs.read_preference(/datum/preference/numeric/lounge_bellyitem_size_base)
	if(size_base == null)
		size_base = 0
	the_bwelly.base_size_cosmetic = size_base
	//endosoma size
	var/size_endo = client_source.prefs.read_preference(/datum/preference/numeric/lounge_bellyitem_size_endo)
	if(size_endo == null)
		size_endo = 0
	the_bwelly.base_size_endo = size_endo;
	//stuffed size
	var/size_stuffed = client_source.prefs.read_preference(/datum/preference/numeric/lounge_bellyitem_size_stuffed)
	if(size_stuffed == null)
		size_stuffed = 0
	the_bwelly.base_size_stuffed = size_stuffed

	give_item_to_holder(the_bwelly, list(
		LOCATION_LPOCKET,
		LOCATION_RPOCKET,
		LOCATION_BACKPACK,
		LOCATION_HANDS,
	))



/datum/preference/color/lounge_bellyitem_color
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "lounge_bellyitem_color"

/datum/preference/color/lounge_bellyitem_color/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/lounge_bellyitem_sizemod
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "lounge_bellyitem_sizemod"
	step = 0.1
	minimum = 0
	maximum = 10

/datum/preference/numeric/lounge_bellyitem_sizemod/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/lounge_bellyitem_sizemod/create_default_value()
	return 1

/datum/preference/numeric/lounge_bellyitem_sizemod_audio
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "lounge_bellyitem_sizemod_audio"
	step = 0.1
	minimum = 0
	maximum = 10

/datum/preference/numeric/lounge_bellyitem_sizemod_audio/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/lounge_bellyitem_sizemod_audio/create_default_value()
	return 1

/datum/preference/numeric/lounge_bellyitem_size_base
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "lounge_bellyitem_size_base"
	step = 1
	minimum = 0
	maximum = 10000

/datum/preference/numeric/lounge_bellyitem_size_base/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/lounge_bellyitem_size_base/create_default_value()
	return 0

/datum/preference/numeric/lounge_bellyitem_size_endo
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "lounge_bellyitem_size_endo"
	step = 1
	minimum = 0
	maximum = 10000

/datum/preference/numeric/lounge_bellyitem_size_endo/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/lounge_bellyitem_size_endo/create_default_value()
	return 0

/datum/preference/numeric/lounge_bellyitem_size_stuffed
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "lounge_bellyitem_size_stuffed"
	step = 1
	minimum = 0
	maximum = 10000

/datum/preference/numeric/lounge_bellyitem_size_stuffed/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/lounge_bellyitem_size_stuffed/create_default_value()
	return 0



/datum/quirk_constant_data/stuffable
	associated_typepath = /datum/quirk/item_quirk/stuffable

/datum/quirk_constant_data/stuffable/New()
	customization_options = list(/datum/preference/color/lounge_bellyitem_color, /datum/preference/numeric/lounge_bellyitem_sizemod, /datum/preference/numeric/lounge_bellyitem_sizemod_audio, /datum/preference/numeric/lounge_bellyitem_size_base, /datum/preference/numeric/lounge_bellyitem_size_endo, /datum/preference/numeric/lounge_bellyitem_size_stuffed)

	return ..()



// shunting this in here to avoid merge conflicts
/obj/item/organ/tongue/teshari/Initialize(mapload)
	. = ..()
	disliked_foodtypes = disliked_foodtypes & (!GRAIN)
