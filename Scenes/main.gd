extends Node2D

var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://Scenes/laser.tscn")
var health := 3

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group('ui', 'set_health', health)
	$Music.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	
	meteor.connect('collision', _on_metero_collision)

func _on_metero_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		print('dead')
		get_tree().change_scene_to_file('res://Scenes/game_over.tscn')
	


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
