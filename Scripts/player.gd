extends CharacterBody2D


@export var speed : int = 300
var health = 10

@onready var ray_cast_2d: RayCast2D = $RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement()
	shoot()
	look_at(get_global_mouse_position())

func movement():
	var input_direction = Input.get_vector("left", "right", "up", "down") #Vector2(1, 0)
	velocity = input_direction * speed

	move_and_slide()

func shoot():
	if(Input.is_action_just_pressed("shoot")):
		var coll = ray_cast_2d.get_collider()
		if ray_cast_2d.is_colliding() and coll.has_method("die"):
			coll.die()

func take_damage(dmg):
	health -= dmg
	print("Health is now: " + str(health))
	if (health < 1):
		queue_free()
