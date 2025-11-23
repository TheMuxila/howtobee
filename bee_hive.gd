extends Area2D

var vida: int = 10

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("inimigo") and vida > 0:
		$bh_sprites.play("damaging")
		vida =- 1
		
		if vida < 1:
			$bh_sprites.play("dead")
		
		pass
