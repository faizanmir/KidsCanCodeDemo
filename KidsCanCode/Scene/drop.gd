extends Control

func _ready():
	randomize()
	
	# Set all children as MOUSE_FILTER_IGNORE
	for n in get_children():
		if "mouse_filter" in n:
			n.mouse_filter = MOUSE_FILTER_IGNORE

func can_drop_data(position, data):
	return true

func drop_data(position, data):
	$color.color = data.get_node("color").color
	data.get_node("color").color = Color(randf(), randf(), randf(), 1)
