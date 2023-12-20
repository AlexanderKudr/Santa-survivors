extends Area2D

func _process(delta):
	print(self.position)
	self.position = get_node("..").direction * 40
