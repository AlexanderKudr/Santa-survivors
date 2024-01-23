extends Node
var cursor = load("res://Player/Cursor/Cursor.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor,Input.CURSOR_ARROW,Vector2(16,16))
