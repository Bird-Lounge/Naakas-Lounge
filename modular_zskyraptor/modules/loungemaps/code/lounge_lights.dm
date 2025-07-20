/obj/structure/streetlamp
	icon = 'modular_zskyraptor/modules/loungemaps/icons/lights.dmi'
	icon_state = "streetlamp_on"
	base_icon_state = "streetlamp"
	name = "street lamp"
	desc = "Lights up the night and makes towns look cozy."

	///Overlay icon file
	var/overlay_icon = 'modular_zskyraptor/modules/loungemaps/icons/lights.dmi'
	///Base light stats
	var/base_range = 9
	var/base_color = "#FFFAF7"
	var/base_power = 1.1

	///Is the light on?
	var/on = TRUE
	///Because colored lighting is complicated :(
	var/mutable_appearance/light_overlay
	var/mutable_appearance/lightmask_overlay

/obj/structure/streetlamp/Initialize(mapload)
	. = ..()
	update_icon_state()

/obj/structure/streetlamp/update_icon_state()
	. = ..()
	cut_overlays()
	var/state = "off"
	if(on)
		state = "on"
	icon_state = "[base_icon_state]_[state]"
	update_lighting()
	if(on == TRUE)
		if(light_overlay == null)
			light_overlay = new()
		if(lightmask_overlay == null)
			lightmask_overlay = new()
		light_overlay.icon_state = "[base_icon_state]_overlay"
		light_overlay.color = light_color
		lightmask_overlay.icon_state = light_overlay.icon_state
		lightmask_overlay.color = GLOB.emissive_color
		//SET_PLANE_EXPLICIT(light_overlay, ABOVE_LIGHTING_PLANE, src) //gloooooooow
		SET_PLANE_EXPLICIT(lightmask_overlay, EMISSIVE_PLANE, src) //gloooooooow
		add_overlay(light_overlay)
		add_overlay(lightmask_overlay)

/obj/structure/streetlamp/proc/update_lighting()
	if(on == TRUE)
		set_light(l_range = base_range, l_power = base_power, l_color = base_color, l_angle = 360, l_dir = dir)
	else
		set_light(l_range = 0, l_power = base_power, l_color = base_color, l_angle = 360, l_dir = dir)

/obj/structure/streetlamp/attackby(obj/item/attacking_item, mob/user, params)
	. = ..()
	if(attacking_item.tool_behaviour == TOOL_SCREWDRIVER) /// Deconstruct with screwdrivers
		new /obj/item/stack/sheet/iron/five(drop_location())
		new /obj/item/stack/sheet/glass(drop_location())
		qdel(src)
	return

/obj/structure/streetlamp/interact(mob/user)
	. = ..()
	on = !on
	update_icon_state()
	return

/obj/structure/streetlamp/click_alt(mob/user)
	. = ..()
	var/temp_col = input("Enter new color:", "Color", src.base_color) as color|null
	if(temp_col != null)
		src.base_color = temp_col
		update_icon_state()
	return

/// Crafting recipe for
/datum/crafting_recipe/streetlamp
	name = "Street Lamp"
	result = /obj/structure/streetlamp
	time = 5 SECONDS
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/sheet/glass = 1,
	)
	category = CAT_STRUCTURE
	tool_behaviors = list(TOOL_SCREWDRIVER)
