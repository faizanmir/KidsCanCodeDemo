extends Control
signal move_player_according_block(direction)

func _ready():
	GlobalScript.DropPanel  =  self



func can_drop_data(position, data):
	return true


func drop_data(position, data):
	var imageNode  =  data["self"].get_node("block_image")
	$img.texture  =  imageNode.texture
	GlobalScript.Tweak.addDirectionsForTweak(data["instruction"])

	


func _on_TextureButton_pressed():
	GlobalScript.Tweak.moveTweak()
