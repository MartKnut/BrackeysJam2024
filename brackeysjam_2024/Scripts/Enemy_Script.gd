extends CharacterBody2D
class_name Enemy

@export var stunTimer : Timer

var knockedBack := false
var kbdirection := Vector2.ZERO
var kbforce : float

var canAct := true

var kborigin : Vector2

func _physics_process(delta: float) -> void:
	
	velocity = kbdirection * kbforce
	
	if knockedBack == true:
		kbdirection = lerp(kbdirection, Vector2.ZERO, 0.1)
		move_and_collide(velocity)
	


func KnockBack(force : float, direction : Vector2, stun_time : float):
	knockedBack = true
	canAct = false
	kbforce = force
	kbdirection = global_position - direction
	stunTimer.wait_time = stun_time
	stunTimer.start()

func Die():
	queue_free()

func _on_stun_timer_timeout() -> void:
	canAct = true
