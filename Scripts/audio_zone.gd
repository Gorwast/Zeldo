extends Area2D

@onready var audio_player = $AudioStreamPlayer2D

func _on_body_entered(body):
	if body.name == "Player":  # Verifica si el objeto es el jugador
		audio_player.play()  # Reproduce el sonido

func _on_body_exited(body):
	if body.name == "Player":
		audio_player.stop()  # Detiene el sonido al salir del área
