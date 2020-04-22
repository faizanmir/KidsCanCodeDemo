extends Control


func _ready():
	for n in get_children():
		if "mouse_filter" in n:
			n.mouse_filter = MOUSE_FILTER_IGNORE

func get_drag_data(position):
	print("called")
	var preview = self.duplicate()
	preview.modulate.a = .5

	#preview.get_node("block").rect_position = -self.rect_size / 2

	#preview.get_node("bkg").hide()

	set_drag_preview(preview)
	
	return {"instruction": "move_left","self": self}
