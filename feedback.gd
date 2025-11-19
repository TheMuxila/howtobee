extends Label

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func cria_feedback(mensagem: String, duracao: float = 0.8):
	self.text = mensagem
	
	$Timer.wait_time = duracao
	$Timer.one_shot = true
	$Timer.start()
	
	$Timer.timeout.connect(self.queue_free)
	
	var tween = create_tween()
	tween.tween_property(self, "global_position", global_position + Vector2(0, -30), duracao)
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), duracao * 0.5).set_delay(duracao * 0.5)
