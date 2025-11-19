extends StaticBody2D

const bee = preload("res://bee.tscn")

@onready var bee_spawn = $bee_spawn

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func spawn_bee():
	var posicao_base = global_position
	var new_bee = bee.instantiate()
	
	new_bee.global_position = posicao_base
	new_bee.global_position.y -= 10
	
	get_tree().root.add_child(new_bee)

func _on_bee_spawn_timeout() -> void:
	spawn_bee()
	pass
