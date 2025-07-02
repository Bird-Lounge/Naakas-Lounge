/// Cargo storage (why didn't they have these to begin with??)
/obj/item/storage/backpack/cargo
	name = "cargo backpack"
	desc = "A tough, heavy-duty bag full of room for mail storage."
	icon_state = "backpack-cargo"
	inhand_icon_state = "backpack-cargo"

	icon = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_inv.dmi'
	worn_icon = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_worn.dmi'
	lefthand_file = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_lefthand.dmi'
	righthand_file = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_righthand.dmi'

/obj/item/storage/backpack/satchel/cargo
	name = "cargo satchel"
	desc = "A tough, heavy-duty satchel full of room for mail storage."
	icon_state = "satchel-cargo"
	inhand_icon_state = "satchel-cargo"

	icon = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_inv.dmi'
	worn_icon = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_worn.dmi'
	lefthand_file = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_lefthand.dmi'
	righthand_file = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_righthand.dmi'

/obj/item/storage/backpack/duffelbag/cargo
	name = "cargo duffelbag"
	desc = "A tough, heavy-duty duffelbag full of room for mail storage."
	icon_state = "duffel-cargo"
	inhand_icon_state = "duffel-cargo"

	icon = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_inv.dmi'
	worn_icon = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_worn.dmi'
	lefthand_file = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_lefthand.dmi'
	righthand_file = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_righthand.dmi'

/obj/item/storage/backpack/messenger/cargo
	name = "cargo messenger bag"
	desc = "A tough, heavy-duty messenger bag full of room for mail storage."
	icon_state = "messenger_cargo"
	inhand_icon_state = "messenger_cargo"

	icon = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_inv.dmi'
	worn_icon = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_worn.dmi'
	lefthand_file = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_lefthand.dmi'
	righthand_file = 'modular_zskyraptor/modules/aesthetics/unshitty_bags/backpack_righthand.dmi'



/// Outfit overrides to give cargo their new drip
/datum/outfit/job/cargo_tech
	backpack = /obj/item/storage/backpack/cargo
	satchel = /obj/item/storage/backpack/satchel/cargo
	duffelbag = /obj/item/storage/backpack/duffelbag/cargo
	messenger = /obj/item/storage/backpack/messenger/cargo

/datum/outfit/job/quartermaster
	backpack = /obj/item/storage/backpack/cargo
	satchel = /obj/item/storage/backpack/satchel/cargo
	duffelbag = /obj/item/storage/backpack/duffelbag/cargo
	messenger = /obj/item/storage/backpack/messenger/cargo



/// GAGS Backpacks from Doppler Shfit
// regular backpacks
/obj/item/storage/backpack/custom
	name = "custom backpack"
	icon_state = "backpack"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack
	greyscale_config_worn = /datum/greyscale_config/backpack/worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/storage/backpack/industrial/custom
	name = "custom industrial backpack"
	icon_state = "backpack_industrial"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack
	greyscale_config_worn = /datum/greyscale_config/backpack/worn
	flags_1 = IS_PLAYER_COLORABLE_1

// satchels
/obj/item/storage/backpack/satchel/custom
	name = "custom satchel"
	icon_state = "satchel"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/satchel
	greyscale_config_worn = /datum/greyscale_config/backpack/satchel/worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/storage/backpack/satchel/eng/custom
	name = "custom industrial satchel"
	icon_state = "satchel_industrial"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/satchel
	greyscale_config_worn = /datum/greyscale_config/backpack/satchel/worn
	flags_1 = IS_PLAYER_COLORABLE_1

// duffelbags
/obj/item/storage/backpack/duffelbag/custom
	name = "custom duffelbag"
	icon_state = "duffel"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/duffel
	greyscale_config_worn = /datum/greyscale_config/backpack/duffel/worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/storage/backpack/duffelbag/engineering/custom
	name = "custom industrial duffelbag"
	icon_state = "duffel_industrial"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/duffel
	greyscale_config_worn = /datum/greyscale_config/backpack/duffel/worn
	flags_1 = IS_PLAYER_COLORABLE_1

// messenger bags
/obj/item/storage/backpack/messenger/custom
	name = "custom messenger bag"
	icon_state = "messenger"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/messenger
	greyscale_config_worn = /datum/greyscale_config/backpack/messenger/worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/storage/backpack/messenger/eng/custom
	name = "custom industrial messenger bag"
	icon_state = "messenger_industrial"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/messenger
	greyscale_config_worn = /datum/greyscale_config/backpack/messenger/worn
	flags_1 = IS_PLAYER_COLORABLE_1

// slimpacks
/obj/item/storage/backpack/satchel/flat/empty/custom
	name = "custom flatpack"
	desc = "An ultra-light-weight slim storage option that fits above the belt- or slipped into other bags or under floor tiles."
	icon_state = "slimpack"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/slimpack
	greyscale_config_worn = /datum/greyscale_config/backpack/slimpack/worn
	flags_1 = IS_PLAYER_COLORABLE_1

// slimpacks but novarat
/obj/item/storage/backpack/tinypaka/custom
	name = "custom waistpack"
	greyscale_colors = "#ABD734#787B6B"
	greyscale_config = /datum/greyscale_config/backpack/tinypaka
	greyscale_config_worn = /datum/greyscale_config/backpack/tinypaka/worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/storage/backpack/tinypakb/custom
	name = "custom storage belt"
	greyscale_colors = "#ABD734#787B6B"
	greyscale_config = /datum/greyscale_config/backpack/tinypakb
	greyscale_config_worn = /datum/greyscale_config/backpack/tinypakb/worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/storage/backpack/tinypakc/custom
	name = "custom chest pouch"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/tinypakc
	greyscale_config_worn = /datum/greyscale_config/backpack/tinypakc/worn
	flags_1 = IS_PLAYER_COLORABLE_1

