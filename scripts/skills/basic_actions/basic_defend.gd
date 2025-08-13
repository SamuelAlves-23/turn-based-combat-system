extends Skill
class_name BasicDefend

func execute(actor: Actor, target: Actor) -> void:
	actor.is_defending = true
