extends Control

@onready var hp_bar: ProgressBar = $HPBar
@onready var mp_bar: ProgressBar = $MPBar

func connect_signals() -> void:
	SignalManager.update_ui.connect(update_request)

func update_request(actor) -> void:
	if actor.display_name == "Player":
		var tween = create_tween()
		tween.tween_property(hp_bar,"value", actor.hp, 1)
		tween.tween_property(mp_bar,"value", actor.mp, 1)
