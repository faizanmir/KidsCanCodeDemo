extends KinematicBody

var Bullet  =  preload("res://Scenes/Bullet.tscn")

var gravity = Vector3.DOWN*10
var velocity = Vector3()
var speed =  20
var jump_speed  =  Vector3.UP *30
var spin  = 0.01
func _physics_process(delta):
	apply_gravity(delta)
	jump(delta)
	move(delta)
	velocity = move_and_slide(velocity,Vector3.UP)



func apply_gravity(delta):
	var vy  = velocity.y
	if(!is_on_floor()):
		velocity.y  += gravity.y *20 *delta
	



func  jump(delta):
	if(is_on_floor() and Input.is_action_pressed("jump")):
		velocity.y += jump_speed.y 


func move(delta):
	var vy =  velocity.y
	velocity  = Vector3()
	if(Input.is_action_pressed("ui_left")):
		velocity  += transform.basis.z*speed
	elif(Input.is_action_pressed("ui_right")):
		velocity  += -transform.basis.z  *speed
	elif(Input.is_action_pressed("ui_up")):
		velocity += -transform.basis.z  *speed
	elif(Input.is_action_pressed("ui_down")):
		velocity += transform.basis.z *speed
	else:
		velocity.x =0
		velocity.z =0	
	velocity.y =  vy
		

   

 





func _unhandled_input(event):
	if(event is InputEventMouseMotion):
		rotate_y(-lerp(0,spin,event.relative.x))
	elif(event.is_action_pressed("shoot")):
		var b =  Bullet.instance()
		b.start($Position3D.global_transform)
		get_parent().add_child(b)
