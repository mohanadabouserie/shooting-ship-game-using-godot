extends Area2D

var speed : int
var direction_x : int
var rotation_speed : float
signal collision
var can_collide := true 
# Called when the node enters the scene tree for the first time.
func _ready():
	var rng := RandomNumberGenerator.new()
	var path : String = "res://Assests/kenney_space-shooter-redux/PNG/Meteors/meteorBrown_big" + str(rng.randi_range(1,4)) + ".png"
	$Sprite2D.texture = load (path)
	var width = get_viewport().get_visible_rect().size[0]
	var rand_x = rng.randi_range(0, width)
	position = Vector2(rand_x, 0) 
	speed = rng.randi_range(200, 500)
	direction_x = rng.randi_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta



func _on_body_entered(body):
	if can_collide:
		collision.emit() # Replace with function body.
		$Hit_by_player.play()

func _on_area_entered(area):
	$Hit_by_laser.play()
	$Sprite2D.hide()
	can_collide = false
	await get_tree().create_timer(0.5).timeout
	area.queue_free( )
	queue_free()
