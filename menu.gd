extends Control


func _ready() -> void:
	visible = true


func _on_button_quit_pressed() -> void:
	get_tree().quit()


func _on_button_start_pressed() -> void:
	GlobalVar.lives = 3
	visible = false
	var end = get_parent().get_node("Label_end")
	end.visible = false
	var blocks = get_parent()
	blocks.instance_blocks()
	var lives  =get_parent().get_node("lives")
	lives.view_lives()
	get_tree().paused = false
	
