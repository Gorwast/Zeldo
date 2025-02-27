extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player/Camera2D/CanvasLayer/ColorRect.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_tree_exiting() -> void:
	pass


func _on_player_tree_exited() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/death_screen.tscn")


func _on_credits_area_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/GodotCredits.tscn")
