extends Area2D
class_name WeaponComponent

@export var attack_damage := 10.0
@export var knockback_force := 100.0
@export var stun_time := 0.15
@export var attack_time := 0.15
@export var weapon_cooldown := 0.3

## Check when something enters area
func _on_area_entered(area) -> void:
	## Is it an entity with a hitbox component?
	if area is HitboxComponent:
		## Is it not ourself?
		if area.get_parent() != get_parent():
			## Set target hitbox as hit
			var hitbox : HitboxComponent = area
			## Instantiate an attack against the hit hitbox with all attack information
			var attack = AttackComponent.new()
			attack.attack_damage = attack_damage
			attack.knockback_force = knockback_force
			attack.attack_position = get_parent().global_position
			attack.stun_time = stun_time
			
			hitbox.Damage(attack)
			
			hitbox.KnockedBack(attack)
