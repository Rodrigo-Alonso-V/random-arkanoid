extends Control




func view_lives():
	$live1.visible = true
	$live2.visible = true
	$live3.visible = true


func _on_game_screen_lost_live() -> void:
	var lives = GlobalVar.lives
	if lives == 3:
		$live1.visible = false
	if lives == 2:
		$live2.visible = false
	if lives == 1:
		$live3.visible = false
		get_parent().get_node("Label_end").visible = true
		get_parent().get_tree().paused = true
		var menu = get_parent().get_node("Menu")
		menu.visible = true

	GlobalVar.lives -= 1
