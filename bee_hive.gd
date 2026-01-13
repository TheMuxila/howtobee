extends Area2D

@onready var hud_vida = $HUD/Vida
@onready var hud_tempo = $HUD/Tempo

var tempo: int = 0
var vida: int = 10
var morrendo: bool = false
var end: bool = false

func _ready() -> void:
	atualiza_vida(vida)
	atualiza_tempo(tempo)
	pass

func _process(delta: float) -> void:
	pass

func atualiza_vida(valor):
	hud_vida.text = "Vida da Colmeia: " + str(valor) + "/10"

func atualiza_tempo(valor):
	hud_tempo.text = str(valor)

func tomar_dano():
	vida -= 1
	atualiza_vida(vida)
	print(vida, " vida")
	if vida <= 0:
		vida = 0
		$bh_sprites.play("dead")
		game_over()

func _on_atk_delay_timeout() -> void:
	tempo += 1
	atualiza_tempo(tempo)
	pass

func game_over():
	get_tree().paused = true
	end = true
	$GAMEOVER.show()

func _on_restart_b_pressed() -> void:
	if end == true:
		get_tree().paused = false
		get_tree().reload_current_scene()
		end = false
	pass
