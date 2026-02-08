extends Node
class_name MenuController

const TITLE_SCREEN = preload("uid://c4ilmvjmnnp0l")
const MAIN_MENU_SCREEN = preload("uid://tsyy6ssqwise")

var title_screen : TitleScreen = null
var mainmenu_screen : MainMenuScreen = null

var menus : Dictionary[Menu.menu_name, Menu] = {}

var current_menu : Menu = null

@export var menu_root: Control
@export var game_controller : GameController

func _ready() -> void:
	_setup_titlescreen()
	_setup_mainmenu()

func change_menu(menuname : Menu.menu_name)-> void:
	if current_menu:
		current_menu.hide_menu()
	
	current_menu = menus[menuname]
	current_menu.show_menu()

func start_game() -> void:
	current_menu.hide_menu()
	game_controller.start_game()

func _setup_titlescreen() -> void:
	title_screen = TITLE_SCREEN.instantiate()
	menu_root.add_child(title_screen)
	title_screen.setup(self)
	title_screen.hide_menu()
	menus.get_or_add(Menu.menu_name.title, title_screen)

func _setup_mainmenu() -> void:
	mainmenu_screen = MAIN_MENU_SCREEN.instantiate()
	menu_root.add_child(mainmenu_screen)
	mainmenu_screen.setup(self)
	mainmenu_screen.hide_menu()
	menus.get_or_add(Menu.menu_name.main, mainmenu_screen)
