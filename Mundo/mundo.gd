extends Node2D

@onready var spider_spawn = $spider_spawn
@export var spawn_points: Array[Node2D]
#@export var spawn_delay: float = 2.5

const spider = preload("res://spider.tscn")

func _ready() -> void:
	randomize()
	#spawn_timer()
	pass

func _process(delta: float) -> void:
	pass

#func spawn_timer():
	#var timer = Timer.new()
	#add_child(timer)
	#timer.wait_time = spawn_delay
	#timer.timeout.connect(spawn_spiders())

func spawn_spiders():
	if spawn_points.is_empty():
		return
	
	var point: Node2D = spawn_points.pick_random()
	
	var new_spider = spider.instantiate()
	new_spider.global_position = point.global_position
	add_child(new_spider)

func _on_spider_spawn_timeout() -> void:
	spawn_spiders()
	pass
