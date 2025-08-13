extends Node
class_name TurnManager

enum STATE{
	PLAYER_TURN,
	ENEMY_TURN,
	WIN,
	LOSE
}

@export var turn_order: Array
@onready var current_index: int = -1
@onready var is_combat_active: bool = false

func initialize(actors: Array) -> void:
	turn_order = actors.duplicate()
	turn_order.sort_custom(func(a,b): return a.speed > b.speed)
	is_combat_active = true
	start_next_turn()

func start_next_turn() -> void:
	if !is_combat_active:
		return
		
	var actor = get_next_actor()
	if actor == null:
		end_combat()
		return
	
	#if actor.has_method("process_cooldowns"):
			#actor.process_cooldowns()
	#if actor.has_method("process_status_effects"):
		#actor.process_status_effects()
	
	SignalManager.turn_started.emit(actor)

func end_combat()-> void:
	is_combat_active = false
	SignalManager.combat_ended.emit()

func get_next_actor() -> Node:
	if turn_order.is_empty():
		return null
	var tries = 0
	while tries < turn_order.size():
		current_index = (current_index + 1) % turn_order.size()
		var actor = turn_order[current_index]
		if _is_actor_available(actor):
			return actor
		tries += 1
	return null


func _is_actor_available(actor: Node) -> bool:
	return actor != null and not (actor.has_method("is_defeated") and actor.is_defeated())
