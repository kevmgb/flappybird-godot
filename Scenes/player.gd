extends RigidBody2D

@export var jumpSpeed = 400
var screen_size
var is_jumping = false
var jump_force = Vector2(0, -5000)
var rotation_damping = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size # Find size of game window
	$AnimatedSprite2D.play("idle")
	
func _process(delta):
	if Input.is_action_just_pressed("jump") and not is_jumping:
		is_jumping = true

	if Input.is_action_just_released("jump"):
		is_jumping = false
		reset_sprite_rotation()

	if is_jumping:
		apply_force(jump_force, Vector2.ZERO)
		rotate_sprite(-0.05)
		#print("Applying force!")

func rotate_sprite(angle):
	var clamped_rotation = clamp($AnimatedSprite2D.rotation + angle, -0.5, 1)
	$AnimatedSprite2D.rotation = clamped_rotation


#func reset_sprite_rotation():
	## Reset sprite rotation to idle position
	#$AnimatedSprite2D.rotation = 0
	
func reset_sprite_rotation():
	# Smoothly dampen rotation back to idle position
	var target_rotation = 0
	var current_rotation = $AnimatedSprite2D.rotation
	var new_rotation = current_rotation + (target_rotation - current_rotation) / rotation_damping
	$AnimatedSprite2D.rotation = new_rotation

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
