extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 100.0

var currentHealth : float
var parent

## Called when the node enters the scene tree for the first time.
## Set current health to max health
func _ready() -> void:
	parent = get_parent()
	currentHealth = MAX_HEALTH


func Damage(attack : AttackComponent):
	## Add health when called, call with negative value to decrese health. 
	currentHealth -= attack.attack_damage
	
	## Do Knockback if parent is a character body
	if  get_parent().is_class("CharacterBody2D"):
		parent.KnockBack(attack.knockback_force, attack.attack_position, attack.stun_time)
	
	## Once current health reaches 0, call the death function on parent object.
	if  currentHealth <= 0:
		get_parent().Die()
