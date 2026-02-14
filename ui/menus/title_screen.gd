extends Menu
class_name TitleScreen

@export var time_to_live : float = 0.5

func show_menu() -> void:
	visible = true
	set_process(true)
	get_tree().create_timer(time_to_live).timeout.connect(_on_timer_expired)

func hide_menu() -> void:
	visible = false
	set_process(false)

func _on_timer_expired() -> void:
	menu_controller.change_menu(Menu.menu_name.main)

func _unhandled_input(event: InputEvent) -> void:
	menu_controller.change_menu(Menu.menu_name.main)
