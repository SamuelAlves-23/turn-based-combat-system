extends Resource
class_name Passive

@export var display_name: String
@export var passive_id: String = ""
@export var description: String

func ready() -> void:
	connect_signals()

func connect_signals() -> void:
	push_warning("Base passive '%s' has no implementation." % passive_id)

func execute() -> void:
	push_warning("Base passive '%s' has no implementation." % passive_id)
