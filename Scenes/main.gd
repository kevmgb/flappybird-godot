extends Node

@export var mob_scene: PackedScene
var score
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	$PipeSpawnTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	


func _on_start_timer_timeout():
	$PipeSpawnTimer.start()


func _on_pipe_spawn_timer_timeout():
	print("Spawning Pipes!!!!")
	var pipe = mob_scene.instantiate()
	
	var pipe_spawn_location = $PipePath/PipeSpawnLocation
	print(pipe_spawn_location.to_string())
	#pipe.position = pipe_spawn_location
	
	#var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	# TODO: Make pipes move...I dont think you can add velocity to non rigidbody scene 	
	add_child(pipe)
