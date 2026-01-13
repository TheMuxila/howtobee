extends Node2D

@onready var spider_spawn = $spider_spawn
@export var spawn_points: Array[Node2D]

var onda: int = 1
var spiders: int = 0
var delay: float = 2.0

const spider = preload("res://spider.tscn")
const hive = preload("res://bee_hive.tscn")

func _ready() -> void:
	var new_hive = hive.instantiate()
	new_hive.global_position = Vector2(0,-1)
	add_child(new_hive)
	randomize()
	pass

func _process(delta: float) -> void:
	pass

func spawn_spiders():
	if spawn_points.is_empty():
		return
	
	var point: Node2D = spawn_points.pick_random()
	
	var new_spider = spider.instantiate()
	new_spider.global_position = point.global_position
	add_child(new_spider)

func _on_spider_spawn_timeout() -> void:
	spider_spawn.wait_time = delay
	spawn_spiders()
	spiders += 1
	print(spiders, " spiders")
	
	if spiders >= onda*20 and delay > 0.25:
		spiders = 0
		onda += 1
		delay -= delay/5
		
		spider_spawn.wait_time = 10.0
		
	pass
