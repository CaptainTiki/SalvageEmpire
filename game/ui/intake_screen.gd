extends GameScreen
class_name IntakeScreen

@onready var intake_progress_bar: TextureProgressBar = %IntakeProgressBar
@onready var maint_progress_bar: TextureProgressBar = %MaintProgressBar
@onready var maint_value_label: Label = %MaintValueLabel

@export var intake_click_ammount : float = 5.0
@export var maint_click_ammount : float = 5.0
@export var maint_bot_activity_amount : float = 1.0
@export var maint_bots_available_max : int = 1
@export var maint_bot_max_durability : float = 50.0
@export var maint_bot_degradation : float = 2.7
@export var maint_amount_required : float = 25

var intake_progress : float = 0
var maint_progress : float = 0
var maint_bot_current_durability : float = 0
var maint_bots_available : int
var current_ship : Ship

func _process(delta: float) -> void:
	intake_progress += maint_bots_available * maint_bot_activity_amount * delta
	maint_bot_current_durability -= maint_bots_available * maint_bot_degradation * delta
	if maint_bot_current_durability <= 0:
		maint_bots_available = clamp(maint_bots_available - 1, 0, maint_bots_available_max)
		maint_bot_current_durability = maint_bot_max_durability
	_update_ui()



# -------------Button Presses-------------
func _on_process_ship_button_pressed() -> void:
	if not current_ship:
		var slot = game_data.get_empty_drydock_slot()
		if slot >= 0:
			current_ship = game_data.get_ship_to_intake()
	
	if current_ship.intake_amount <= intake_progress:
		return #we completed this ship - awaiting a new ship.
	
	intake_progress += intake_click_ammount
	if intake_progress >= current_ship.intake_amount:
		intake_progress = 0
		game_controller.game_data.intake_finished_for_ship(current_ship)
		current_ship = game_controller.game_data.get_ship_to_intake()
	_update_ui()


func _on_maint_ship_button_pressed() -> void:
	maint_progress += maint_click_ammount
	if maint_progress >= maint_amount_required:
		maint_progress = 0
		maint_bots_available = clamp(maint_bots_available + 1, 0, maint_bots_available_max)
		maint_bot_current_durability = maint_bot_max_durability




# -------------Update Cycles-------------
func update_variables() -> void:
	if not current_ship:
		current_ship = game_controller.game_data.get_ship_to_intake()
	maint_bots_available = maint_bots_available_max
	intake_progress = clamp(intake_progress, 0, current_ship.intake_amount)
	intake_progress_bar.max_value = current_ship.intake_amount
	maint_progress = clamp(maint_progress, 0, maint_amount_required)
	maint_progress_bar.max_value = maint_amount_required
	maint_bot_current_durability = maint_bot_max_durability
	
	_update_ui()

func _update_ui() -> void:
	intake_progress_bar.value = intake_progress
	maint_progress_bar.value = maint_progress
	maint_value_label.text = str(maint_bots_available)


# -------------Overrides-------------
func show_screen() -> void:
	visible = true

func hide_screen() -> void:
	visible = false
