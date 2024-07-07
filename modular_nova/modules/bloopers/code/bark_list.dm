/datum/controller/global_vars/Initialize()
	. = ..()
	for(var/blooper_path in subtypesof(/datum/blooper))
		var/datum/blooper/bloop = new blooper_path()
		GLOB.blooper_list[bloop.id] = bloop
		if(bloop.allow_random)
			GLOB.blooper_random_list[bloop.id] = bloop

/datum/blooper/mutedc2
	name = "Muted String (Low)"
	id = "mutedc2"
	soundpath = 'sound/runtime/instruments/synthesis_samples/guitar/crisis_muted/C2.ogg'
	allow_random = TRUE

/datum/blooper/mutedc3
	name = "Muted String (Medium)"
	id = "mutedc3"
	soundpath = 'sound/runtime/instruments/synthesis_samples/guitar/crisis_muted/C3.ogg'
	allow_random = TRUE

/datum/blooper/mutedc4
	name = "Muted String (High)"
	id = "mutedc4"
	soundpath = 'sound/runtime/instruments/synthesis_samples/guitar/crisis_muted/C4.ogg'
	allow_random = TRUE

/datum/blooper/banjoc3
	name = "Banjo (Medium)"
	id = "banjoc3"
	soundpath = 'sound/runtime/instruments/banjo/Cn3.ogg'
	allow_random = TRUE

/datum/blooper/banjoc4
	name = "Banjo (High)"
	id = "banjoc4"
	soundpath = 'sound/runtime/instruments/banjo/Cn4.ogg'
	allow_random = TRUE

/datum/blooper/squeaky
	name = "Squeaky"
	id = "squeak"
	soundpath = 'sound/items/toysqueak1.ogg'
	maxspeed = 4

/datum/blooper/beep
	name = "Beepy"
	id = "beep"
	soundpath = 'sound/machines/terminal_select.ogg'
	maxpitch = 1 //Bringing the pitch higher just hurts your ears :<
	maxspeed = 4 //This soundbyte's too short for larger speeds to not sound awkward

/datum/blooper/chitter
	name = "Chittery"
	id = "chitter"
	minspeed = 4 //Even with the sound being replaced with a unique, shorter sound, this is still a little too long for higher speeds
	soundpath = 'modular_nova/modules/bloopers/sound/chitter.ogg'

/datum/blooper/synthetic_grunt
	name = "Synthetic (Grunt)"
	id = "synthgrunt"
	soundpath = 'sound/misc/bloop.ogg'

/datum/blooper/synthetic
	name = "Synthetic (Normal)"
	id = "synth"
	soundpath = 'sound/machines/uplinkerror.ogg'

/datum/blooper/bullet
	name = "Windy"
	id = "bullet"
	maxpitch = 1.6
	soundpath = 'sound/weapons/bulletflyby.ogg'

/datum/blooper/coggers
	name = "Brassy"
	id = "coggers"
	soundpath = 'sound/machines/clockcult/integration_cog_install.ogg'

/datum/blooper/moff/short
	name = "Moff squeak"
	id = "moffsqueak"
	soundpath = 'modular_nova/modules/bloopers/sound/mothsqueak.ogg'
	allow_random = TRUE
	ignore = FALSE

/datum/blooper/meow //Meow blooper?
	name = "Meow"
	id = "meow"
	allow_random = TRUE
	soundpath = 'modular_nova/modules/bloopers/sound/meow1.ogg'
	minspeed = 5
	maxspeed = 11

/datum/blooper/chirp
	name = "Chirp"
	id = "chirp"
	allow_random = TRUE
	soundpath = 'modular_nova/modules/bloopers/sound/chirp.ogg'

/datum/blooper/caw
	name = "Caw"
	id = "caw"
	allow_random = TRUE
	soundpath = 'modular_nova/modules/bloopers/sound/caw.ogg'

//Undertale
/datum/blooper/alphys
	name = "Alphys"
	id = "alphys"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_alphys.ogg'
	minvariance = 0

/datum/blooper/asgore
	name = "Asgore"
	id = "asgore"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_asgore.ogg'
	minvariance = 0

/datum/blooper/flowey
	name = "Flowey (normal)"
	id = "flowey1"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_flowey_1.ogg'
	minvariance = 0

