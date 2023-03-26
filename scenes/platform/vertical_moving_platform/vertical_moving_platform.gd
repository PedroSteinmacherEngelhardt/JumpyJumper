extends AnimatableBody2D

var pivot
var direction = 1
var directions = [-1,1]

func _ready():
	pivot = global_position.y
	direction = directions[randi_range(0,1)]


func _physics_process(delta):
	if global_position.y >= pivot + 80 or global_position.y <= pivot - 80:
		direction *= -1

	
	position.y += 80 * delta * direction
