extends CharacterBody2D

var velocidade: float = 300.0
var direcao: Vector2 = Vector2.RIGHT
var dano: int = 10

func _ready() -> void:
	rotation = direcao.angle()
	pass 

func _physics_process(_delta):
	velocity = direcao * velocidade
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		var collider = collision.get_collider()
		
		#if collider.is_in_group("inimigo"):
		#	queue_free()
		#	return
		
		if collider:
			queue_free()

func _process(_delta: float) -> void:
	pass
