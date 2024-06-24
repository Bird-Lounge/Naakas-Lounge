/// A file to help with making it possible to load the Interlink *modularly* instead of leaving it stuck in Z-2 where station should be and spawning all manner of bad behaviour.
#define INIT_ANNOUNCE(X) to_chat(world, span_boldannounce("[X]")); log_world(X)

#define ZTRAITS_BIODOME list(ZTRAIT_CENTCOM = TRUE, ZTRAIT_NOPHASE = TRUE, ZTRAIT_BASETURF = /turf/open/misc/dirt/planet) /// NAAKAS-LOUNGE ADDITION

/datum/controller/subsystem/mapping/loadWorld()
	. = ..()
	var/list/FailedZsRat = list()
	LoadGroup(FailedZsRat, "The Interlink", "map_files/generic", "CentCom_nova_z2.dmm", default_traits = ZTRAITS_CENTCOM)
	LoadGroup(FailedZsRat, "Talon IV-a: The Biodome", "map_files/generic", "Biodome.dmm", default_traits = ZTRAITS_BIODOME) /// NAAKAS-LOUNGE ADDITION
	if(LAZYLEN(FailedZsRat)) //but seriously, unless the server's filesystem is messed up this will never happen
		var/msg = "RED ALERT! The following map files failed to load: [FailedZsRat[1]]"
		if(FailedZsRat.len > 1)
			for(var/I in 2 to FailedZsRat.len)
				msg += ", [FailedZsRat[I]]"
		msg += ". Yell at your server host!"
		INIT_ANNOUNCE(msg)

#undef INIT_ANNOUNCE

#undef ZTRAITS_BIODOME /// NAAKAS-LOUNGE ADDITION
