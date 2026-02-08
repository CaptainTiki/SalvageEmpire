extends Node
class_name GameController

const SHIP_INTAKE_SCREEN = preload("uid://cgg4rv660142j")
const DOCKYARD_SCREEN = preload("uid://d1p2p4g4s71e7")
const SMELTYARD_SCREEN = preload("uid://rh8ccpkhlftq")
const MARKET_SCREEN = preload("uid://yx08beko0jvx")

var intake_screen : IntakeScreen = null
var dockyard_screen : DockyardScreen = null
var smeltyard_screen : SmeltyardScreen = null
var market_screen : MarketScreen = null

var screens : Dictionary[GameScreen.screen_name, GameScreen] = {}

var current_screen : GameScreen = null

var game_data : GameData

@export var menu_controller: MenuController
@export var game_root: Control

func start_game() -> void:
	game_data = GameData.new()
	_setup_intakescreen()
	_setup_dockyardscreen()
	_setup_smeltyardscreen()
	_setup_marketscreen()
	
	change_screen(GameScreen.screen_name.intake)
	
	

func change_screen(screenname : GameScreen.screen_name)-> void:
	if current_screen:
		current_screen.hide_screen()
	
	current_screen = screens[screenname]
	current_screen.show_screen()
	print(current_screen.name)

func quit_game() -> void:
	menu_controller.change_menu(Menu.menu_name.main)
	for screen in screens:
		screens[screen].queue_free()
	screens = {}

func _setup_intakescreen() -> void:
	intake_screen = SHIP_INTAKE_SCREEN.instantiate()
	game_root.add_child(intake_screen)
	intake_screen.setup(self)
	intake_screen.hide_screen()
	screens.get_or_add(GameScreen.screen_name.intake, intake_screen)

func _setup_dockyardscreen() -> void:
	dockyard_screen = DOCKYARD_SCREEN.instantiate()
	game_root.add_child(dockyard_screen)
	dockyard_screen.setup(self)
	dockyard_screen.hide_screen()
	screens.get_or_add(GameScreen.screen_name.dock, dockyard_screen)

func _setup_smeltyardscreen() -> void:
	smeltyard_screen = SMELTYARD_SCREEN.instantiate()
	game_root.add_child(smeltyard_screen)
	smeltyard_screen.setup(self)
	smeltyard_screen.hide_screen()
	screens.get_or_add(GameScreen.screen_name.smelter, smeltyard_screen)

func _setup_marketscreen() -> void:
	market_screen = MARKET_SCREEN.instantiate()
	game_root.add_child(market_screen)
	market_screen.setup(self)
	market_screen.hide_screen()
	screens.get_or_add(GameScreen.screen_name.market, market_screen)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		menu_controller.change_menu(Menu.menu_name.main)
