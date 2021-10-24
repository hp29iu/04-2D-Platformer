extends Area2D


func _ready():
	pass


func _on_Door2_body_exited(_body):
	get_tree().change_scene("res://UI/End_Game.tscn")
