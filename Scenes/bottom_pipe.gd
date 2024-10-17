extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Pipe is ready ========")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += -2


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
