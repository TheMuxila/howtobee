extends CharacterBody2D

@export var vel: float = 15.0
@export var alvo: Vector2 = Vector2(0, 0)

var reach: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(_delta):
	if reach:
		$s_sprites.play("atk")
		velocity = Vector2.ZERO
		move_and_slide()
		return
		
	var direcao_vetor = alvo - global_position
	
	if direcao_vetor.length() < 15:
		reach = true
		return
		
	velocity = direcao_vetor.normalized() * vel
	
	move_and_slide()
	
	if velocity.x > 0:
		$s_sprites.flip_h = true
	elif velocity.x < 0:
		$s_sprites.flip_h = false

func die():
	queue_free()
	return
