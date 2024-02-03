extends CharacterBody2D


@export var speed = 30
@export var limit = 0.5
var startPosition
var endPosition 

func _ready():
	startPosition = position
	endPosition = startPosition + Vector2(0,3*16)

func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		changeDirection()
	velocity = moveDirection.normalized()*speed
	
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd


func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	
