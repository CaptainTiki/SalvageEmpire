extends Resource
class_name Ship

@export var ship_name : String = "SmallShip"
@export var required_intake_amount : int = 125
@export var required_salvage_amount: int = 230

var current_intake_progress : float = 0.0
var current_salvage_amount : float = 0.0
