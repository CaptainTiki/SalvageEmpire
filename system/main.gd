extends Node2D

@onready var menu_controller: MenuController = $MenuController

func _ready() -> void:
	menu_controller.change_menu(Menu.menu_name.title)
