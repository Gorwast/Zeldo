extends Control

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_play_button_pressed() -> void:
	$AnimationPlayer.play("fade")
	
func play_game() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
