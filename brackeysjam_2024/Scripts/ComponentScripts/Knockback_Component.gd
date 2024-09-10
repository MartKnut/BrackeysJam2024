extends Node2D
class_name KnockbackComponent

var kbdirection := Vector2.ZERO
var kbforce : float
var knockedBack := true

func KnockBack(force : float, direction : Vector2):
	
	knockedBack = true
	kbforce = force
	kbdirection = global_position - direction
	
	get_parent().velocity = kbdirection * kbforce
	
	if knockedBack == true:
		kbdirection = lerp(kbdirection, Vector2.ZERO, 0.1)
		get_parent().move_and_collide(kbdirection * kbforce)
