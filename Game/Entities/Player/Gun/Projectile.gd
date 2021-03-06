extends Node2D

const SPEED = 500
export var power = 1

var direction = Vector2(0,-1)


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false;
	$AnimatedSprite.play("fire%d" % (power%5-1))
	$AnimationPlayer.play("glow")


#Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _physics_process(delta):
	move(delta)
	
func move(delta):
	position += direction*SPEED*delta

func _on_VisibilityNotifier2D_screen_exited():
	#print_debug("I'm gone")
	$AnimationPlayer.play("RESET")
	queue_free()
	
func hit_enemy():
	queue_free()
