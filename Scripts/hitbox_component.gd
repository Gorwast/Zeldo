extends Area2D
class_name HitboxComponent
@export var health_component : HealthComponent

func damage(attack) -> void:
	if health_component:
		health_component.damage(attack)

func _process(delta: float) -> void:
	pass
