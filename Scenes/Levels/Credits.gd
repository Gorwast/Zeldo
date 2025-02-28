extends Node2D

const section_time := 2.0
const line_time := 1.0
const base_speed := 50
const speed_up_multiplier := 10.0
const title_color := Color.BLUE_VIOLET

@onready var line := $CreditsContainer/Line
var scroll_speed := base_speed
var speed_up := false

var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"ZELDO"
	],[
		"Programadores",
		"Lopez Chaidez Luis Enrique",
		"Espinoza Rivera Saul Filiberto"
	],[
		"Arte",
		"craftpix.net free-field-enemies-pixel-art-for-tower-defense",
		"craftpix.net free-base-4-direction-male-character-pixel-art",
		"ChatGPT"
	],[
		"Musica",
		"a"
	],[
		"Efectos de Sonido",
		"Universal UI Soundpack by Nathan Gibson",
		
	],[
		"Testers",
		"Tester 1",
		"Tester 2",
		"Tester 3"
	],[
		"Herramientas Usadas",
		"Desarrollado con Godot Engine",
		"https://godotengine.org/license",
		"",
	],[
		"Saludos especiales",
		"Mis papás",
		"Mi perro",
		"Mis compañeros de clase",
		"El minecraft"
	]
]


func _process(delta):
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.position.y -= scroll_speed
			if l.position.y < -960:
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		print("gg bro")
		# NOTE: This is called when the credits finish
		# - Hook up your code to return to the relevant scene here, eg...
		#get_tree().change_scene("res://scenes/MainMenu.tscn")


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		finish()
	if event.is_action_pressed("down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("down") and !event.is_echo():
		speed_up = false
