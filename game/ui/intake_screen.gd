extends GameScreen
class_name IntakeScreen

@onready var intake_progress_bar: TextureProgressBar = %IntakeProgressBar
@onready var maint_progress_bar: TextureProgressBar = %MaintProgressBar
@onready var maint_value_label: Label = %MaintValueLabel

var stats : IntakeStats = IntakeStats.new()


func setup(gc : GameController) -> void:
	super(gc)
	stats._setup()



func _process(delta: float) -> void:
	_update_ui()


# -------------Button Presses-------------
func _on_process_ship_button_pressed() -> void:
	_update_ui()


func _on_maint_ship_button_pressed() -> void:
	pass


# -------------Update Cycles-------------
func update_variables() -> void:
	_update_ui()

func _update_ui() -> void:
	pass


# -------------Overrides-------------
func show_screen() -> void:
	visible = true

func hide_screen() -> void:
	visible = false
