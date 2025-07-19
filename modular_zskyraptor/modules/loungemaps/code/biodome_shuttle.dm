/obj/docking_port/mobile/biodome
	name = "base biodome shuttle"
	shuttle_id = "lounge_biodome"
	dir = EAST
	port_direction = EAST

/obj/docking_port/mobile/biodome/dome1
	name = "dome1 shuttle"
	shuttle_id = "lounge_dome1"

/obj/docking_port/mobile/biodome/dome2
	name = "dome2 shuttle"
	shuttle_id = "lounge_dome2"

/datum/controller/subsystem/shuttle
	/// The mobile docking port of the first loaded Biodome shuttle.
	var/obj/docking_port/mobile/biodome/dome1/dome1
	var/obj/docking_port/mobile/biodome/dome2/dome2
