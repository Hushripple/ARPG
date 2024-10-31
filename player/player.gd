extends CharacterBody2D

# Velocidad del jugador 
@export var speed: int = 35
# Animaciones
@onready var animations = $AnimationPlayer

# Controles
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed

func updateAnimation():
	# Si el personaje está quieto (idle), las animaciones se detienen
	if velocity.length() == 0:
		animations.stop()
	# De lo contrario, las animaciones se activan
	else:
		var direction = "down"
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up"
	
		animations.play("walk " + direction)

# Movimiento	
func _physics_process(delta):
	handleInput()
	move_and_slide() 
	updateAnimation()
