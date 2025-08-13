extends Status
class_name PercentageHPChange

@export var percentage: float
@export var is_heal: bool

func connect_signals() -> void:
	SignalManager.connect("turn_started", execute)

func execute(target: Actor) -> void:
	var total_amount: int
	if "max_hp" in target:
		total_amount = floor(target.max_hp * percentage/100)
	if "hp" in target:
		SignalManager.actor_damaged.emit(target, self, total_amount) if !is_heal else SignalManager.actor_healed.emit(target, self, total_amount)
