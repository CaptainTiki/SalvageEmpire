extends Resource
class_name GameData

signal DryDockSlotFilled(slot: int, ship: Ship)
signal DryDockSlotOpened(slot: int)

@export var num_drydocks : int = 1

var drydocks : Dictionary[int, Ship] = {0:null,1:null,2:null,3:null,4:null,5:null,6:null,7:null,8:null,9:null}

func get_empty_drydock_slot() -> int:
	for num in range(num_drydocks):
		if drydocks[num] == null:
			return num
	return -1 #we dont have an open dock. 

func get_new_ship() -> Ship:
	return Ship.new()

func set_ship_to_drydock(ship : Ship, docknum : int) -> void:
	DryDockSlotFilled.emit(docknum, ship)

func clear_ship_from_drydock(dock_number : int)-> void:
	drydocks[dock_number] = null
	DryDockSlotOpened.emit(dock_number)
