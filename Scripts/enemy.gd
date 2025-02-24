extends CharacterBody2D

@export var speed: float = 100.0
@export var attack_range: float = 40.0
@export var damage: int = 10
@export var attack_cooldown: float = 1.5

var player: CharacterBody2D = null
var can_attack: bool = true
var followPlayer: bool = false
@onready var animation_player = $AnimationPlayer

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	
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
			animation_player.play("walk") # Play walking animation
		else:
			velocity = Vector2.ZERO
			if can_attack:
				attack()

func attack():
	can_attack = false
	animation_player.play("attack")
	if player.has_method("take_damage"):
		player.take_damage(damage)
	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true


func _on_search_radius_body_entered(body: Node2D) -> void:
	if player:
		followPlayer = true


func _on_search_radius_body_exited(body: Node2D) -> void:
	if player:
		followPlayer = false
	animation_player.play("idle")


func _on_attack_radius_area_entered(area: Area2D) -> void:
	
	if area.has_method("damage"):
		area.damage(1)
