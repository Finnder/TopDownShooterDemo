extends CharacterBody2D

const SPEED = 300
var can_attack = false

var damage_amount : int = 1

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().find_child("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = (player.position - position).normalized() * SPEED
	move_and_slide()

func die():
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.take_damage(damage_amount)
		queue_free()
