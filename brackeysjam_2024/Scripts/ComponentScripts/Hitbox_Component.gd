extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent
@export var knockback_component : KnockbackComponent

## Called when getting hit by an Attack Component
func Damage(attack: AttackComponent):
	if health_component:
		health_component.Damage(attack)

## Called when getting hit by an Attack Component, and only executed if entity has Knockback Component attached 
func KnockedBack(attack : AttackComponent):
	if knockback_component:
		knockback_component.KnockBack(attack)
