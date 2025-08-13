extends Node
class_name Actor

@export var display_name: String
@export var max_hp: int
@export var hp: int
@export var max_mp: int
@export var mp: int
@export var attack: int
@export var defense: int
@export var speed: int
@export var is_defending: bool = false

@export var basic_commands: Array[Skill]
@export var skills: Array[Skill]

@export var passive_skills: Array[Passive]
@export var statuses: Array[Status]

func _ready() -> void:
	connect_signals()

func new_turn() -> void:
	is_defending = false

func take_damage(amount) -> int:
	amount = floor(amount * 0.3) if is_defending else clamp(amount - defense, 1, 9999)
	hp = clamp(hp - amount, 0, max_hp)
	return amount

func heal(amount) -> int:
	hp = clamp(hp + amount, 0, max_hp)
	return amount

func connect_signals() -> void:
	SignalManager.actor_damaged.connect(damage_request)
	SignalManager.actor_healed.connect(heal_request)
	SignalManager.turn_started.connect(new_turn_request)

func damage_request(target, source, amount) -> void:
	if target == self:
		var hp_loss = take_damage(amount)
		print(display_name + " loses " + str(hp_loss) + " due to " + source.display_name)

func heal_request(target, source, amount) -> void:
	if target == self:
		var hp_gain = heal(amount)
		print(display_name + " restores " + str(hp_gain) + " due to " + source.display_name)

func new_turn_request(actor: Actor) -> void:
	if actor == self:
		new_turn()
	print("Starts " + display_name + " turn.")
