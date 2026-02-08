extends Control
class_name GameScreen

enum screen_name {intake, dock, smelter, market, upgrades, prestige}

var game_controller : GameController
var game_data : GameData

func setup(gc : GameController) -> void:
	game_controller = gc
	game_data = gc.game_data
	update_variables()

func update_variables() -> void:
	pass

func show_screen() -> void:
	pass

func hide_screen() -> void:
	pass
