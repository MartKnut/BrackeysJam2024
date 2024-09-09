extends CharacterBody2D


const SPEED = 20000.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("left","right")
	var ydirection := Input.get_axis("up","down")
	var direction = Vector2(xdirection, ydirection).normalized()
	if direction:
		velocity = (direction * SPEED) * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func Die():
	pass
