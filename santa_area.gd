extends Area2D

var aim_dir
var santa_pos
@export var aim_range : float

func _process(delta):
	santa_pos = get_node("..").global_position 
	aim_dir = (santa_pos - get_viewport().get_mouse_position()).normalized()
	self.global_position = (santa_pos - aim_dir * aim_range)
	
