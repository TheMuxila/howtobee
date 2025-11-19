extends CharacterBody2D

@export var velocidade: float = 160.0 
@export var ammo: int = 0

@onready var animation_player = $q_sprites

const feedback = preload("res://feedback.tscn")
const bullet = preload("res://bee_bullet.tscn")
var pode_atirar: bool = true
var cooldown_tiro: float = 0.3

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
	if event.is_action_pressed("atirar") and pode_atirar and ammo > 0:
		atirar()
		
func atirar():
	pode_atirar = false
	ammo -= 1
	var novo_projetil = bullet.instantiate()
	
	get_tree().root.add_child(novo_projetil)
	novo_projetil.global_position = global_position
	
	var mouse_posicao = get_global_mouse_position()
	var direcao_vetor = (mouse_posicao - novo_projetil.global_position).normalized()
	novo_projetil.direcao = direcao_vetor
	
	novo_projetil.direcao = direcao_vetor.normalized()
	$TimerCooldownTiro.start(cooldown_tiro)

func add_ammo():
	var feedback_ammo = feedback.instantiate()
	get_tree().root.add_child(feedback_ammo)
	feedback_ammo.global_position = global_position + Vector2(0, -30)
	feedback_ammo.cria_feedback("+1 Abelha", 1.0)
	
	ammo += 1
	print(ammo)
	
func _on_timer_cooldown_tiro_timeout():
	pode_atirar = true
