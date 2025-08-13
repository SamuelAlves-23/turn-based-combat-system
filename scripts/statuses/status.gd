extends Resource
class_name Status

@export var display_name: String
@export var status_id: String = ""
@export var description: String

func ready() -> void:
	connect_signals()

func connect_signals() -> void:
	push_warning("Base status '%s' has no implementation." % status_id)

func execute(actor: Actor) -> void:
	push_warning("Base status '%s' has no implementation." % status_id)
