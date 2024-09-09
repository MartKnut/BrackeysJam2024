extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent

## Called through getting hit by an Attack Component
func Damage(attack: AttackComponent):
	if health_component:
		health_component.Damage(attack)
