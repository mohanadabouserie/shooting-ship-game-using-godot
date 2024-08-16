extends CharacterBody2D
# var speed : int = 500
@export var speed := 500

signal laser(pos)
var can_shoot = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector('left','right','up','down')

	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($Laser_Pos.global_position)
		can_shoot = false
		$Laser_Time.start()
		$Laser_Sound.play()
	


func _on_laser_time_timeout():
	can_shoot = true # Replace with function body.
