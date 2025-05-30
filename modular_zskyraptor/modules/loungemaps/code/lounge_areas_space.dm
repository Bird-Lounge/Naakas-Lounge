/area/station/biodome_tinystation
	icon = 'modular_zskyraptor/modules/loungemaps/icons/areas.dmi'
	icon_state = "tinystation"
	name = "Talon IV-a Orbital"
	airlock_wires = /datum/wires/airlock

/area/station/biodome_tinystation/halls
	icon_state = "tinystation_halls"
	name = "T-IV-a Orbital Main Halls"

/area/station/biodome_tinystation/halls/fore
	icon_state = "tinystation_halls_fore"
	name = "T-IV-a Orbital Fore Halls"

/area/station/biodome_tinystation/halls/aft
	icon_state = "tinystation_halls_aft"
	name = "T-IV-a Orbital Aft Halls"

/area/station/biodome_tinystation/halls/port
	icon_state = "tinystation_halls_port"
	name = "T-IV-a Orbital Port Halls"

/area/station/biodome_tinystation/halls/starboard
	icon_state = "tinystation_halls_starboard"
	name = "T-IV-a Orbital Starboard Halls"

// maints
/area/station/maintenance/biodome_tinystation
	icon = 'modular_zskyraptor/modules/loungemaps/icons/areas.dmi'
	icon_state = "tinystation_maints"
	name = "T-IV-a Orbital Maints"
	airlock_wires = /datum/wires/airlock/maint

//bridge
/area/station/biodome_tinystation/bridge
	icon_state = "tinystation_bridge"
	name = "T-IV-a Orbital Bridge"
	ambientsounds = list(
		'sound/ambience/misc/signal.ogg',
		)
	sound_environment = SOUND_AREA_STANDARD_STATION
	airlock_wires = /datum/wires/airlock/command

/area/station/biodome_tinystation/bridge/cappy
	icon_state = "tinystation_bridge_cappy"
	name = "T-IV-a Orbital Captain's Office"

//medbay
/area/station/biodome_tinystation/medbay
	icon_state = "biodome_medbay"
	name = "T-IV-a Orbital Medbay"
	ambience_index = AMBIENCE_MEDICAL
	sound_environment = SOUND_AREA_STANDARD_STATION
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS
	airlock_wires = /datum/wires/airlock/medbay

/area/station/biodome_tinystation/medbay/lobby
	icon_state = "biodome_medbay_lobby"
	name = "T-IV-a Orbital Medbay Lobby"

/area/station/biodome_tinystation/medbay/chemistry
	icon_state = "biodome_medbay_chemistry"
	name = "T-IV-a Orbital Medbay Chemlab"

/area/station/biodome_tinystation/medbay/pharmacy
	icon_state = "biodome_medbay_pharmacy"
	name = "T-IV-a Orbital Medbay Pharmacy"

/area/station/biodome_tinystation/medbay/offices
	icon_state = "biodome_medbay_offices"
	name = "T-IV-a Orbital Medbay Offices"

/area/station/biodome_tinystation/medbay/surgery
	icon_state = "biodome_medbay_surgery"
	name = "T-IV-a Orbital Medbay Surgical Ward"

/area/station/biodome_tinystation/medbay/icu
	icon_state = "biodome_medbay_icu"
	name = "T-IV-a Orbital Medbay ICU"

/area/station/biodome_tinystation/medbay/chief
	icon_state = "tinystation_medbay_cmo"
	name = "T-IV-a Orbital CMO's Office"
	airlock_wires = /datum/wires/airlock/command
	ambientsounds = list(
		'sound/ambience/misc/signal.ogg',
		)

//engineering
/area/station/biodome_tinystation/engineering
	icon_state = "biodome_engineering"
	name = "T-IV-a Orbital Engineering"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_STANDARD_STATION
	airlock_wires = /datum/wires/airlock/engineering

/area/station/biodome_tinystation/engineering/engine
	icon_state = "biodome_engineering_engine"
	name = "T-IV-a Orbital Engine Room"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED

/area/station/biodome_tinystation/engineering/engine/sm
	icon_state = "biodome_engineering_engine"
	name = "T-IV-a Orbital Supermatter"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/biodome_tinystation/engineering/atmos
	icon_state = "biodome_engineering_atmos"
	name = "T-IV-a Orbital Atmospherics"

