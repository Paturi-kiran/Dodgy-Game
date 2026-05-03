extends Node2D

func _ready():
	# These paths now match the "HUD" node seen in your scene tree
	if has_node("HUD/Label"):
		get_node("HUD/Label").hide()
	
	if has_node("HUD/GameOverLabel"):
		get_node("HUD/GameOverLabel").hide()
	
	# Start the timer for spawning obstacles
	if has_node("Timer"):
		$Timer.start()

func _on_timer_timeout() -> void:
	# This spawns the obstacles
	var obstacle_scene = preload("res://obstacle.tscn")
	var new_obstacle = obstacle_scene.instantiate()
	
	# Randomize position based on screen width
	var random_x = randf_range(50, 1100)
	new_obstacle.position = Vector2(random_x, -50)
	
	add_child(new_obstacle)

func _on_button_pressed():
	# Triggered by the signal connected in image_3.png
	# This reloads the current scene to restart the game
	get_tree().reload_current_scene()
