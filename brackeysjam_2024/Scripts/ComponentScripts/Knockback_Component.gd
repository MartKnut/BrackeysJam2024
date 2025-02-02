extends Node2D
class_name KnockbackComponent

var kbdirection := Vector2.ZERO
var kbforce : float
var knockedBack := true

func _physics_process(delta: float) -> void:
	if knockedBack == true:
		kbdirection = lerp(kbdirection, Vector2.ZERO, 0.1)
		get_parent().move_and_collide(kbdirection * kbforce)

## Function to be called by Hitbox Component when an entity with this component shall be knocked back
func KnockBack(attack : AttackComponent):
	knockedBack = true
	kbforce = attack.knockback_force
	kbdirection = global_position - attack.attack_position
	
	get_parent().velocity = kbdirection * kbforce
	
