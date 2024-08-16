extends CanvasLayer
var time_elapsed := 0
var image = load("res://Assests/kenney_space-shooter-redux/PNG/UI/playerLife1_blue.png")
func set_health(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_score_timer_timeout():
	time_elapsed += 1 # Replace with function body.
	Global.score = time_elapsed
	$MarginContainer/Label.text = str(time_elapsed)
