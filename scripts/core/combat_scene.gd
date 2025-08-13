extends Node
class_name CombatScene

@export var turn_manager: TurnManager
@export var allies: Array
@export var enemies: Array


func _ready() -> void:
	allies = $Allies.get_children()
	enemies = $Enemies.get_children()
	
	turn_manager.initialize(allies + enemies)
	
