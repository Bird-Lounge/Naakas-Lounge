/mob/living/simple_animal/hostile/ooze/Initialize(mapload)
	. = ..()
	// Allow necessary functions to avoid erroring before dying.
	QDEL_NULL(src)
	// Send them straight to nullspace.  All of them.

/datum/action/consume/New(target)
	. = ..()
	// Prevents this from being added manually.
	Remove(target)
