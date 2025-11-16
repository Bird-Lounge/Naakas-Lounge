/obj/item/storage/hypospraykit
	icon = 'modular_zskyraptor/modules/hyposprays/icons/hypokits.dmi'

/// Bespoke subtypes for Naaka's Lounge - the Biodome, specifically
/obj/item/storage/hypospraykit/cmo/combat/naaka
	name = "the ko's hypospray kit"
	desc = "A larger tactical hypospray kit containing a customized deluxe hypospray and vials of potent healing mixes.  This one has special mounts so it still runs off pockets."
	icon_state = "naakako-mini"
	current_case = "naakako"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/hypospraykit/cmo/combat/naaka/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/deluxe/cmo/combat/naaka(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/numbing(src)
	new /obj/item/reagent_containers/cup/vial/large/snatchpatch(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/nanite_slurry(src)
	new /obj/item/reagent_containers/cup/vial/large/nanite_slurry(src)
	new /obj/item/reagent_containers/cup/vial/large/system_cleaner(src)
	new /obj/item/reagent_containers/cup/vial/large/liquid_solder(src)

/obj/item/storage/hypospraykit/cmo/combat/naaka/haki
	name = "hakitchaya's hypospray kit"
	desc = "A larger tactical hypospray kit containing a customized deluxe hypospray and vials of potent healing mixes...and meth.  This one has special mounts so it still runs off pockets."
	icon_state = "haki-mini"
	current_case = "haki"

/obj/item/storage/hypospraykit/cmo/combat/naaka/haki/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/deluxe/cmo/combat/naaka/haki(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/meth(src)

/obj/item/storage/hypospraykit/cmo/combat/naaka/shaman
	name = "the shaman's hypospray kit"
	icon_state = "shaman-mini"
	current_case = "shaman"

/obj/item/storage/hypospraykit/cmo/combat/naaka/shaman/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/deluxe/cmo/combat/naaka/shaman(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/numbing(src)
	new /obj/item/reagent_containers/cup/vial/large/snatchpatch(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/nanite_slurry(src)
	new /obj/item/reagent_containers/cup/vial/large/nanite_slurry(src)
	new /obj/item/reagent_containers/cup/vial/large/system_cleaner(src)
	new /obj/item/reagent_containers/cup/vial/large/liquid_solder(src)

/obj/item/storage/hypospraykit/cmo/combat/naaka/herbalist
	name = "the herbalist's hypospray kit"
	icon_state = "herbalist-mini"
	current_case = "herbalist"

/obj/item/storage/hypospraykit/cmo/combat/naaka/herbalist/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/deluxe/cmo/combat/naaka/herbalist(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/numbing(src)
	new /obj/item/reagent_containers/cup/vial/large/meth(src)
	new /obj/item/reagent_containers/cup/vial/large/snatchpatch(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/caramel(src)
	new /obj/item/reagent_containers/cup/vial/large/caramel(src)
	new /obj/item/reagent_containers/cup/vial/large/caramel(src)

/obj/item/storage/hypospraykit/cmo/combat/naaka/luna
	name = "luna's hypospray kit"
	icon_state = "luna-mini"
	current_case = "luna"

/obj/item/storage/hypospraykit/cmo/combat/naaka/luna/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/deluxe/cmo/combat/naaka/luna(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/numbing(src)
	new /obj/item/reagent_containers/cup/vial/large/snatchpatch(src)
	new /obj/item/reagent_containers/cup/vial/large/snatchpatch(src)
	new /obj/item/reagent_containers/cup/vial/large/snatchpatch(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)
	new /obj/item/reagent_containers/cup/vial/large/sleepytime(src)

/obj/item/storage/hypospraykit/cmo/combat/naaka/hugs
	name = "hugs' hypospray kit"
	icon_state = "hugs-mini"
	current_case = "hugs"

/obj/item/storage/hypospraykit/cmo/combat/naaka/hugs/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/deluxe/cmo/combat/naaka/hugs(src)
	new /obj/item/reagent_containers/cup/vial/large/advbrute(src)
	new /obj/item/reagent_containers/cup/vial/large/advburn(src)
	new /obj/item/reagent_containers/cup/vial/large/advtox(src)
	new /obj/item/reagent_containers/cup/vial/large/advoxy(src)
	new /obj/item/reagent_containers/cup/vial/large/advcrit(src)
	new /obj/item/reagent_containers/cup/vial/large/advomni(src)
	new /obj/item/reagent_containers/cup/vial/large/meth(src)
	new /obj/item/reagent_containers/cup/vial/large/nanite_slurry(src)
	new /obj/item/reagent_containers/cup/vial/large/nanite_slurry(src)
	new /obj/item/reagent_containers/cup/vial/large/nanite_slurry(src)
	new /obj/item/reagent_containers/cup/vial/large/nanite_slurry(src)
	new /obj/item/reagent_containers/cup/vial/large/system_cleaner(src)
	new /obj/item/reagent_containers/cup/vial/large/system_cleaner(src)
	new /obj/item/reagent_containers/cup/vial/large/liquid_solder(src)



/datum/greyscale_config/hypokit
	name = "Hypospray Kit"
	icon_file = 'modular_zskyraptor/modules/hyposprays/icons/hypokits.dmi'
	json_config = 'modular_zskyraptor/modules/hyposprays/greyscale/hypokit.json'
