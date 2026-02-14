extends Node
class_name GameController

var screens : Dictionary[GameScreen.screen_name, GameScreen] = {}

var current_screen : GameScreen = null

var game_data : GameData

@export var menu_controller: MenuController
@export var game_root: Control

func start_game() -> void:
	game_root.visible = true
	game_data = GameData.new()
	#_setup_intakescreen()
	#_setup_dockyardscreen()
	#_setup_smeltyardscreen()
	#_setup_marketscreen()
	
	#change_screen(GameScreen.screen_name.intake)
	
	

func change_screen(screenname : GameScreen.screen_name)-> void:
	if current_screen:
		current_screen.hide_screen()
	
	current_screen = screens[screenname]
	current_screen.show_screen()
	print(current_screen.name)

func quit_game() -> void:
	game_root.visible = false
	menu_controller.change_menu(Menu.menu_name.main)
	for screen in screens:
		screens[screen].queue_free()
	screens = {}

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		menu_controller.change_menu(Menu.menu_name.main)
