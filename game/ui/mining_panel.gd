extends GameScreen
class_name IntakeScreen


func setup(gc : GameController) -> void:
	super(gc)



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
