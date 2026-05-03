extends Area2D

var speed = 300

func _physics_process(delta):
	# Move the obstacle down every frame
	# Delta ensures smooth movement regardless of computer speed
	position.y += speed * delta
	
	# Delete the obstacle once it is off-screen to save memory
	if position.y > 1000:
		queue_free()
