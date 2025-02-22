extends Area2D
class_name HitboxComponent
@export var health_component : HealthComponent

# Called when the node enters the scene tree for the first time.
func damage(attack) -> void:
	if health_component:
		health_component.damage(attack)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
