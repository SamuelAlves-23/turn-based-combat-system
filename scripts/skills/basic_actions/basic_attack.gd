extends Skill
class_name BasicAttack

func execute(actor: Actor, target: Actor) -> void:
	if "hp" in target:
		SignalManager.actor_damaged.emit(target, actor, actor.damage)
