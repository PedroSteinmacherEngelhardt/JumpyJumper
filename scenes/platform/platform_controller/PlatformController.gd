extends Node2D

var grass_platform_scene = preload("res://scenes/platform/grass_platform/grass_platform.tscn");
var horizontal_moving_platform_scene = preload("res://scenes/platform/horizontal_moving_platform/horizontal_moving_platform.tscn");
var vertical_moving_platform_scene = preload("res://scenes/platform/vertical_moving_platform/vertical_moving_platform.tscn");
var platform_initial_position_y = 400;

var platforms = [grass_platform_scene,grass_platform_scene,grass_platform_scene,grass_platform_scene,horizontal_moving_platform_scene,vertical_moving_platform_scene]

func level_generator(amount):
	for items in amount:
		randomize();
		platform_initial_position_y -= randi_range(30, 70);
		var new_platform = platforms[randi_range(0, platforms.size()-1)].instantiate() as StaticBody2D;
		new_platform.position = Vector2(randi_range(20, 380), platform_initial_position_y);
		add_child(new_platform);
		

func _ready():
	level_generator(100)


