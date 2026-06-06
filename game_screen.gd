extends Node2D

signal lost_live

var level := 1
var plattform_scene :PackedScene = preload("res://Scenes/Players/plattform.tscn")
var ball_scene : PackedScene = preload("res://Scenes/ball.tscn")
var block_rectangule_scene : PackedScene = preload("res://Scenes/Figures_blocks/block_rectangle.tscn")


func _ready() -> void:
	$Label_level.text = ("Level " + str(level))
	instance_ball()
	instance_blocks()
	instace_plattform()
	get_tree().paused = true

func instace_plattform():
	var plattform_scene_instance := plattform_scene.instantiate()
	plattform_scene_instance.position = $Positions/Marker_player.position
	add_child(plattform_scene_instance,true)


func instance_blocks():
	var block_rectangule_scene_instance := block_rectangule_scene.instantiate()
	block_rectangule_scene_instance.position = $Positions/Marker_blocks.position
	block_rectangule_scene_instance.reset.connect(_on_block_rectangule_reset)
	add_child(block_rectangule_scene_instance)


func instance_ball():
	var ball_scene_instance := ball_scene.instantiate()
	ball_scene_instance.position = $Positions/Marker_ball.position
	add_child(ball_scene_instance)


func _on_area_fall_body_entered(body: Node2D):
	if body.is_in_group("ball"):
		body.quit()
		emit_signal("lost_live")
		var current_plattform = get_node("Plattform")
		current_plattform.name = "Last_plattform"
		current_plattform.queue_free()
		instace_plattform()
		instance_ball()


func _on_block_rectangule_reset():
	level += 1
	$Label_level.text = ("Level " + str(level))
	GlobalVar.speed_ball = GlobalVar.speed_ball * 1.5
	GlobalVar.speed_plattform = GlobalVar.speed_plattform * 1.5
	instance_blocks()