/datum/blooper/flowey/evil
	name = "Flowey (evil)"
	id = "flowey2"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_flowey_2.ogg'
	minvariance = 0

/datum/blooper/papyrus
	name = "Papyrus"
	id = "papyrus"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_papyrus.ogg'
	minvariance = 0

/datum/blooper/ralsei
	name = "Ralsei"
	id = "ralsei"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_ralsei.ogg'
	minvariance = 0

/datum/blooper/sans //real
	name = "Sans"
	id = "sans"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_sans.ogg'
	minvariance = 0

/datum/blooper/toriel
	name = "Toriel"
	id = "toriel"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_toriel.ogg'
	minvariance = 0
	maxpitch = BLOOPER_DEFAULT_MAXPITCH*2

/datum/blooper/undyne
	name = "Undyne"
	id = "undyne"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_undyne.ogg'
	minvariance = 0

/datum/blooper/temmie
	name = "Temmie"
	id = "temmie"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_temmie.ogg'
	minvariance = 0

/datum/blooper/susie
	name = "Susie"
	id = "susie"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_susie.ogg'
	minvariance = 0

/datum/blooper/gaster
	name = "Gaster"
	id = "gaster"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_gaster_1.ogg'
	soundpath_list = list(
		'modular_nova/modules/bloopers/sound/undertale/voice_gaster_1.ogg',
		'modular_nova/modules/bloopers/sound/undertale/voice_gaster_2.ogg',
		'modular_nova/modules/bloopers/sound/undertale/voice_gaster_3.ogg',
		'modular_nova/modules/bloopers/sound/undertale/voice_gaster_4.ogg',
		'modular_nova/modules/bloopers/sound/undertale/voice_gaster_5.ogg',
		'modular_nova/modules/bloopers/sound/undertale/voice_gaster_6.ogg',
		'modular_nova/modules/bloopers/sound/undertale/voice_gaster_7.ogg',)
	minvariance = 0

/datum/blooper/mettaton
	name = "Mettaton"
	id = "mettaton"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_metta_1.ogg'
	minvariance = 0

/datum/blooper/gen_monster
	name = "Generic Monster 1"
	id = "gen_monster_1"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_monster1.ogg'
	minvariance = 0

/datum/blooper/gen_monster/alt
	name = "Generic Monster 2"
	id = "gen_monster_2"
	soundpath = 'modular_nova/modules/bloopers/sound/undertale/voice_monster2.ogg'
	minvariance = 0

/datum/blooper/wilson
	name = "Wilson"
	id = "wilson"
	soundpath = 'modular_nova/modules/bloopers/sound/dont_starve/wilson_blooper.ogg'

/datum/blooper/wolfgang
	name = "Wolfgang"
	id = "wolfgang"
	soundpath = 'modular_nova/modules/bloopers/sound/dont_starve/wolfgang_blooper.ogg'
	minspeed = 4
	maxspeed = 10

/datum/blooper/woodie
	name = "Woodie"
	id = "woodie"
	soundpath = 'modular_nova/modules/bloopers/sound/dont_starve/woodie_blooper.ogg'
	minspeed = 4
	maxspeed = 10

/datum/blooper/wurt
	name = "Wurt"
	id = "wurt"
	soundpath = 'modular_nova/modules/bloopers/sound/dont_starve/wurt_blooper.ogg'

/datum/blooper/wx78
	name = "wx78"
	id = "wx78"
	soundpath = 'modular_nova/modules/bloopers/sound/dont_starve/wx78_blooper.ogg'
	minspeed = 3
	maxspeed = 9

/datum/blooper/blub
	name = "Blub"
	id = "blub"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/blub.ogg'

/datum/blooper/bottalk
	name = "Bottalk 1"
	id = "bottalk1"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/bottalk_1.ogg'
	minspeed = 3
	maxspeed = 9

/datum/blooper/bottalk/alt1
	name = "Bottalk 2"
	id = "bottalk2"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/bottalk_2.ogg'

/datum/blooper/bottalk/alt2
	name = "Bottalk 3"
	id = "bottalk3"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/bottalk_3.ogg'

/datum/blooper/bottalk/alt3
	name = "Bottalk 4"
	id = "bottalk4"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/bottalk_4.ogg'

/datum/blooper/buwoo
	name = "Buwoo"
	id = "buwoo"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/buwoo.ogg'

