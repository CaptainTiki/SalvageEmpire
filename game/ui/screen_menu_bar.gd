extends MarginContainer


@export var owner_screen : GameScreen

func _on_intake_button_pressed() -> void:
	owner_screen.game_controller.change_screen(GameScreen.screen_name.intake)


func _on_dock_yard_button_pressed() -> void:
	owner_screen.game_controller.change_screen(GameScreen.screen_name.dock)


func _on_smelt_yard_button_pressed() -> void:
	owner_screen.game_controller.change_screen(GameScreen.screen_name.smelter)


func _on_market_button_pressed() -> void:
	owner_screen.game_controller.change_screen(GameScreen.screen_name.market)



func _on_exit_button_pressed() -> void:
	owner_screen.game_controller.quit_game()
