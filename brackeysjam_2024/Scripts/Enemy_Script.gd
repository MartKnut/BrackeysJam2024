extends CharacterBody2D
class_name Enemy

@export var stunTimer : Timer
@export var Speed = 150

var canAct := true

var target

func _ready():
	target = $"../PlayerScene"


func _physics_process(delta: float) -> void:
	
	## Move towards target (player), placeholder for state machine
	if canAct:
		var direction = Vector2(target.position.x - position.x,  target.position.y - position.y).normalized()
		move_and_collide((direction * Speed) * delta)
	

func Die():
	queue_free()

func _on_stun_timer_timeout() -> void:
	canAct = true
