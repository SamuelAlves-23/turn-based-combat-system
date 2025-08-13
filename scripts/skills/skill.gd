extends Resource
class_name Skill

@export var display_name: String
@export var action_id: String = ""
@export var pm_cost: int = 0
@export var cooldown: int = 0
@export var description: String

func execute(actor: Actor, target: Actor) -> void:
	push_warning("Base action '%s' has no implementation." % action_id)
