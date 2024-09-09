extends CharacterBody2D


const SPEED = 20000.0
var canAttack := true
var attackRotator

@export var weapon : WeaponComponent
@export var weapon_cooldown : Timer
@export var attack_timer : Timer

func _ready() -> void:
	attackRotator = $AttackRotation
	
	## Set weapon cooldown and attack timer to 
	weapon_cooldown.wait_time = weapon.weapon_cooldown
	attack_timer.wait_time = weapon.attack_time
	
	## Set weapon to invisible and inactive
	weapon.visible = false
	weapon.monitoring = false

func _physics_process(delta: float) -> void:
	
	## Get the input directions and handle the movement/deceleration.
	## Positive direction is the name of the variable
	var right := Input.get_axis("left","right")
	var down := Input.get_axis("up","down")
	
	## Combine input to Vector2 Direction, and normalize so direction total is always equal to 1
	var direction = Vector2(right, down).normalized()
	if direction:
		velocity = (direction * SPEED) * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	var attack := Input.is_action_just_pressed("attack")
	
	## If attack action is pressed and you can attack
	if attack and canAttack: 
		## Keep the Attack Rotation from infinitely scaling rotation value
		if attackRotator.rotation_degrees >= 365 or attackRotator.rotation_degrees <= -365:
			attackRotator.rotation_degrees = 0
		
		## Rotate attack towards the cursor position
		attackRotator.look_at(get_global_mouse_position())
		
		## Snap the rotation to closest 90 degree angle 
		attackRotator.rotation_degrees = snappedf(attackRotator.rotation_degrees, 90)
		
		_attack()
		
		## Please swap out for an adjustable variable later :) (I bet you won't)
		$AnimationPlayer.play("Swing")
	
	move_and_slide()

func _attack():
	## Stop other attacks from initiating
	canAttack = false
	
	## Activate the weapon
	weapon.visible = true
	weapon.monitoring = true
	
	## Start cooldown and attack timer
	weapon_cooldown.start()
	attack_timer.start()

## Called from HealthComponent when current health reaches a total of 0 
func Die():
	pass

## Called when the cooldown of the attack is over
func _on_weapon_cooldown_timeout() -> void:
	canAttack = true
	

## Called when the attack timer is over
func _on_attack_timer_timeout() -> void:
	## Disables visibility and collision checks
	weapon.visible = false
	weapon.monitoring = false
