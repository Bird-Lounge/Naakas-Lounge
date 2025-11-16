/datum/map_template/shuttle/biodome
	port_id = "biodome_pad"
	name = "Base Shuttle Template (Biodome)"
	credit_cost = 0
	occupancy_limit = "Flexible"
	who_can_purchase = list(ACCESS_MAINT_TUNNELS)
	prefix = "_maps/shuttles/nova/lounge/"

/datum/map_template/shuttle/biodome/New()
	. = ..()
	if(!occupancy_limit && who_can_purchase)
		CRASH("The [name] needs an occupancy limit!")

///on post_load use our variables to change shuttle events
/datum/map_template/shuttle/biodome/post_load(obj/docking_port/mobile/mobile)
	. = ..()
	//no events, we probably don't need this here but WOOP

/datum/map_template/shuttle/biodome/naakatest
	suffix = "naakatest"
	name = "Naaka's Test Craft"
	description = "You fools, you let some green dipshit design a spaceship!"
	admin_notes = "Bare-minimum shuttle for verifying functionality of the Biodome landing pads."

/datum/map_template/shuttle/biodome/naakatest_two
	suffix = "naakatest_two"
	name = "Naaka's Second Test Craft"
	description = "You fools, you let some green dipshit design a SECOND spaceship!"
	admin_notes = "Bare-minimum shuttle for verifying functionality of the Biodome landing pads."
