extends CharacterBody2D

var velocidade: float = 300.0
var direcao: Vector2 = Vector2.RIGHT
var dano: int = 10

const feedback = preload("res://feedback.tscn")

func _ready() -> void:
	rotation = direcao.angle()
	pass 

func _physics_process(_delta):
	velocity = direcao * velocidade
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		var collider = collision.get_collider()
		
		if collider.is_in_group("inimigo"):
			var feedback_dmg = feedback.instantiate()
			get_tree().root.add_child(feedback_dmg)
			feedback_dmg.global_position = global_position + Vector2(0, -20)
			feedback_dmg.cria_feedback("10 dmg", 1.0)
			queue_free()
			return
		
		if collider:
			queue_free()

func _process(_delta: float) -> void:
	pass