/area/station/biodome_tinystation/engineering/chief
	icon_state = "tinystation_engineering_ce"
	name = "T-IV-a Orbital CE's Office"
	airlock_wires = /datum/wires/airlock/command
	ambientsounds = list(
		'sound/ambience/misc/signal.ogg',
		)

//cargo
/area/station/biodome_tinystation/cargo
	icon_state = "biodome_cargo"
	name = "T-IV-a Orbital Cargo Bay"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED
	airlock_wires = /datum/wires/airlock/cargo

/area/station/biodome_tinystation/cargo/pad
	icon_state = "biodome_cargo_pad"
	name = "T-IV-a Orbital Cargo Pad"

/area/station/biodome_tinystation/cargo/chief
	icon_state = "tinystation_cargo_qm"
	name = "T-IV-a Orbital QM's Office"
	airlock_wires = /datum/wires/airlock/command
	ambientsounds = list(
		'sound/ambience/misc/signal.ogg',
		)

//service
/area/station/biodome_tinystation/service
	icon_state = "biodome_service"
	name = "T-IV-a Orbital Service"
	sound_environment = SOUND_AREA_STANDARD_STATION
	airlock_wires = /datum/wires/airlock/service

/area/station/biodome_tinystation/service/botany
	icon_state = "biodome_service_botany"
	name = "T-IV-a Orbital Botany"

/area/station/biodome_tinystation/service/diner
	icon_state = "biodome_service_diner"
	name = "T-IV-a Orbital Diner"

/area/station/biodome_tinystation/service/bar
	icon_state = "biodome_service_bar"
	name = "T-IV-a Orbital Bar"

/area/station/biodome_tinystation/service/lounge
	icon_state = "biodome_service_lounge"
	name = "T-IV-a Orbital Lounge"

/area/station/biodome_tinystation/service/library
	icon_state = "biodome_service_library"
	name = "T-IV-a Orbital Library"

/area/station/biodome_tinystation/service/theatre
	icon_state = "biodome_service_theatre"
	name = "T-IV-a Orbital Theatre"

/area/station/biodome_tinystation/service/chief
	icon_state = "tinystation_service_hop"
	name = "T-IV-a Orbital HOP's Office"
	airlock_wires = /datum/wires/airlock/command
	ambientsounds = list(
		'sound/ambience/misc/signal.ogg',
		)

//science
/area/station/biodome_tinystation/science
	icon_state = "biodome_science"
	name = "T-IV-a Orbital R&D"
	ambience_index = AMBIENCE_MEDICAL
	sound_environment = SOUND_AREA_STANDARD_STATION
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS
	airlock_wires = /datum/wires/airlock/science

/area/station/biodome_tinystation/science/genetics
	icon_state = "biodome_science_genetics"
	name = "T-IV-a Orbital Genetics"

/area/station/biodome_tinystation/science/robotics
	icon_state = "biodome_science_robotics"
	name = "T-IV-a Orbital Robotics"

/area/station/biodome_tinystation/science/chief
	icon_state = "tinystation_science_rd"
	name = "T-IV-a Orbital RD's Office"
	airlock_wires = /datum/wires/airlock/command
	ambientsounds = list(
		'sound/ambience/misc/signal.ogg',
		)

//security
/area/station/biodome_tinystation/security
	icon_state = "biodome_security"
	name = "T-IV-a Orbital Security"
	ambience_index = AMBIENCE_DANGER
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/biodome_tinystation/security/prison
	icon_state = "biodome_security"
	name = "T-IV-a Orbital Prison"

/area/station/biodome_tinystation/security/prison/cell1
	icon_state = "biodome_security_cell1"
	name = "T-IV-a Orbital Prison Cell 1"

/area/station/biodome_tinystation/security/prison/cell2
	icon_state = "biodome_security_cell2"
	name = "T-IV-a Orbital Prison Cell 2"

/area/station/biodome_tinystation/security/offices
	icon_state = "biodome_security_syndicat"
	name = "T-IV-a Orbital Sec Offices"

/area/station/biodome_tinystation/security/chief
	icon_state = "tinystation_security_hos"
	name = "T-IV-a Orbital HOS' Office"
	airlock_wires = /datum/wires/airlock/command
	ambientsounds = list(
		'sound/ambience/misc/signal.ogg',
		)
