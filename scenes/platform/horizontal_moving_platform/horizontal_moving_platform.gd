extends AnimatableBody2D

var pivot:Vector2
var direction = 1
var directions = [-1,1]

func _ready():
	pivot = position
	direction = directions[randi_range(0,1)]


func _physics_process(delta):
	if position.x >= 380 or position.x <= 20:
		direction *= -1

	
	position.x += 100 * delta * direction
