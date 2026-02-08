extends Menu
class_name MainMenuScreen


func _on_start_game_button_pressed() -> void:
	menu_controller.start_game()


func show_menu() -> void:
	visible = true
	set_process(true)

func hide_menu() -> void:
	visible = false
	set_process(false)


func _on_exit_button_pressed() -> void:
	get_tree().quit()
