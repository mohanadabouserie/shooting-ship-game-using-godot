extends Node2D
var star_scene : PackedScene = load ("res://Scenes/animated_sprite_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, 25):
		var star = star_scene.instantiate()
		add_child(star)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
