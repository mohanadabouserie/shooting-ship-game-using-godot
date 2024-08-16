extends Control

var main : PackedScene = load('res://Scenes/main.tscn')
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score) # Replace with function body.
	$Game_Over_Sound.play()
	$Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(main)
		
