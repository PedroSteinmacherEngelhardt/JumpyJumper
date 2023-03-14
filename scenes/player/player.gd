extends CharacterBody2D

const GRAVITY = 15;
const JUMP_FORCE = 10;
const SPEED = 5;

var direction;

func movement(delta):
	velocity.y += GRAVITY * delta;
	var collision = move_and_collide(velocity);
	direction = int(Input.get_axis("ui_left", "ui_right"));
	velocity.x = lerp(int(velocity.x), direction * SPEED, 0.4)
	
	if collision:
		velocity.y = -JUMP_FORCE;


func teleport():
	position.x = wrapf(position.x, 32, 524)
	


func animation_state():
	if velocity.y > 0:
		$PlayerAnimatedSprite.play("fall");
		return;
	$PlayerAnimatedSprite.play("jump");

func animation_direction():
	if direction == 1:
		$PlayerAnimatedSprite.flip_h = true;
	if direction == -1:
		$PlayerAnimatedSprite.flip_h = false; 


	
func _physics_process(delta):
	movement(delta);
	animation_state();
	animation_direction();
	teleport();