extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var rand_x = rng.randi_range(0, width)
	var length = get_viewport().get_visible_rect().size[1]
	var rand_y = rng.randi_range(0, length)
	position = Vector2(rand_x, rand_y)
	play()
	var rand_scale = rng.randi_range(0.5, 1.5)
	scale = Vector2(rand_scale, rand_scale) 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
