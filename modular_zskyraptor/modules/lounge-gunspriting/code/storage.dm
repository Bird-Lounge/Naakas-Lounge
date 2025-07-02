/obj/item/storage/toolbox/guncase/nova/pistol/talonarms
	icon = 'modular_zskyraptor/modules/lounge-gunspriting/icons/storage.dmi'
	icon_state = "dewclaw_case"
	worn_icon_state = "taloncase"
	inhand_icon_state = "taloncase"

/obj/item/storage/toolbox/guncase/nova/pistol/talonarms/examine(mob/user)
	. = ..()
	. += "<i>A 3-clawed raptoral paw is stamped in gemstone next to the label of <b>[span_green("Talon Armaments")]</b> prominently on the top.</i>"



/// =========================
/// ACTUAL GUNSETS BEGIN HERE
/// =========================
/obj/item/storage/toolbox/guncase/nova/pistol/talonarms/dewclaw
	name = "\improper Talon Arms 'Dewclaw' Case"

/obj/item/storage/toolbox/guncase/nova/pistol/talonarms/dewclaw/gunset
	name = "\improper Talon Arms 'Dewclaw' Gunset"
	weapon_to_spawn = /obj/item/gun/ballistic/revolver_sa/dewclaw
	extra_to_spawn = /obj/item/ammo_box/c22talon
