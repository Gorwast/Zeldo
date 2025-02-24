extends Control

func _process(delta: float) -> void:
	$BoxContainer/HBoxContainer2/PuntajeLabel.text = "Score: " + str(Global.score)
