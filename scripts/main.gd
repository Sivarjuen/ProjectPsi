extends Node

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # "ui_cancel" corresponds to the "Escape" key.
		get_tree().quit()  # Exit the game.