/datum/blooper/cow
	name = "Cow"
	id = "cow"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/cow.ogg'

/datum/blooper/lizard
	name = "Lizard"
	id = "lizard"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/lizard.ogg'

/datum/blooper/pug
	name = "Pug"
	id = "pug"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/pug.ogg'

/datum/blooper/pugg
	name = "Pugg"
	id = "pugg"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/pugg.ogg'

/datum/blooper/radio
	name = "Radio 1"
	id = "radio1"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/radio.ogg'

/datum/blooper/radio/short
	name = "Radio 2"
	id = "radio2"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/radio2.ogg'

/datum/blooper/radio/ai
	name = "Radio (AI)"
	id = "radio_ai"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/radio_ai.ogg'

/datum/blooper/roach //Turkish characters be like
	name = "Roach"
	id = "roach"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/roach.ogg'

/datum/blooper/skelly
	name = "Skelly"
	id = "skelly"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/skelly.ogg'

/datum/blooper/speak
	name = "Speak 1"
	id = "speak1"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/speak_1.ogg'

/datum/blooper/speak/alt1
	name = "Speak 2"
	id = "speak2"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/speak_2.ogg'

/datum/blooper/speak/alt2
	name = "Speak 3"
	id = "speak3"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/speak_3.ogg'

/datum/blooper/speak/alt3
	name = "Speak 4"
	id = "speak4"
	soundpath = 'modular_nova/modules/bloopers/sound/goon/sound/speak_4.ogg'

/datum/blooper/chitter/alt
	name = "Chittery Alt"
	id = "chitter2"
	soundpath = 'modular_nova/modules/bloopers/sound/moth/mothchitter2.ogg'

// The Mayhem Special
/datum/blooper/whistle
	name = "Whistle 1"
	id = "whistle1"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/birdwhistle.ogg'

/datum/blooper/whistle/alt1
	name = "Whistle 2"
	id = "whistle2"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/birdwhistle2.ogg'

/datum/blooper/caw/alt1
	name = "Caw 2"
	id = "caw2"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/caw.ogg'
	minspeed = 4
	maxspeed = 9

/datum/blooper/caw/alt2
	name = "Caw 3"
	id = "caw3"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/caw2.ogg'
	minspeed = 3
	maxspeed = 9

/datum/blooper/caw/alt3
	name = "Caw 4"
	id = "caw4"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/caw3.ogg'
	minspeed = 3
	maxspeed = 9

/datum/blooper/ehh
	name = "Ehh 1"
	id = "ehh1"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/ehh.ogg'
	minspeed = 3
	maxspeed = 9

/datum/blooper/ehh/alt1
	name = "Ehh 2"
	id = "ehh2"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/ehh2.ogg'

/datum/blooper/ehh/alt2
	name = "Ehh 3"
	id = "ehh3"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/ehh3.ogg'

/datum/blooper/ehh/alt3
	name = "Ehh 4"
	id = "ehh4"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/ehh4.ogg'
	minspeed = 3
	maxspeed = 9

/datum/blooper/ehh/alt5
	name = "Ehh 5"
	id = "ehh5"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/ehh5.ogg'

/datum/blooper/faucet
	name = "Faucet 1"
	id = "faucet1"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/faucet.ogg'

/datum/blooper/faucet/alt1
	name = "Faucet 2"
	id = "faucet2"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/faucet2.ogg'

/datum/blooper/ribbit
	name = "Ribbit"
	id = "ribbit"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/ribbit.ogg'

/datum/blooper/hoot
	name = "Hoot"
	id = "hoot"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/hoot.ogg'
	minspeed = 4
	maxspeed = 9

/datum/blooper/tweet
	name = "Tweet"
	id = "tweet"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/tweet.ogg'

/datum/blooper/dwoop
	name = "Dwoop"
	id = "dwoop"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/dwoop.ogg'
	minspeed = 3
	maxspeed = 9

/datum/blooper/uhm
	name = "Uhm"
	id = "uhm"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/uhm.ogg'

/datum/blooper/wurtesh
	name = "Wurtesh"
	id = "wurtesh"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/wurble1.ogg'

/datum/blooper/chitter2
	name = "Chitter2"
	id = "chitter2"
	soundpath = 'modular_nova/modules/bloopers/sound/kazooie/chitter1.ogg'
