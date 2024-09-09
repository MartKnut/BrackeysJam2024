extends Area2D
class_name WeaponComponent

@export var attack_damage := 10.0
@export var knockback_force := 100.0
@export var stun_time := 1.5
@export var attack_time := 0.15
@export var weapon_cooldown := 0.3

func _on_area_entered(area) -> void:
		if area is HitboxComponent:
			if area.get_parent() != get_parent():
				var hitbox : HitboxComponent = area
				var attack = AttackComponent.new()
				attack.attack_damage = attack_damage
				attack.knockback_force = knockback_force
				attack.attack_position = global_position
				attack.stun_time = stun_time
				
				hitbox.Damage(attack)
