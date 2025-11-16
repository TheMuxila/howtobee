extends Area2D

var bee_ammo:int = 0

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	bee_ammo + 1
	print("+1 Abelha")
	queue_free()
