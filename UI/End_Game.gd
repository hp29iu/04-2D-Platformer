extends Control


func _ready():
	$Label.text = "Thanks for playing!\n\nWould you like to play again?"


func _on_Quit_pressed():
	get_tree().quit()


func _on_Replay_pressed():
	Global.score = 0
	Global.save_data["level"] = 1
	var _new_scene = get_tree().change_scene("res://Levels/Level1.tscn")
