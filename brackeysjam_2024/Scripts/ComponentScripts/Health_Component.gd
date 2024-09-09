extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 100.0
var currentHealth : float

## Called when the node enters the scene tree for the first time.
## Set current health to max health
func _ready() -> void:
	currentHealth = MAX_HEALTH


func Damage(attack : AttackComponent):
	## Add health when called, call with negative value to decrese health. 
	currentHealth -= attack.attack_damage
	print(attack.attack_damage)
	
	## Once current health reaches 0, call the death function on parent object.
	if currentHealth <= 0:
		get_parent().Die()
