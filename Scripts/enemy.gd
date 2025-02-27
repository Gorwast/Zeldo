extends CharacterBody2D

@export var speed: float = 100.0
@export var attack_range: float = 40.0
@export var damage: int = 10
@export var attack_cooldown: float = 1.5

var attack_area: Area2D
var player: CharacterBody2D = null
var can_attack: bool = true
var followPlayer: bool = false
@onready var animation_player = $AnimationPlayer

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(_delta):
	if followPlayer:
		move_towards_player()

func move_towards_player():
	if player:
		var direction = (player.global_position - global_position).normalized()
		var distance = global_position.distance_to(player.global_position)
		velocity = direction * speed
		
		if distance > attack_range:
			velocity = direction * speed
			move_and_slide()
		else:
			velocity = Vector2.ZERO


func _on_search_radius_body_entered(_body: Node2D) -> void:
	if player:
		followPlayer = true


func _on_search_radius_body_exited(_body: Node2D) -> void:
	if player:
		followPlayer = false
	animation_player.play("idle")


func _on_attack_radius_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		print("Enemy on Attack Enemy Hitbox")
		if area.has_method("damage"):
			attack_area = area
			$AttackTimer.start()
	print("area entered")


func _on_attack_radius_area_exited(_area: Area2D) -> void:
	$AttackTimer.stop()
	print("area exit")


func _on_attack_timer_timeout() -> void:
	animation_player.play("attack")
	print("Damage!")
	
func attack_area_now() -> void:
	attack_area.damage(1)
	
