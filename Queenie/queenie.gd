extends CharacterBody2D

@export var velocidade: float = 160.0 

@onready var animation_player = $q_sprites

const bullet = preload("res://bee_bullet.tscn")
var pode_atirar: bool = true
var cooldown_tiro: float = 0.3 # Cooldown de 0.3 segundos

func _physics_process(delta):
	var direcao = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	
	if direcao.x > 0:
		animation_player.flip_h = false
	elif direcao.x < 0:
		animation_player.flip_h = true
	
	if direcao:
		velocity = direcao * velocidade
		animation_player.play("run")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, 1000 * delta)
		animation_player.play("idle")

	move_and_slide()

func _input(event):
	if event.is_action_pressed("atirar") and pode_atirar:
		atirar()
		
func atirar():
	pode_atirar = false
	var novo_projetil = bullet.instantiate()
	
	get_tree().root.add_child(novo_projetil)
	
	novo_projetil.global_position = global_position
	var direcao_disparo: Vector2 = Vector2.ZERO
	if animation_player.flip_h:
		direcao_disparo = Vector2.LEFT
	else:
		direcao_disparo = Vector2.RIGHT
	
	novo_projetil.direcao = direcao_disparo.normalized()
	$TimerCooldownTiro.start(cooldown_tiro)
	
func _on_timer_cooldown_tiro_timeout():
	pode_atirar = true
