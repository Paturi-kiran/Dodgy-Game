extends CharacterBody2D

const SPEED = 400.0

func _physics_process(_delta):
	# Handles movement based on input actions
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	# Detects collision with an obstacle
	if "obstacle" in area.name:
		# Calls the game_over function in the Game.gd script
		if get_parent().has_method("game_over"):
			get_parent().game_over()
		
		# Stop the player from moving
		set_physics_process(false)