// fannypack buffs
/obj/item/storage/belt/fannypack/custom
	name = "fannypack"
	icon_state = "fannypack"
	worn_icon_state = "fannypack"
	greyscale_colors = "#ABD734"
	greyscale_config = /datum/greyscale_config/fannypack
	greyscale_config_worn = /datum/greyscale_config/fannypack/worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/storage/belt/fannypack/custom/alt_tinypak
	name = "slim fannypack"
	icon_state = "tinypaka"
	worn_icon_state = "tinypaka"
	inhand_icon_state = "messenger"
	icon = 'modular_nova/modules/clothing_improvements/icons/clothing.dmi'
	worn_icon = 'modular_nova/modules/clothing_improvements/icons/clothing_worn.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	greyscale_colors = "#ABD734#787B6B"
	greyscale_config = /datum/greyscale_config/backpack/tinypaka
	greyscale_config_worn = /datum/greyscale_config/backpack/tinypaka/worn

/obj/item/storage/belt/fannypack/custom/alt_tinypak/altB
	icon_state = "tinypakb"
	worn_icon_state = "tinypakb"
	greyscale_config = /datum/greyscale_config/backpack/tinypakb
	greyscale_config_worn = /datum/greyscale_config/backpack/tinypakb/worn

/obj/item/storage/belt/fannypack/custom/alt_tinypak/altC
	icon_state = "tinypakc"
	worn_icon_state = "tinypakc"
	greyscale_config = /datum/greyscale_config/backpack/tinypakc
	greyscale_config_worn = /datum/greyscale_config/backpack/tinypakc/worn

/obj/item/storage/belt/fannypack/custom/alt
	name = "slim fannypack"
	icon_state = "slimpack"
	worn_icon_state = "slimpack"
	greyscale_colors = "#787B6B#ABD734"
	greyscale_config = /datum/greyscale_config/backpack/slimpack
	greyscale_config_worn = /datum/greyscale_config/backpack/slimpack/worn

// MODULAR EDIT: actually making these things fucking useful
/obj/item/storage/belt/fannypack/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 5
	atom_storage.max_total_storage = 7
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL



// loadouts begin
/datum/loadout_item/belts/fanny_pack_custom
	name = "Fannypack"
	item_path = /obj/item/storage/belt/fannypack/custom

/datum/loadout_item/belts/fanny_pack_custom/altA
	name = "Slim Waist Fannypack"
	item_path = /obj/item/storage/belt/fannypack/custom/alt_tinypak

/datum/loadout_item/belts/fanny_pack_custom/altB
	name = "Slim Belt Fannypack"
	item_path = /obj/item/storage/belt/fannypack/custom/alt_tinypak/altB

/datum/loadout_item/belts/fanny_pack_custom/altC
	name = "Slim Chest Fannypack"
	item_path = /obj/item/storage/belt/fannypack/custom/alt_tinypak/altC

/datum/loadout_item/belts/fanny_pack_custom/alt
	name = "Slim Fannypack"
	item_path = /obj/item/storage/belt/fannypack/custom/alt

/datum/loadout_item/inhand/slimpack
	name = "Custom Flatpack"
	item_path = /obj/item/storage/backpack/satchel/flat/empty/custom



/datum/loadout_category/backpack
	category_name = "Back"
	category_ui_icon = FA_ICON_ARCHIVE
	type_to_generate = /datum/loadout_item/backpack
	tab_order = /datum/loadout_category/belt::tab_order + 1


/*
*	LOADOUT ITEM DATUMS FOR THE BACK SLOT
*/
/datum/loadout_item/backpack
	abstract_type = /datum/loadout_item/backpack

/datum/loadout_item/backpack/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)  // don't bother storing in backpack, can't fit
	if(initial(outfit_important_for_life.back))
		return TRUE

/datum/loadout_item/backpack/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.back)
			LAZYADD(outfit.backpack_contents, outfit.back)

	outfit.back = item_path



/datum/loadout_item/backpack
	name = "Custom Backpack"
	item_path = /obj/item/storage/backpack/custom

/datum/loadout_item/backpack/industrial
	name = "Custom Industrial Backpack"
	item_path = /obj/item/storage/backpack/industrial/custom

/datum/loadout_item/backpack/satchel
	name = "Custom Satchel"
	item_path = /obj/item/storage/backpack/satchel/custom

/datum/loadout_item/backpack/satchel/industrial
	name = "Custom Industrial Satchel"
	item_path = /obj/item/storage/backpack/satchel/eng/custom

/datum/loadout_item/backpack/duffel
	name = "Custom Duffelbag"
	item_path = /obj/item/storage/backpack/duffelbag/custom

/datum/loadout_item/backpack/duffel/industrial
	name = "Custom Industrial Duffelbag"
	item_path = /obj/item/storage/backpack/duffelbag/engineering/custom

/datum/loadout_item/backpack/messenger
	name = "Custom Messenger Bag"
	item_path = /obj/item/storage/backpack/messenger/custom

/datum/loadout_item/backpack/messenger/industrial
	name = "Custom Industrial Messenger Bag"
	item_path = /obj/item/storage/backpack/messenger/eng/custom

/datum/loadout_item/backpack/tinypaka
	name = "Custom Waistpack"
	item_path = /obj/item/storage/backpack/tinypaka/custom

/datum/loadout_item/backpack/tinypakb
	name = "Custom Storage Belt"
	item_path = /obj/item/storage/backpack/tinypakb/custom

/datum/loadout_item/backpack/tinypakc
	name = "Custom Chest Pouch"
	item_path = /obj/item/storage/backpack/tinypakc/custom
