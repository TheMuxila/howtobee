extends CharacterBody2D

@export var vel: float = 15.0
@export var alvo: Vector2 = Vector2(0, 0)

const hive = preload("res://bee_hive.tscn")
const feedback = preload("res://feedback.tscn")

var reach: bool = false
var dead: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(_delta):
	if reach:
		$s_sprites.play("atk")
		velocity = Vector2.ZERO
		await get_tree().create_timer(0.5).timeout
		dano_hive()
		
		die()
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

func dano_hive():
	if dead == false:
		get_tree().call_group("hive", "tomar_dano")
		dead = true

func die():
	$s_sprites.play("die")
	$s_collision.set_deferred("disabled", true)
	await get_tree().create_timer(0.7).timeout
	queue_free()
	return


func _on_s_apsd_timeout() -> void:
	pass
