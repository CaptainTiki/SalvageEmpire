extends Control
class_name Menu

enum menu_name {title, main, settings}

var menu_controller : MenuController

func setup(mc : MenuController) -> void:
	menu_controller = mc

func show_menu() -> void:
	pass

func hide_menu() -> void:
	pass
