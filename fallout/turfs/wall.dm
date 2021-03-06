/turf/closed/wall/f13
	name = "base class wall"
	desc = "God has abandoned us"
	smoothing_flags = SMOOTH_BORDER|SMOOTH_SIMPLE
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/wall/f13/metal
	name = "metal wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/metal.dmi'
	icon_state = "metal0"
	icon_type_smooth = "metal"
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_METAL,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_METAL,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/wall/f13/metal/rust
	name = "rusted metal wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/rust.dmi'
	icon_state = "rust0"
	icon_type_smooth = "rust"

/turf/closed/wall/f13/wood
	name = "wood wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/wood.dmi'
	icon_state = "wood0"
	icon_type_smooth = "wood"
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_WOOD,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_WOOD,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/wall/f13/scrap
	name = "scrap wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/scrap.dmi'
	icon_state = "scrap0"
	icon_type_smooth = "scrap"
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_SCRAP,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_SCRAP,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/wall/f13/adobe
	name = "adobe wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/adobe.dmi'
	icon_state = "adobe0"
	icon_type_smooth = "adobe"
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_ADOBE,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_ADOBE,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/wall/f13/brick
	name = "brick wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/brick.dmi'
	icon_state = "brick0"
	icon_type_smooth = "brick"
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_BRICK,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_BRICK,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/wall/r_wall/f13
	name = "base class wall"
	desc = "AHHH FUCK A BASE CLASS WALL"
	smoothing_flags = SMOOTH_BORDER|SMOOTH_SIMPLE
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_REINFORCED,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_REINFORCED,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/wall/r_wall/f13/metal
	name = "reinforced metal wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/reinforced_metal.dmi'
	icon_state = "reinforced_metal0"
	icon_type_smooth = "reinforced_metal"
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_METAL,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_METAL,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/wall/r_wall/f13/metal/rust
	name = "rusted reinforced metal wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/reinforced_rust.dmi'
	icon_state = "reinforced_rust0"
	icon_type_smooth = "reinforced_rust"

/turf/closed/wall/r_wall/f13/bunker
	name = "bunker wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/bunker.dmi'
	icon_state = "bunker0"
	icon_type_smooth = "bunker"
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_METAL,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_METAL,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/indestructible/f13

/turf/closed/indestructible/f13/metal
	name = "metal wall"
	desc = ""
	icon = 'fallout/icons/turf/walls/metal.dmi'
	icon_state = "metal0"
	icon_type_smooth = "metal"
	smoothing_groups = list(SMOOTH_GROUP_FALLOUT_WALL_METAL,SMOOTH_GROUP_FALLOUT_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_FALLOUT_WALL_METAL,SMOOTH_GROUP_FALLOUT_WINDOW)

/turf/closed/indestructible/f13/matrix
	name = "the matrix"
	desc = "Looking at this gives you the feeling the physical world is very limited... (Click and drag yourself on this to remove your current character from the round.)"
	icon = 'fallout/icons/turf/walls/matrix.dmi'
	icon_state = "matrix"

/turf/closed/indestructible/f13/matrix/MouseDrop_T(atom/dropping, mob/user)
	. = ..()
	if(dropping != user)
		return //You can only matrix yourself.
	if(!isliving(user) || user.incapacitated())
		return //No ghosts or incapacitated folk allowed to do this.
	var/mob/living/departing_mob = dropping
	if(alert("Are you sure you want to depart the area for good? Your character will be removed from the current round, if you're playing an important job please adminhelp (F1 button) first to let admins know, or if no admins are available try to promote somebody else in your faction to your job and hand them your gear.", "Departing the Wasteland", "Confirm", "Cancel") != "Confirm")
		return
	if(QDELETED(departing_mob) || departing_mob.incapacitated() || !isliving(departing_mob) || get_dist(src, dropping) > 2)
		return //Things have changed since the alert happened.
	var/dat = "[key_name(user)] has despawned themselves, job [departing_mob.job], at [AREACOORD(src)]. Contents despawned along:"
	var/list/stuff = list()
	for(var/thing in departing_mob.GetAllContents())
		if(isobj(thing))
			stuff += "[thing]"
	dat = "[dat] [stuff.Join(", ")]."
	message_admins(dat)
	log_admin(dat)
	departing_mob.visible_message("<span class='notice'>[departing_mob] crosses the border and departs the wasteland.</span>")
	if(iscyborg(departing_mob))
		var/mob/living/silicon/robot/cyborg = departing_mob
		QDEL_NULL(cyborg.mmi) //When you qdel borgs they drop an MMI, so this is needed.
	qdel(departing_mob)
