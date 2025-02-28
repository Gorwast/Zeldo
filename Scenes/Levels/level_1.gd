extends Node2D

var change_scene := false

func _ready() -> void:
	$Player/Camera2D/CanvasLayer/ColorRect.show()

func _on_player_tree_exited() -> void:
	if not change_scene:
		get_tree().change_scene_to_file("res://Scenes/Levels/death_screen.tscn")


func _on_credits_area_body_entered(body: Node2D) -> void:
	change_scene = true
	get_tree().change_scene_to_file("res://Scenes/Levels/GodotCredits.tscn")
