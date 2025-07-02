/datum/armament_entry/company_import/talonarms
	category = TALONARMS_NAME
	company_bitflag = CARGO_COMPANY_TALONARMS

/datum/armament_entry/company_import/talonarms/storage
	subcategory = "Storage"
	cost = PAYCHECK_COMMAND * 0.25

/datum/armament_entry/company_import/talonarms/storage/backpack_custom
	item_type = /obj/item/storage/backpack/custom

/datum/armament_entry/company_import/talonarms/storage/backpack_industrial_custom
	item_type = /obj/item/storage/backpack/industrial/custom

/datum/armament_entry/company_import/talonarms/storage/backpack_duffel_custom
	item_type = /obj/item/storage/backpack/duffelbag/custom

/datum/armament_entry/company_import/talonarms/storage/backpack_duffel_industrial_custom
	item_type = /obj/item/storage/backpack/duffelbag/engineering/custom

/datum/armament_entry/company_import/talonarms/storage/backpack_satchel_custom
	item_type = /obj/item/storage/backpack/satchel/custom

/datum/armament_entry/company_import/talonarms/storage/backpack_satchel_industrial_custom
	item_type = /obj/item/storage/backpack/satchel/eng/custom

/datum/armament_entry/company_import/talonarms/storage/backpack_messenger_custom
	item_type = /obj/item/storage/backpack/messenger/custom

/datum/armament_entry/company_import/talonarms/storage/backpack_messenger_industrial_custom
	item_type = /obj/item/storage/backpack/messenger/eng/custom

/datum/armament_entry/company_import/talonarms/storage/flatpak_custom
	item_type = /obj/item/storage/backpack/satchel/flat/empty/custom

/datum/armament_entry/company_import/talonarms/storage/tinypaka_custom
	item_type = /obj/item/storage/backpack/tinypaka/custom

/datum/armament_entry/company_import/talonarms/storage/tinypakb_custom
	item_type = /obj/item/storage/backpack/tinypakb/custom

/datum/armament_entry/company_import/talonarms/storage/tinypakc_custom
	item_type = /obj/item/storage/backpack/tinypakc/custom

/datum/armament_entry/company_import/talonarms/storage/fannypack_custom
	item_type = /obj/item/storage/belt/fannypack/custom

/datum/armament_entry/company_import/talonarms/storage/fannypack_slim_custom
	item_type = /obj/item/storage/belt/fannypack/custom/alt

/datum/armament_entry/company_import/talonarms/storage/fannypack_tinypaka_custom
	item_type = /obj/item/storage/belt/fannypack/custom/alt_tinypak

/datum/armament_entry/company_import/talonarms/storage/fannypack_tinypakb_custom
	item_type = /obj/item/storage/belt/fannypack/custom/alt_tinypak/altB

/datum/armament_entry/company_import/talonarms/storage/fannypack_tinypakc_custom
	item_type = /obj/item/storage/belt/fannypack/custom/alt_tinypak/altC

/datum/armament_entry/company_import/talonarms/storage/case_dewclaw
	item_type = /obj/item/storage/toolbox/guncase/nova/pistol/talonarms/dewclaw
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/talonarms/guns
	subcategory = "Firearms"
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/talonarms/guns/dewclaw
	item_type = /obj/item/gun/ballistic/revolver_sa/dewclaw
	cost = PAYCHECK_COMMAND * 2
	//it's a .22.  the Rough Rider retails for sub-$100 frequently.  i think most people can afford it

/datum/armament_entry/company_import/talonarms/misc
	subcategory = "Misc"
	cost = PAYCHECK_COMMAND * 0.25

/datum/armament_entry/company_import/talonarms/misc/repainter
	item_type = /obj/item/repainting_kit
