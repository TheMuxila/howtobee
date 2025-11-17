extends Area2D

@onready var queenie = get_parent().get_node("Queenie")

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	queenie.add_ammo()
	queue_free()
